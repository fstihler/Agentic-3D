# Agentic3D

## Project Abstract

This project investigates the application of Large Language Models (LLMs) as agents to bridge textual and visual modalities, focusing on the generation and refinement of 3D models from textual descriptions. Using OpenSCAD, a code-based 3D modeling platform, the system translates text into code, which is then rendered into visual representations for evaluation. A modality-switching feedback loop integrates Vision-Language Models (VLMs) to analyze these renderings, enabling iterative refinement of the generated models. The workflow is orchestrated by a Commander Agent, coordinating multiple specialized agents to ensure seamless interaction between components. Performance evaluation across three object complexity levels (low, medium, high) demonstrates that the system excels at generating and refining low-complexity models, with diminishing performance as object complexity increases. Metrics such as the mean maximum quality score and the mean improvement score highlight the system’s effectiveness in refining simpler models. These findings underscore the potential of LLMs as versatile agents for bridging modalities and generating 3D content.

**#####** Authors
Moritz Rietschel <rietschel@berkeley.edu>,
Reet Mishra <reet.mishra@berkeley.edu>,
Sammie Shenon <sshenon@berkeley.edu>,
Frederik Stihler <frederik.stihler@berkeley.edu>

## Installation

To install the package, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/reetm09/agentic3d.git
    cd agentic3d/agentic3d
    ```

2. Create a virtual environment:
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```

3. Install the required dependencies:
    ```bash
    pip install -r requirements.txt
    ```

## Running the Module

To run the module as seen in `notebooks/interface.ipynb`, follow these steps:

1. Ensure you are in the virtual environment:
    ```bash
    source venv/bin/activate
    ```

2. Create an IPython kernel for your jupyter notebook:
    ```bash
    poetry run ipython kernel install --name "agentic3d-py3.11" --user
    ```

2. Navigate to the `notebooks` directory:
    ```bash
    cd notebooks
    ```

3. Run the Jupyter notebook:
    ```bash
    jupyter notebook interface.ipynb
    ```

4. Follow the instructions in the notebook to interact with the system.

## Usage

The system is designed to translate textual descriptions into 3D models using OpenSCAD and refine them iteratively with the help of Vision-Language Models (VLMs). The Commander Agent coordinates the workflow, ensuring seamless interaction between components. 

## Performance Evaluation

The system's performance is evaluated across three object complexity levels (low, medium, high). It excels at generating and refining low-complexity models, with diminishing performance as object complexity increases. Metrics such as the mean maximum quality score and the mean improvement score highlight the system’s effectiveness in refining simpler models. For more details on our metrics and results, refer to our paper as well as code provided there.

## Conclusion

This project demonstrates the potential of LLMs as versatile agents for bridging textual and visual modalities and generating 3D content. 

## Troubleshooting

This package utilizes the Autogen framework and currently with the chat-gpt-4o-mini model. Ensure your OPENAI_API_KEY is in your OS system path.
