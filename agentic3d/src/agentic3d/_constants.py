import os

# Seed for consistency
RANDOM_SEED = 42

# Scene description
DEFAULT_USER_DESCRIPTION = "designer chair"

# Max iterations per workflow
MAX_ITERATIONS = 10

# Number of workflows per object
NUM_WORKFLOWS = 3

# Rendering settings
IMAGE_SIZE = (800, 600)  # Width, Height in pixels

# Camera settings
CAMERA_POSITION = [25.40, 4.02, 46.29]  # x, y, z position of the camera
CAMERA_LOOK_AT = [0, 0, 0]  # x, y, z point the camera looks at
CAMERA_ANGLE = 90  # Camera angle in degrees

PERMANENT_MODEL_CODE = """
    // Permanent Model (Black)
    color([0, 0, 0]) {
        // Your permanent model code here
        cube([100,0.1,0.1], center = false);
        cube([0.1,100,0.1], center = false);
        cube([0.1,0.1,100], center = false);
    }
    """

# File Paths
MODELS_DIR = "../models"
RENDERS_DIR = "../renders"
CACHE_DB = "../notebooks/.cache/41/cache.db"

# LLM Configuration
LLM_CONFIG = {
    "config_list": [{"model": "gpt-4o-mini", "api_key": os.getenv("OPENAI_API_KEY")}]
}

# AGENT SYSTEM MESSAGES
DEFAULT_OPENSCAD_GENERATOR_AGENT_SYSTEM_MESSAGE = """You are a CAD agent that takes a user request and responds 
            only with executable OpenSCAD code. Please keep the following dimensions in mind when 
            creating the object, as the perspective is fixed for the following space: 100 x 100 x 100
            You only write CAD code to construct the object, never to render or display it.
            Output the code as a string, without any coding block or other annotations.
"""
DEFAULT_FEEDBACK_AGENT_SYSTEM_MESSAGE = """You are an image feedback agent. 
            Your role is to examine rendered images (from OpenSCAD code) and confirm whether they match the user’s initial description. 
            If they do match, respond with 'TERMINATE_MATCH'.
            Do not give feedback on the color.
            If they don't match provide suggestions for how the scene can be improved in a structured way.
            Give your feedback in instructive bullets. 
            Start with 
            'Initial User Description': 
            'Feedback:'
            """

DEFAULT_EVALUATOR_AGENT_SYSTEM_MESSAGE = """You are an image evaluator feedback agent.
            Your role is to examine rendered images (from OpenSCAD code) and confirm whether they match the user’s initial description 
            Rate each image on a scale of 1 to 10 for how well each rendered image represents the intended description.
            A rating of 1 means the render DOES NOT match the scene description and is very poor. 
            A rating of 5 means the render DOES match the intended scene description but it is not very good. 
            A rating of 10 means the render perfectly matches the intended scene description and 
            the render does not need to be altered at all.
            Give your feedback in instructive bullets. 
            Start with
            'Initial User Description':
            'Feedback:'
            'Rating:'
            """


DEFAULT_COMMANDER_AGENT_SYSTEM_MESSAGE = """ You are a CAD agent. Help me render openSCAD code.
    If you are provided with OpenSCAD code, suggest a tool call to render the OpenSCAD code.
    """

DEFAULT_PROMPT_IMPROVER_AGENT_SYSTEM_MESSAGE = """
    You are a specialized assistant tasked with enhancing user descriptions for generating OpenSCAD code. 
    Your goal is to transform brief or vague descriptions into concise and clear instructions while preserving the simplicity and intent of the original request. 
    Avoid adding unnecessary complexity or additional features that were not implied by the user. 
    Focus on making the description specific enough to guide accurate code generation.
    Be very concise.
    Example:
    Input: "a chair"
    Output: "A simple four-legged chair with a square seat and a flat backrest."
    """

DEFAULT_CODER_AGENT_SYSTEM_MESSAGE = """
    You are a CAD agent that takes a user request or user feedback and responds only with executable OpenSCAD code. 
    Please keep the following dimensions in mind when creating the object, as the perspective is fixed for the following space: 100 x 100 x 100
    You only write CAD code to construct the object, never to render or display it.
    Output the code as a string, without any coding block or other annotations.
    If you receive feedback from the user, take the previously existing code and improve the SCAD code based on the suggestions for improvement.
    Once you receive a message that the code has been executed successfully, reply  with 'TERMINATE'
    """

DEFAULT_CRITIC_AGENT_SYSTEM_MESSAGE = """
    You are an image feedback agent. 
    Your role is to examine rendered images (generated from OpenSCAD code) and assess how accurately they align with the user’s intended description. 
    If discrepancies exist, your task is to provide structured suggestions to bring the object closer to the described intent.
    Give your feedback in detailed but precise and instructive bullets.
    Suggest concret and concise actions for the coding agent.
    If the image is empty (only shows axes), reply "Render is empty, please attempt again.".
    Stick to the user description. Do not suggest additional features for the object that are not in the user description.
    Do not give feedback on the color and texture.
    If the image and the user description do match, respond only with 'TERMINATE_MATCH'.
    Start with 'Feedback:'
    """

EVAL_OBJECTS_DICT = {
    "easy": [
        "a chair with four legs",
        "a table with four legs",
        "a pyramid",
        "a circular bowl",
        "a cylindrical bottle",
    ],
    "medium": [
        "a curved vase",
        "a candle with a flame",
        "a mug with a handle",
        "a desk lamp",
        "a wine glass",
    ],
    "hard": [
        "a car with four wheels",
        "a spiral staircase",
        "a cathedral",
        "a pair of eye glasses",
        "a wrist watch",
    ],
}
EVAL_OBJECTS_LIST = [
    "a chair with four legs",
    "a table with four legs",
    "a pyramid",
    "a circular bowl",
    "a cylindrical bottle",
    "a curved vase",
    "a candle with a flame",
    "a mug with a handle",
    "a desk lamp",
    "a wine glass",
    "a car with four wheels",
    "a spiral staircase",
    "a cathedral",
    "a pair of eye glasses",
    "a wrist watch",
]
