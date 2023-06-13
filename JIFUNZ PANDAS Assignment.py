#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import matplotlib.pyplot as plt


# In[8]:


# read the dataset
DF=pd.read_csv("telecom_churn.csv")


# In[10]:


DF.head()


# In[11]:


# check the dimensinality of the dataframe by printing the shape of the dataframe
print(DF.shape)


# In[12]:


# check the information of the dataset
print(DF.info())


# In[14]:


# check the descriptive statistics of the dataset
print(DF.describe())


# In[23]:


# change the data type of the churn column from boolean to int64 and check the dataframe again
DF['Churn'].isnull().any()
DF['Churn'].fillna(False, inplace=True)
DF['Churn'] = DF['Churn'].astype('int64')
DF.head()


# In[25]:


# get the distribution of the churn by counting how many churned and how many did not
DF['Churn'].value_counts()


# In[26]:


# plot the count from the result above
DF['Churn'].value_counts().plot(kind='bar')
plt.title('Churn Distribution')
plt.xlabel('Churn')
plt.ylabel('Count')
plt.show()


# In[31]:


# what is the proportion of churned users in the dataframe
DF['Churn'].mean()


# In[33]:


DF['Churn'].mean() * 100


# In[50]:


# How much time (on average) do churned users spend on the phone during daytime?
'Total day calls'= DF[DF['Churn']==True]


# In[51]:


# give the values of the first five rows in the first three columns
DF.iloc[:5, :3]


# In[54]:


# select all the states that starts with W
DF[DF['State'].str.startswith('W')]


# In[57]:


# using the map function, replace Yes and No in the International plan column to True and False
DF['International plan'] = DF['International plan'].map({'Yes': True, 'No': False})


# In[58]:


DF['International plan'] = DF['International plan'].map({'Yes': True, 'No': False})


# In[60]:


# we want to understand the total calls that have been made by customers. Total_calls is calculated as
# the sum of Total dat calls, Total eve calls, Total night calls, Total intl calls.

DF['Total_calls'] = DF['Total day calls'] + DF['Total eve calls'] + DF['Total night calls'] + DF['Total intl calls']


# In[64]:


import seaborn as sns
import matplotlib.pyplot as plt


# In[73]:


# create a count plot to understand the churn of the international plan
sns.countplot(x='Churn', y='count', data=DF)
plt.xlabel('Churn')
plt.ylabel('Count')
plt.title('Churn of International Plan')
plt.show()


# In[ ]:




