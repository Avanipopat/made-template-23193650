!/bin/bash

python /project/pipeline.py


echo "Press any key to continue..."
read -n 1 -s


#!/bin/bash

# Full path to the Python executable
#PYTHON_EXECUTABLE="C:/Users/z004wezy/AppData/Local/Programs/Python/Python312/python.exe"

# Full path to the pipeline.py script
#PYTHON_SCRIPT="C:/Users/z004wezy/Desktop/teaching/Project/pipeline.py"

# Run the Python script
$PYTHON_EXECUTABLE $PYTHON_SCRIPT

# Prevent the terminal from closing immediately
echo "Press any key to continue..."
read -n 1 -s
