#!/usr/bin/env python
# coding: utf-8

# In[1]:


def count_letters_digits(sentence):
    digits = letters = 0

    for character in sentence:
        if character.isdigit():
            digits += 1
        elif character.isalpha():
            letters += 1

    print(f"LETTERS {letters}")
    print(f"DIGITS {digits}")

if __name__ == "__main__":
    count_letters_digits("hello world! 123")


# In[ ]:


