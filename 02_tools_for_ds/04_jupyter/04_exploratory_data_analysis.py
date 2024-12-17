#!/usr/bin/env python
# coding: utf-8

# # Exploratory Data Analysis (EDA)
# Data on Car Features and MSRP \
# Data Source : [Car Features and MSRP](https://www.kaggle.com/datasets/CooperUnion/cardataset) \
# Notebook Guide : [Analysis Steps](https://nbviewer.org/github/Tanu-N-Prabhu/Python/blob/master/Exploratory_data_Analysis.ipynb)

# ## How to perform EDA?
# EDA is the process of understanding the data sets by summarizing their main characteristics (like plotting visually). There is no universal process, it depends on data that what process is more efficient. Follow the steps,
# 

# #### Keywords
# MPG -> Miles per Gallon\
# MSRP -> Manufacturer's Suggested Retail Price

# ### a) Importing Required Libraries

# In[73]:


import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

# %matplotlib inline
# sns.set(color_codes=True)


# ### b) Loading data into DataFrame

# In[74]:


df = pd.read_csv("data/data_for_exploratory_analysis.csv")
df.head()
    # first 5 rows


# In[75]:


df.tail()
    # last 5 rows


# ### c) Check types of Data
# list of all columns including their data types

# In[76]:


df.dtypes


# ### d) Dropping Irrelevant Columns

# In[77]:


df = df.drop(['Engine Fuel Type', 'Market Category', 'Vehicle Style', 'Popularity', 'Number of Doors', 'Vehicle Size'], axis=1)
    # by default axis = 0, and drops rows by index
df = df.drop([0,2])
df.head()


# ### e) Renaming Columns

# In[78]:


df = df.rename(columns={"Engine HP": "HP", "Engine Cylinders": "Cylinders", "Transmission Type": "Transmission", "Driven_Wheels": "Drive Mode","highway MPG": "MPG-H", "city mpg": "MPG-C", "MSRP": "Price" })
df.head(5)


# ### f) Dropping Duplicate Rows

# In[79]:


df.shape
    # row,col


# In[80]:


df.count()


# In[81]:


dup_df = df[df.duplicated()]
dup_df.shape


# In[82]:


"""
total rows 11912
duplicates 989

now removing duplicates
"""

df = df.drop_duplicates()
df.shape


# ### g) Dropping Missing values

# In[83]:


# first check which col has how much missing values
df.isnull().sum()


# HP and cylinders column missing 69, 30 values, which was causing count not equal in every column

# In[84]:


df = df.dropna()
df.count()


# Now count is equal for every column

# ### h) Detecting Outliers
# Detecting outliers for each individual int64 type column

# In[85]:


cols = df.columns
print(df.dtypes)
print(df.head())
for col in cols:
    if(df[col].dtype in ["int64", "float64"]):
        print(col)
        sns.boxplot(x = df[col])
        plt.show()


# #### Now removing the outliers

# In[86]:


# finding Inter Quartile range for each numeric column

numeric_df = df.select_dtypes(include=['int64', 'float64'])
Q1 = numeric_df.quantile(0.25)
Q3 = numeric_df.quantile(0.75)
IQR = Q3 - Q1
print(IQR)


# In[87]:


outlier_condition = ((numeric_df < (Q1 - 1.5 * IQR)) | (numeric_df > (Q3 + 1.5 * IQR)))
outliers = df[outlier_condition.any(axis=1)]
df = df[~outlier_condition.any(axis=1)]
print(df.shape)


# ### i) Plotting features

# #### Histogram

# In[88]:


# Histogram

df["Make"].value_counts().nlargest(30).plot(kind='bar', figsize=(10,5))
	# picking top 30 largest value counts for the bar 
plt.title("Number of cars by make")
plt.xlabel("Make")
plt.ylabel("Number of Cars")
plt.show()



# In[89]:


df["Make"].value_counts().nlargest(10)
	# shows each types count under make column 
    # when nlargest(10) added, only top 10 values will be shown 


# #### HeatMaps

# In[90]:


numeric_df = df.select_dtypes(include=['int64', 'float64'])

plt.figure(figsize=(10,5))
c = numeric_df.corr()
sns.heatmap(c,cmap="BrBG", annot=True)
c


# #### Scatterplot

# In[91]:


plt.figure(figsize=(10,6))
plt.scatter(x=df['HP'], y=df['Price'], color='blue', alpha=0.7)

plt.title("Sales vs Engine Power")
plt.xlabel("HorsePower")
plt.ylabel("Price")
plt.show()

