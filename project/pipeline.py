import pandas as pd
import os
import sqlite3

# Load the datasets
climate_data = pd.read_csv('/Users/avani/Documents/MADE/Project/Breakdown_Region.csv')
temperature_data = pd.read_csv('/Users/avani/Documents/MADE/Project/GlobalLandTemperaturesByCountry.csv')

# Display the first few rows of each dataset
print(climate_data.head())
print(temperature_data.head())

# Merge the datasets on the 'Country' column
merged_data = pd.merge(climate_data, temperature_data, on='Country')

# Ensure there are no NaN values in 'Country' and 'AverageTemperature' columns
merged_data = merged_data.dropna(subset=['Country', 'AverageTemperature'])

# Reset index to avoid alignment issues
merged_data = merged_data.reset_index(drop=True)

# Group by 'Country' and keep the row with the highest 'AverageTemperature'
result_data = merged_data.loc[merged_data.groupby('Country')['AverageTemperature'].idxmax()]

# Ensure the /Data directory exists
output_dir = 'Data'
if not os.path.exists(output_dir):
    os.makedirs(output_dir)

# Save the result to a new CSV file
output_path = os.path.join(output_dir, 'filtered_data.csv')
result_data.to_csv(output_path, index=False)

# Save the result to an SQLite database
db_path = os.path.join(output_dir, 'processed_data.db')
conn = sqlite3.connect(db_path)
result_data.to_sql('ClimateTemperature', conn, if_exists='replace', index=False)
conn.close()

# Display the result
print(result_data)
