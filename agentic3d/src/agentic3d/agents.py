from autogen import ConversableAgent, UserProxyAgent
from autogen.agentchat.contrib.multimodal_conversable_agent import (
    MultimodalConversableAgent,
)

from agentic3d._constants import LLM_CONFIG


class AgentBuilder:
    """
    AgentBuilder is a class responsible for constructing and managing various agents used in the system.
    These agents include a designer agent, an OpenSCAD generator agent, a feedback agent, a prompt improver agent, and an evaluator agent.
    The class provides methods to build each type of agent and to retrieve all agents as a list or dictionary.
    Attributes:
        all_agents (list): A list of all agents created by the AgentBuilder.
        all_agents_dict (dict): A dictionary mapping agent names to their respective agent instances.
    Methods:
        __init__(eval: bool, generator_system_message: str, feedback_system_message: str, prompt_improver_system_message: str):
            Initializes the AgentBuilder with the provided system messages for the generator and feedback agents.
        build_designer_agent() -> UserProxyAgent:
            Builds and returns a UserProxyAgent named as the designer. This is the user who has a description they want to
            build using OpenSCAD. Acts as a commander agent.
        build_openscad_generator_agent(system_message: str) -> ConversableAgent:
            Builds and returns a ConversableAgent with the role of generating OpenSCAD code given a prompt.
        build_feedback_agent(system_message: str) -> MultimodalConversableAgent:
            Builds and returns a MultimodalConversableAgent with the role of providing feedback on the generated OpenSCAD
            rendered image and initial prompt as well as previous feedback.
        build_prompt_improver_agent(system_message: str) -> ConversableAgent:
            Builds and returns a ConversableAgent with the role of improving the given prompt for 3D modeling.
        build_evaluator_agent(system_message: str) -> MultimodalConversableAgent:
            Builds and returns a MultimodalConversableAgent with the role of an evaluator agent.
        get_all_agents() -> list:
            Returns a list of all agents managed by the AgentBuilder.
        get_all_agents_dict() -> dict:
            Returns a dictionary of all agents managed by the AgentBuilder.
        print_agents() -> None:
    """

    def __init__(
        self,
        eval: bool = False,
        generator_system_message: str = None,
        feedback_system_message: str = None,
        prompt_improver_system_message: str = None,
    ):
        """
        Initializes the agent system with the provided system messages for the generator and feedback agents.
        If eval is set to True, the AgentBuilder will only not build any of these agents at instantiation.
        Args:
            generator_system_message (str): The system message to be used by the OpenSCAD generator agent.
            feedback_system_message (str): The system message to be used by the feedback agent.
            prompt_improver_system_message (str): The system message to be used by the prompt improver agent.
        """

        if not eval:
            self.all_agents = [
                self.build_designer_agent(),
                self.build_openscad_generator_agent(generator_system_message),
                self.build_feedback_agent(feedback_system_message),
                self.build_prompt_improver_agent(prompt_improver_system_message),
            ]

            self.all_agents_dict = {
                "user_designer_agent": self.all_agents[0],
                "openscad_generator_agent": self.all_agents[1],
                "feedback_agent": self.all_agents[2],
                "prompt_improver_agent": self.all_agents[3],
            }

    def build_designer_agent(self) -> UserProxyAgent:
        """
        Builds and returns a UserProxyAgent named as a designer.
        This is essentially the user who has a description for they want to build using OpenSCAD.
        Returns:
            UserProxyAgent: The configured designer agent.
        """
        designerAgent = UserProxyAgent(
            name="designer",
            human_input_mode="NEVER",
            llm_config=LLM_CONFIG,
            code_execution_config=False,
            is_termination_msg=lambda x: x.get("content", "")
            and x.get("content", "").rstrip().endswith("TERMINATE"),
            max_consecutive_auto_reply=1,
        )
        return designerAgent

    def build_openscad_generator_agent(self, system_message: str) -> ConversableAgent:
        """
        Builds and returns a ConversableAgent with the role of an OpenSCAD code generator.
        This agent is responsible for generating OpenSCAD code based on the initial
        description as defined in the provided system message.
        Args:
            system_message (str): The system message to be used by the OpenSCAD generator agent.
        Returns:
            ConversableAgent: The configured OpenSCAD generator agent.
        """
        openSCAD_generatorAgent = ConversableAgent(
            name="openscad_generator",
            llm_config=LLM_CONFIG,
            system_message=system_message,
        )
        return openSCAD_generatorAgent

    def build_feedback_agent(self, system_message: str) -> MultimodalConversableAgent:
        """
        Builds and returns a MultimodalConversableAgent with the role of a feedback agent.
        This agent is responsible for providing feedback based on the image and initial
        description as defined in the provided system message.
        Args:
            system_message (str): The system message to be used by the feedback agent.
        Returns:
            MultimodalConversableAgent: The configured feedback agent.
        """
        feedbackAgent = MultimodalConversableAgent(
            name="feedback",
            llm_config=LLM_CONFIG,
            system_message=system_message,
            is_termination_msg=lambda msg: msg.get("content") is not None
            and "TERMINATE_MATCH" in msg["content"],
            human_input_mode="NEVER",
        )
        return feedbackAgent

    def build_prompt_improver_agent(self, system_message: str) -> ConversableAgent:
        """
        Builds and returns a ConversableAgent with the role of a prompt improver agent.
        This agent is responsible for improving the given prompt for 3D modeling as defined in the provided system message.
        Args:
            system_message (str): The system message to be used by the prompt improver agent.
        Returns:
            ConversableAgent: The configured prompt improver agent.
        """
        promptImproverAgent = ConversableAgent(
            name="prompt_improver",
            system_message=system_message,
            llm_config=LLM_CONFIG,
            is_termination_msg=lambda msg: msg.get("content") is not None
            and "TERMINATE_MATCH" in msg["content"],
            human_input_mode="NEVER",
            max_consecutive_auto_reply=1,
        )
        return promptImproverAgent

    def build_evaluator_agent(self, system_message: str) -> MultimodalConversableAgent:
        evaluatorAgent = MultimodalConversableAgent(
            name="evaluator",
            system_message=system_message,
            llm_config=LLM_CONFIG,
            is_termination_msg=lambda msg: msg.get("content") is not None
            and "TERMINATE_MATCH" in msg["content"],
            human_input_mode="NEVER",
            max_consecutive_auto_reply=1,
        )
        return evaluatorAgent

    def get_all_agents(self) -> list:
        return self.all_agents

    def get_all_agents_dict(self) -> list:
        return self.all_agents_dict

    def print_agents(self) -> None:
        """
        Prints the names of all the agents managed by the AgentBuilder.
        """
        for agent in self.all_agents:
            print(agent.name)
