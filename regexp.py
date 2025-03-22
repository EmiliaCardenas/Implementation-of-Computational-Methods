"""
Author: Emilia Cardenas
Date: 24/03/2025
Project: Lexycal Analisys of Quenya
Purpose of the project: Validate exact words of that language
"""

import re

def parse(params):
    """
    Validates the word with the regular expresion.
    """
    patern = r"^E((l(darin|ear|en(i(on)?|ya)?))|(myn))$"
    if re.match(patern, params):
        return params
    return "Incorrect"

def accept(more_params):
    """
    Returns the same word as a parameter
    """
    return more_params


enter = str(input("Write a VALID word: "))

result = parse(enter)

result = accept(result)

print("The word is:", result)
