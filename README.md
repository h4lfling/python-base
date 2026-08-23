# Welcome to your new project Python! Follow through the steps below to start

This repository is meant as a template for Python projects with full virtual environment and Python versioning support on VS Code. 

Below you find instructions for setting it up.

## Recommended tools

1. Python3;
2. Git;
3. VS Code;
4. VS Code Python Extension (should auto install Pylance, Python Debugger, and Python Environments).

## Setting up your project environment

1. `git clone` this branch;
2. Open the cloned folder;
3. On the Powershell Terminal, run `uv init --no-pin-python` to start the project with support to python version changes, and to write a first `.toml` file to the folder;
4. Then run `uv add module1 module2 moduleN;;uv sync` with the list of modules needed for your project.

The final outlook of your folder should be like this:
```
my_project/                 <-- Root workspace
├── pyproject.toml          <-- Configures the whole project
├── uv.lock
├── .venv/
├── tests/                  <-- Tests sit outside source code
└── src/
    └── my_project/         <-- Only importable code lives here
        └── __init__.py
```