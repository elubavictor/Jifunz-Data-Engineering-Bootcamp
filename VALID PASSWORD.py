#!/usr/bin/env python
# coding: utf-8

# In[2]:


import re
def check_password(password):
    # Check the password length
    if len(password) < 6 or len(password) > 12:
        return "Password length should be between 6 and 12 characters"

    # Check for at least one lowercase letter
    if not re.search("[a-z]", password):
        return "Password should have at least one lowercase letter"

    # Check for at least one uppercase letter
    if not re.search("[A-Z]", password):
        return "Password should have at least one uppercase letter"

    # Check for at least one digit
    if not re.search("[0-9]", password):
        return "Password should have at least one digit"

    # Check for at least one special character
    if not re.search("[$#@]", password):
        return "Password should have at least one special character [$#@]"
    
    return "Password is valid"

password = input("Enter your password: ")
print(check_password(password))


# In[ ]:




