# Welcome to your new project Python! Follow through the steps below to start

This repository is meant as a template for Python projects with full virtual environment and Python versioning support on VS Code. 

Below you find instructions for setting it up.

## Recommended tools

1. Python3;
2. Git;
3. VS Code;
4. VS Code Python Extension (should auto install Pylance, Python Debugger, and Python Environments).

## Setting up your project environment

1. `git clone` this repository;
2. Open the cloned folder on VS Code;
3. On the Powershell Terminal, run `uv init --no-pin-python` to start the project with support to python version changes, and to write a first `.toml` file to the folder;
4. Then run `uv add module1 module2 moduleN;;uv sync` with the list of dependencies needed for your project.

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

## Using debugging and profiling tools
Aside from the `Run and Debug` functionality on VS Code, `pytest` allows for a better debugging experience on a dedicated tab. Just add it as a dependency and take the following conventions:
1. Add `pytest` by running `uv add pytest` on the VS Code Terminal;
2. Save your files with the `test_` prefix, e.g. `test_main.py` to use auto-recognition;
3. Save the functions you need tested with a `test_` prefix also;
4. (Optional) Keep all test files within a `tests/` folder for ease of maintainability.

Now you can use the dedicated tab to run your tests. To use it on terminal, do as follows:
- Run `uv run pytest --pdb` on the VS Code Terminal to debg;

### Native `pytest` VS Code support

VS Code has native support to `pytest`, though:
1. Go to the `Testing` tab on the left interface side (looks like a Beaker). If you can't see it, go to the Python tab instead, after that it should show up on the left.
2. Click `Initialize Testing Environment`;
3. Over the top search bar you'll be prompted to `Configure Tests`. Select `pytest`.
4. Select the `tests/` folder or any other wanted as root for test files.

### Using `Flamegraph` for profiling (Recommended)

`Flamegraph` is a VS Code Extension that works with `py-spy`. It is the closest option to MATLAB'S Profiler tool and will open a unique tab with bar data that shows performance data on hover. It will also show time spent per line on file.
1. Run `uv add --dev py-spy` to add the dependency;
2. Install the `Flamegraph` extension;
3. Open the file and the drop down to execute, select `Flamegraph: Profile with py-spy`.

### Using `scalene` for execution time (For detailed information)

Note that `scalene` will only profile code that runs for over `1 second` or that uses at least `10 MB`.

Steps for manual run:
1. Run `uv add scalene`;
2. Run `uv run scalene run /path/to/test_file.py --profile-all` on your `test_file`.

You can also just run the utilitary script `.\scprof.ps1 \path\to\file` on your Terminal for convenience

### Using `snakeviz` for profiling (Generally equivalent to `Flamegraph`)

This will create a `.html` file that opens on your browser. The design isn't great but works fine and with more overall detail than Flamegraph.

#### Automated script
If you're on Windows, go to the Terminal and run `.\skprof.ps1 \path\to\file`. 

#### Manual Process
1. Add it to your environment by running `uv add --dev snakeviz` on Terminal;
2. Generate the profile binary using `cProfile`: `uv run python -m cProfile -o profile.prof /path/to/file.py`;
3. Launch the UI with `uv run snakeviz profile.prof`.