#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import random

def guessing_game():
    number_to_guess = random.randint(1, 100)
    attempts = 0

    while attempts < 9:
        guess = int(input("Guess a number between 1 and 100: "))
        attempts += 1

        if guess < number_to_guess:
            print("Too low!")
        elif guess > number_to_guess:
            print("Too high!")
        else:
            print(f"Congratulations! You found the number {number_to_guess} in {attempts} attempts.")
            return

    print(f"Sorry, you didn't guess the number. The number was {number_to_guess}.")

if __name__ == "__main__":
    guessing_game()


# In[ ]:




