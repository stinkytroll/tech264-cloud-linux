# Content's Table

- [Content's Table](#contents-table)
- [Scripting vs Programming](#scripting-vs-programming)
  - [Scripting](#scripting)
  - [Programming](#programming)
- [Running Python Scripts from the Command Line](#running-python-scripts-from-the-command-line)
  - [Basic Steps](#basic-steps)
- [Understanding Command-Line Arguments in Python](#understanding-command-line-arguments-in-python)
  - [What are Command-Line Arguments?](#what-are-command-line-arguments)
  - [How to Access Command-Line Arguments](#how-to-access-command-line-arguments)
    - [Example](#example)
    - [Run the script in the CL](#run-the-script-in-the-cl)
    - [Output](#output)
- [Automating DB VM Using a Script text](#automating-db-vm-using-a-script-text)
  
  

# Scripting vs Programming

## Scripting
- **Complexity:** usually simpler
- **Purpose:** usually to automate simple or routine tasks
- **Execution:** usually by an interpreter
- **Development cycle:** usually shorter
- **Learning curve:** usually easier to learn

## Programming
- **Complexity:** usually more complex, often includes more complex logic, data structures, and algorithms
- **Purpose:** much wider purpose, including large applications and games
- **Execution:** either interpreted or needs to be compiled before being run
- **Development cycle:** usually longer and more involved in SDLC phases
- **Learning curve:** usually more involved to learn, including software design patterns

# Running Python Scripts from the Command Line

## Basic Steps

1. **Open your terminal** or command prompt.

2. **Navigate to the directory** where your Python script is stored:
    ```bash
    cd /path/to/your/script
    ```

3. **Run the Python script** using the `python` or `python3` command:
    ```bash
    python script_name.py
    ```
    or
    ```bash
    python3 script_name.py
    ```


# Understanding Command-Line Arguments in Python

## What are Command-Line Arguments?
Command-line arguments are parameters passed to a Python script at the time of execution. They allow users to customize the behavior of a script without changing its source code.

## How to Access Command-Line Arguments

To access command-line arguments in Python, you can use the `sys` module, which provides access to the list of arguments passed to the script.

### Example

```python
import sys

if len(sys.argv) < 3:
    print("Usage: python example_script.py <arg1> <arg2>")
else:
    print(f"Argument 1: {sys.argv[1]}")
    print(f"Argument 2: {sys.argv[2]}")
```

### Run the script in the CL

`python example_script.py hello world`

### Output

`Argument 1: hello`

`Argument 2: world`

# Automating DB VM Using a Script [text](db_prov.sh)
Running the below script configures a VM running on Linux Ubuntu 22.04 LTS Gen 2 to host a Database by:

Updating packages.
Upgarding packages.
Installing gnupg and curl.
Download and add MongoDB GPG key for package verification.
Add MongoDB repository to the sources list.
Update package list again to include the newly added MongoDB repository
Install MongoDB version 7.0.6 and specific associated packages.
Enable MongoDB service.
Modify MongoDB configuration to allow remote connections.
Restart MongoDB service to apply configurations

Automating pm2 to run our app.
Installing pm2 (process manager).