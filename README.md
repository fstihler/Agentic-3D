# Agentic3D

## Project Abstract

This project investigates the application of Large Language Models (LLMs) as agents to bridge textual and visual modalities, focusing on the generation and refinement of 3D models from textual descriptions. Using OpenSCAD, a code-based 3D modeling platform, the system translates text into code, which is then rendered into visual representations for evaluation. A modality-switching feedback loop integrates Vision-Language Models (VLMs) to analyze these renderings, enabling iterative refinement of the generated models. The workflow is orchestrated by a Commander Agent, coordinating multiple specialized agents to ensure seamless interaction between components. Performance evaluation across three object complexity levels (low, medium, high) demonstrates that the system excels at generating and refining low-complexity models, with diminishing performance as object complexity increases. Metrics such as the mean maximum quality score and the mean improvement score highlight the system’s effectiveness in refining simpler models. These findings underscore the potential of LLMs as versatile agents for bridging modalities and generating 3D content.

#### *Authors*
Moritz Rietschel <rietschel@berkeley.edu>,
Reet Mishra <reet.mishra@berkeley.edu>,
Sammie Shenon <sshenon@berkeley.edu>,
Frederik Stihler <frederik.stihler@berkeley.edu>

## Installation

Before installing agentic3d, make sure you have `poetry` <https://python-poetry.org/docs> installed:

- Check `poetry` version:
    ```bash
    poetry -V
    ```

