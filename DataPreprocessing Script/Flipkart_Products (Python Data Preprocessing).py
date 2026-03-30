# Flipkart Product Project
#-------------------------

import pandas as pd
import numpy as np

file = "C:/Users/rajsh/OneDrive/Desktop/Personal Project/Analytics Project/Flipkart Product Listings/flipkart Product.csv"

df = pd.read_csv(file)

#           Dataset Exploration:
#           ====================

# Checking the dimension of the dataset to understand
# number of columns and rows in the dataset
df.shape

# Understanding the columns datatype and no-null 
# values in each columns
df.info()

# Understanding the statistics of the dataset for all 
# numeric columns.
df.describe()

#           Handling Missing Values:
#           ========================

# Checking missing values in the dataset.
df.isnull().sum()
# Found missing values in "Size" Colum.

df["size"] = df["size"].fillna(df["size"].mode()[0])

#           Handling Duplicate entries:
#           ===========================

# Checking duplicate entries in the dataset:
df.duplicated().sum()


#           precision formatting:
#           =====================

# precision formatting the column shipping_weight_g
df["shipping_weight_g"] = round(df["shipping_weight_g"], 2)

# precision formatting the column "payment_modes"
df["payment_modes"] = df["payment_modes"].str.replace(",","|")
df["payment_modes"]

#           Checking Min-Max Values:
#           ========================

# Checking min and max values from all the numeric columns
# in the dataframe
num_columns = df.select_dtypes(include=["number"])
num_columns.dtypes

for column in num_columns.columns:
    print("-" * 40)
    print(f"Column: {column}")
    print(f"Min Value: {num_columns[column].min()}")
    print(f"Max Value: {num_columns[column].max()}")


# CREATING A DATAFRAME:
# ---------------------

# Creating a empty list variable and then loading all data
# to the list from the loop in a dictionary type and then
# Creating a DataFrame from the variable storing the values

summary = []

for column in num_columns.columns:
    summary.append({
    "column" : column,
    "min": num_columns[column].min(),
    "max": num_columns[column].max()
    })
summary_df = pd.DataFrame(summary)

print(summary_df)

# Saving the cleaned data to a new csv file
df.to_csv("Cleaned_Flipkart_Products_Data.csv", index=False)

# Checking where the file got saved.
import os
print(os.getcwd())

#==============================================================
