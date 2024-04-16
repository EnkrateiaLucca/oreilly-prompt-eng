ENV_NAME ?= oreilly-prompt-eng
PYTHON_VERSION ?= 3.10

repo-setup:
	mkdir requirements
	touch requirements/requirements.in
	pip install uv
	uv pip install pip-tools

pip-tools-setup:
	pip install uv
	uv pip install pip-tools setuptools

# Install exact Python and CUDA versions
conda-create:
	conda create -n $(ENV_NAME) python=$(PYTHON_VERSION)

notebook-setup:
	python -m ipykernel install --user --name=$(ENV_NAME)

env-update:
	uv pip compile ./requirements/requirements.in -o ./requirements/requirements.txt
	uv pip sync ./requirements/requirements.txt
