from agentic3d._constants import (
    DEFAULT_FEEDBACK_AGENT_SYSTEM_MESSAGE,
    DEFAULT_OPENSCAD_GENERATOR_AGENT_SYSTEM_MESSAGE,
    DEFAULT_PROMPT_IMPROVER_AGENT_SYSTEM_MESSAGE,
    MAX_ITERATIONS,
)
from agentic3d.agents import AgentBuilder
from agentic3d.utils import remove_cache, render_scene


class Workflow:
    """
    Workflow class to manage the iterative process of generating and refining OpenSCAD code
    based on user feedback.
    """

    def __init__(
        self,
        prompt: str,
        name: str = "workflow_0",
        openscad_generator_system_message: str = DEFAULT_OPENSCAD_GENERATOR_AGENT_SYSTEM_MESSAGE,
        feedback_system_message: str = DEFAULT_FEEDBACK_AGENT_SYSTEM_MESSAGE,
        prompt_improver_system_message: str = DEFAULT_PROMPT_IMPROVER_AGENT_SYSTEM_MESSAGE,
    ):
        """
        Initialize the Workflow instance.
        Args:
            prompt (str): The initial prompt provided by the user.
            name (str): The unique name of the workflow instance. Default is "workflow_0".
            openscad_generator_system_message (str): The system message for the OpenSCAD generator agent.
            feedback_system_message (str): The system message for the feedback agent.
            prompt_improver_system_message (str): The system message for the prompt improver agent.
        Raises:
            ValueError: If no agents are retrieved.
        """
        self.workflow_name = name
        self.initial_prompt = prompt
        self.openscad_generator_system_message = openscad_generator_system_message
        self.feedback_system_message = feedback_system_message
        self.prompt_improver_system_message = prompt_improver_system_message

        self.all_agents = self.build_agents()

    def build_agents(self) -> dict:
        """
        Build the agents required for the workflow.

        Returns:
            dict: A dict of agents built by the AgentBuilder.

        Raises:
            ValueError: If no agents are retrieved.
        """
        ab = AgentBuilder(
            False,
            self.openscad_generator_system_message,
            self.feedback_system_message,
            self.prompt_improver_system_message,
        )

        if ab.all_agents is None:
            raise ValueError(
                "Retrieved No Agents. Check if Agents were built correctly."
            )
        return ab.get_all_agents_dict()

    def get_workflow_name(self) -> int:
        """
        Retrieve the unique name for the instance. This is the same name as the folder for rendering.
        Returns:
            int: The unique name of the instance.
        """
        return self.workflow_name

    def run(
        self, clear_cache: bool = False, implement_prompt_improver: bool = False
    ) -> list:
        """
        Executes the workflow for generating and iterating on OpenSCAD code with feedback loops.
        Args:
            clear_cache (bool): If True, clears the cache before starting the workflow so that
            Autogen calls OpenAI API again. Default is False.
            implement_prompt_improver (bool): If True, implements the prompt improver agent in the workflow.
        Returns:
            list: A list of chat history objects containing summaries of the interactions between agents.
        Workflow:
            1. Optionally clears the cache if `clear_cache` is True.
            2. Initializes the designer agent, OpenSCAD generator agent, and feedback agent. Optionally, initializes the prompt improver agent.
            3. Starts the first iteration by initiating a chat between the designer agent and OpenSCAD generator agent.
            4. Renders the initial scene based on the generated OpenSCAD code.
            5. Iteratively:
                a. Sends the current render and description to the feedback agent for feedback.
                b. Sends the feedback and current OpenSCAD code to the OpenSCAD generator agent for improvements.
                c. Updates the feedback, OpenSCAD code, and rendered image.
                d. Continues until the maximum number of iterations is reached.
                Each iteration is wrapped with a progress bar. The results are stored with a folder with the workflow name
                under models/ for all the OpenSCAD code files, and under renders/ for all the rendered images.
        """

        if clear_cache:
            remove_cache()

        designerAgent = self.all_agents["user_designer_agent"]
        openSCADGeneratorAgent = self.all_agents["openscad_generator_agent"]
        feedbackAgent = self.all_agents["feedback_agent"]
        promptImproverAgent = self.all_agents["prompt_improver_agent"]

        iteration = 0

        if implement_prompt_improver:
            improved_prompt_all = designerAgent.initiate_chat(
                promptImproverAgent,
                message=self.initial_prompt,
                max_turns=1,
                summary="last_msg",
            )
            improved_prompt = improved_prompt_all.summary
            initial_prompt = improved_prompt
        else:
            initial_prompt = self.initial_prompt

        dynamic_code_all = designerAgent.initiate_chat(
            openSCADGeneratorAgent,
            message=initial_prompt,
            max_turns=1,
            summary="last_msg",
        )
        dynamic_code = dynamic_code_all.summary
        img_filepath = render_scene(
            dynamic_code_all.summary,
            f"{self.get_workflow_name()}",
            f"{self.get_workflow_name()}",
            f"{self.get_workflow_name()}_scene_{iteration}.scad",
            f"{self.get_workflow_name()}_scene_{iteration}.png",
        )

        feedback = initial_prompt

        # TODO: wrap with tqdm
        while iteration < MAX_ITERATIONS:
            print(f"---------ITERATION {iteration}---------")

            chat_history = openSCADGeneratorAgent.initiate_chats(
                [
                    {
                        "recipient": feedbackAgent,
                        "message": f"""
                        Here is the image of the current render <img {img_filepath}>. 
                        Here is the description: {feedback}.
                        Please provide more feedback.
                        """,
                        "max_turns": 1,
                        "summary_method": "last_msg",
                    },
                    {
                        "recipient": openSCADGeneratorAgent,
                        "message": f"""
                        The user has provided the following description:
                        {initial_prompt}
                        This is the current executable OpenSCAD code: 
                        {dynamic_code}. Improve this code and generate new OpenSCAD code based on feedback.
                        """,
                        "max_turns": 1,
                        "summary_method": "last_msg",
                    },
                ]
            )

            iteration += 1
            feedback = chat_history[0].summary
            dynamic_code = chat_history[1].summary
            img_filepath = render_scene(
                dynamic_code,
                f"{self.get_workflow_name()}",
                f"{self.get_workflow_name()}",
                f"{self.get_workflow_name()}_scene_{iteration}.scad",
                f"{self.get_workflow_name()}_scene_{iteration}.png",
            )

            print(f"All {iteration} iterations completed.")
        return chat_history

    def __repr__(self):
        return f"Workflow({self.workflow_name})"