Now, to install the `agentic3d` package, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/reetm09/agentic3d.git
    cd agentic3d/agentic3d
    ```

2. Build virtual environment and install dependencies:
    ```bash
    poetry install
    ```

    This is what the output should look like
    ```
    Creating virtualenv agentic3d in /path/to/agentic3d/agentic3d
    Installing dependencies from lock file

    Package operations: 131 installs, 1 update, 0 removals

    - Installing attrs (24.3.0)
    - Installing rpds-py (0.22.3)
    - Installing referencing (0.35.1)
    - Installing six (1.17.0)
    - Installing jsonschema-specifications (2024.10.1)
    - Installing platformdirs (4.3.6)
    - Installing python-dateutil (2.9.0.post0)
    - Installing traitlets (5.14.3)
    - Installing types-python-dateutil (2.9.0.20241206)
    - Installing arrow (1.3.0)
    - Installing fastjsonschema (2.21.1)
    - Installing jsonschema (4.23.0)
    - Installing jupyter-core (5.7.2)
    - Installing pycparser (2.22)
    - Installing pyzmq (26.2.0)
    - Installing tornado (6.4.2)
    - Installing cffi (1.17.1)
    - Installing fqdn (1.5.1)
    - Installing idna (3.10)
    - Installing isoduration (20.11.0)
    - Installing jsonpointer (3.0.0)
    - Installing jupyter-client (8.6.3)
    - Installing markupsafe (3.0.2)
    - Installing nbformat (5.10.4)
    - Installing ptyprocess (0.7.0)
    - Installing rfc3339-validator (0.1.4)
    - Installing rfc3986-validator (0.1.1)
    - Installing soupsieve (2.6)
    - Installing uri-template (1.3.0)
    - Installing webcolors (24.11.1)
    - Installing webencodings (0.5.1)
    - Installing argon2-cffi-bindings (21.2.0)
    - Installing asttokens (3.0.0)
    - Installing beautifulsoup4 (4.12.3)
    - Installing bleach (6.2.0)
    - Installing defusedxml (0.7.1)
    - Installing executing (2.1.0)
    - Installing jinja2 (3.1.4)
    - Installing jupyterlab-pygments (0.3.0)
    - Installing mistune (3.0.2)
    - Installing nbclient (0.10.1)
    - Installing packaging (24.2)
    - Installing pandocfilters (1.5.1)
    - Installing parso (0.8.4)
    - Installing pure-eval (0.2.3)
    - Installing pygments (2.18.0)
    - Installing python-json-logger (3.2.1)
    - Installing pyyaml (6.0.2)
    - Installing sniffio (1.3.1)
    - Installing terminado (0.18.1)
    - Installing tinycss2 (1.4.0)
    - Installing typing-extensions (4.12.2)
    - Installing wcwidth (0.2.13)
    - Installing anyio (4.7.0)
    - Installing argon2-cffi (23.1.0)
    - Installing certifi (2024.12.14)
    - Installing charset-normalizer (3.4.0)
    - Installing decorator (5.1.1)
    - Installing h11 (0.14.0)
    - Installing jedi (0.19.2)
    - Installing jupyter-events (0.11.0)
    - Installing jupyter-server-terminals (0.5.3)
    - Installing matplotlib-inline (0.1.7)
    - Installing nbconvert (7.16.4)
    - Installing overrides (7.7.0)
    - Installing pexpect (4.9.0)
    - Installing prometheus-client (0.21.1)
    - Installing prompt-toolkit (3.0.48)
    - Installing send2trash (1.8.3)
    - Installing stack-data (0.6.3)
    - Installing urllib3 (2.2.3)
    - Installing websocket-client (1.8.0)
    - Installing annotated-types (0.7.0)
    - Installing appnope (0.1.4)
    - Installing babel (2.16.0)
    - Installing comm (0.2.2)
    - Installing debugpy (1.8.11)
    - Installing frozenlist (1.5.0)
    - Installing httpcore (1.0.7)
    - Installing ipython (8.30.0)
    - Installing json5 (0.10.0)
    - Installing jupyter-server (2.14.2)
    - Installing multidict (6.1.0)
    - Installing nest-asyncio (1.6.0)
    - Installing propcache (0.2.1)
    - Installing psutil (6.1.0)
    - Installing pydantic-core (2.27.2)
    - Installing requests (2.32.3)
    - Installing wrapt (1.17.0)
    - Installing zipp (3.21.0)
    - Installing aiohappyeyeballs (2.4.4)
    - Installing aiosignal (1.3.2)
    - Installing async-lru (2.0.4)
    - Installing deprecated (1.2.15)
    - Installing distro (1.9.0)
    - Installing httpx (0.28.1)
    - Installing importlib-metadata (8.4.0)
    - Installing ipykernel (6.29.5)
    - Installing jiter (0.8.2)
    - Installing jupyter-lsp (2.2.5)
    - Installing jupyterlab-server (2.27.3)
    - Installing notebook-shim (0.2.4)
    - Installing pydantic (2.10.4)
    - Installing regex (2024.11.6)
    - Updating setuptools (70.1.0 -> 75.6.0)
    - Installing tqdm (4.67.1)
    - Installing yarl (1.18.3)
    - Installing aioconsole (0.8.1)
    - Installing aiohttp (3.11.11)
    - Installing asyncio-atexit (1.0.1)
    - Installing jsonref (1.1.0)
    - Installing jupyterlab (4.3.4)
    - Installing jupyterlab-widgets (3.0.13)
    - Installing numpy (1.26.4)
    - Installing openai (1.58.1)
    - Installing opentelemetry-api (1.27.0)
    - Installing pillow (11.0.0)
    - Installing protobuf (4.25.5)
    - Installing tiktoken (0.8.0)
    - Installing widgetsnbextension (4.0.13)
    - Installing autogen-core (0.4.0.dev11)
    - Installing diskcache (5.6.3)
    - Installing docker (7.1.0)
    - Installing flaml (2.3.3)
    - Installing ipywidgets (8.1.5)
    - Installing jupyter-console (6.6.3)
    - Installing notebook (7.3.1)
    - Installing python-dotenv (1.0.1)
    - Installing termcolor (2.5.0)
    - Installing autogen-agentchat (0.4.0.dev11)
    - Installing jupyter (1.1.1)
    - Installing pyautogen (0.5.3)

    Installing the current project: agentic3d (0.1.0)
    ```


3. You can check that a virtual environment has been created:
    ```bash
    poetry env list
    ```

## Run agentic3D using Jupyter Notebook

4. Run Juptyer Notebook and navigate to `notebooks/interface.ipynb` as an example:
    ``` bash
    poetry run jupyter notebook notebooks/interface.ipynb
    ```
    


## Run agentic3D using Jupyter Notebook in VSCode (recommended)

It may be better to run this Jupyter Notebook in VSCode so you can easily see your rendered images and code. To do so, follow these steps.

1. Create an IPython kernel for your jupyter notebook. You can change the name to your preference:
    ``` bash
    poetry run ipython kernel install --name "agentic3d-py3.11-env" --user
    ```

2. Open VSCode, and navigate to your cloned directory. You should see a `.venv` directory. Ensure this is there so your virtual environment is set up.

3. Open `notebooks/interface.ipynb`

4. Click `Select Kernel` on the top right corner.

5. Select `Jupter Kernel...`

6. Refresh by clicking on the circular button in top right corner.

7. Select your kernel! `agentic3d-py3.11-env`

8. Now, you should be able to run all the cells in the jupyter notebook. Follow instructions in the notebook for how to interact with the system. You can also open your outputs stored in models/ in OpenSCAD <https://openscad.org/> for more interactivity. Otherwise you can see your rendered images under renders/


## Usage

The system is designed to translate textual descriptions into 3D models using OpenSCAD and refine them iteratively with the help of Vision-Language Models (VLMs). The Commander Agent coordinates the workflow, ensuring seamless interaction between components. 

## Performance Evaluation

The system's performance is evaluated across three object complexity levels (low, medium, high). It excels at generating and refining low-complexity models, with diminishing performance as object complexity increases. Metrics such as the mean maximum quality score and the mean improvement score highlight the system’s effectiveness in refining simpler models. For more details on our metrics and results, refer to our paper as well as code provided there.

## Conclusion

This project demonstrates the potential of LLMs as versatile agents for bridging textual and visual modalities and generating 3D content. 

## Troubleshooting

1. This package utilizes the Autogen framework and currently with the chat-gpt-4o-mini model. Ensure your OPENAI_API_KEY is in your OS system path.
2. If you are having trouble with the Jupyter kernel in VSCode. Make sure poetry is configured to recognize in project shells.

    ```bash
    poetry config virtualenvs.in-project true
    ```
