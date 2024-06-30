#!/bin/bash

# Set directory paths
data_dir="Data"
csv_file="$data_dir/filtered_data.csv"
db_file="$data_dir/processed_data.db"

# 1. Check if the `Data` directory exists
if [ ! -d "$data_dir" ]; then
  echo "Error: Directory '$data_dir' does not exist."
  exit 1
fi

# 2. Simulate data pipeline execution (replace with actual execution)
# This is a placeholder; you'll likely need to modify it for your specific code
echo "Simulating data pipeline execution..."
python your_script.py  # Replace with the actual script to run

# 3. Check if the CSV file exists
if [ ! -f "$csv_file" ]; then
  echo "Error: CSV file '$csv_file' not found."
  exit 1
fi

# 4. Check if the SQLite database exists
if [ ! -f "$db_file" ]; then
  echo "Error: SQLite database '$db_file' not found."
  exit 1
fi

# 5. (Optional) Validate CSV file contents (e.g., number of rows, columns)
# You can use tools like `wc -l` or `head -n 5 $csv_file` to check basic structure
# Or, if you have specific expectations, add custom checks here

# 6. (Optional) Validate SQLite database contents (e.g., table schema, data integrity)
# You can use `sqlite3 $db_file ".schema"` or similar commands to inspect schema
# Or, if you have specific expectations, add custom checks here using `sqlite3`

echo "Tests passed!"

