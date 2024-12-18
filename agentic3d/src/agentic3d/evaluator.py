from autogen import ConversableAgent

from agentic3d._constants import (
    DEFAULT_EVALUATOR_AGENT_SYSTEM_MESSAGE,
    MAX_ITERATIONS,
)
from agentic3d.agents import AgentBuilder
from agentic3d.utils import remove_cache


class Evaluator:
    def __init__(
        self,
        agentic3d_objects: dict,
        evaluator_system_message: str = DEFAULT_EVALUATOR_AGENT_SYSTEM_MESSAGE,
    ):
        """
        Initializes the Evaluator class with the provided agentic3d objects and system message for the evaluator agent.
        Args:
            agentic3d_objects (dict): A dictionary containing the agentic3d objects categorized as easy, medium, and hard.
            evaluator_system_message (str, optional): The system message to be used by the evaluator agent. Defaults to DEFAULT_EVALUATOR_AGENT_SYSTEM_MESSAGE.
        """

        self.agentic3d_objects = agentic3d_objects
        self.easy_objects = agentic3d_objects["easy"]
        self.medium_objects = agentic3d_objects["medium"]
        self.hard_objects = agentic3d_objects["hard"]
        self.evaluator_system_message = evaluator_system_message

        self.designerAgent = self.build_agent(is_user=True)
        self.evaluatorAgent = self.build_agent(
            is_user=False, system_message=self.evaluator_system_message
        )

    def build_agent(self, is_user: bool = False, system_message: str = None):
        """
        Builds and returns an agent based on the provided parameters.
        Args:
            is_user (bool, optional): If True, builds a designer agent. Defaults to False, to build an evaluator agent.
            system_message (str, optional): The system message to be used by the agent. Defaults to None.
        Returns:
            Autogen Agent: either UserProxyAgent or ConversableAgent
        """
        ab = AgentBuilder(eval=True)
        if is_user:
            designer_agent = ab.build_designer_agent()
            return designer_agent
        else:
            evaluator_agent = ab.build_evaluator_agent(system_message)
            return evaluator_agent

    def _evaluate_object_per_desc_per_img(
        self,
        user_desc: str,
        img_filepath: str,
        clear_cache: bool = False,
    ) -> int:
        """
        Evaluates an object based on intended user description and an image file path.
        Args:
            user_desc (str): The description of the object provided by the user.
            img_filepath (str): The file path to the image of the object.
            clear_cache (bool, optional): If True, clears the cache before evaluation. Defaults to False.
        Returns:
            int: The rating provided by the evaluator agent based on the image and description.
        """

        if clear_cache:
            remove_cache()

        evaluation_feedback = self.designerAgent.initiate_chat(
            recipient=self.evaluatorAgent,
            message=f"""
                        Here is the image <img {img_filepath}>. 
                        Here is the intended image description: {user_desc}.
                        Please provide rating and nothing else.
                        """,
            max_turns=1,
            summary="last_msg",
        )

        feedback = evaluation_feedback.summary

        try:
            rating = int(feedback.split(":")[-1].strip())
        except ValueError as e:
            print(f"[ERROR] An error occurred during extracting rating as integer: {e}")
            print(f"[ERROR] USER_DESC: {user_desc}")
            print(f"[ERROR] IMG_FILEPATH: {img_filepath}")
        except Exception as e:
            print(f"[ERROR] Unknown error occurred while evaluating: {e}")
            print(f"[ERROR] USER_DESC: {user_desc}")
            print(f"[ERROR] IMG_FILEPATH: {img_filepath}")

        return rating

    def _evaluate_object_per_desc_per_workflow(
        self,
        user_desc: str,
        img_workflow_dir: str,
        clear_cache: bool = False,
        verbose: bool = False,
    ) -> dict:
        """
        Evaluates all objects based on intended user description.
        Args:
            user_desc (str): The description of the object provided by the user.
            clear_cache (bool, optional): If True, clears the cache before evaluation. Defaults to False.
        Returns:
            dict: A dictionary containing the rating for each object based on the user description.
        """
        workflow_num = img_workflow_dir.split("/")[-1]

        workflow_num_ratings = {}
        ratings = []
        for i in range(MAX_ITERATIONS):
            if verbose:
                print(f"[INFO] Evaluating workflow {workflow_num} scene {i}")
            img_filepath = f"{img_workflow_dir}/{workflow_num}_scene_{i}.png"
            rating = self._evaluate_object_per_desc_per_img(
                user_desc, img_filepath, clear_cache
            )
            ratings.append(rating)

        workflow_num_ratings[f"{workflow_num}"] = ratings

        return workflow_num_ratings

    def evaluate_objects(
        self,
        prompt_workflow_dict: dict,
        clear_cache: bool = False,
        verbose: bool = False,
    ) -> dict:
        """
        Evaluates all objects based on intended user description.
        Args:
            user_desc (str): The description of the object provided by the user.
            clear_cache (bool, optional): If True, clears the cache before evaluation. Defaults to False.
        Returns:
            dict: A dictionary containing the rating for each object based on the user description.
        """

        prompt_result_dict = {}
        for prompt, workflow_nums in prompt_workflow_dict.items():
            for workflow_num in workflow_nums:
                workflow_num_dir = f"../renders/{workflow_num}"
                prompt_result_dict[prompt] = (
                    self._evaluate_object_per_desc_per_workflow(
                        prompt, workflow_num_dir, clear_cache, verbose
                    )
                )

        return prompt_result_dict
