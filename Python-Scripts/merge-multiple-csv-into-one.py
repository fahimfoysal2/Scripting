import glob
import os
import pandas as pd

# set the path of the folder containing CSV files
path = './source'

# get a list of all CSV files in the folder
csv_files = glob.glob(os.path.join(path, '*.csv'))

# initialize an empty DataFrame to store merged data
merged_data = pd.DataFrame()

# loop through each CSV file and append its data to the merged DataFrame
for file in csv_files:
    df = pd.read_csv(file)
    merged_data = merged_data.append(df)

# save the merged data to a new CSV file
merged_data.to_csv('merged.csv', index=False)
