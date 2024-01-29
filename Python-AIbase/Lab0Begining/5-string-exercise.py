# Exercise 15: Remove special symbols / punctuation from a string
def exercise15(Str):
    list_char = "qwertyuioplkjhgfdsazxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM1234567890 "
    output = ""

    for index in range(len(Str)):
        if list_char.find(Str[index]) >= 0:
            output += Str[index]
    return output


print(exercise15("/*Jon is @developer & musician"))

# Exercise 16: Removal all characters from a string except integers


def exercise16(Str):
    list_char = "1234567890"
    output = ""
    for i in range(len(Str)):
        if list_char.find(Str[i]) >= 0:
            output += Str[i]
    return output


print(exercise16("I am 25 years and 10 months old"))

# Exercise 17: Find words with both alphabets and numbers


def exercise17(Str):
    list_char = "qwertyuioplkjhgfdsazxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM"
    list_number = "1234567890"
    StrDigits = Str.split(" ")
    results = []
    for y in range(len(StrDigits)):
        Word = StrDigits[y]
        check_char = False
        check_number = False
        for l in range(len(Word)):
            if list_char.find(Word[l]) >= 0:
                check_char = True
            if list_number.find(Word[l]) >= 0:
                check_number = True
        if check_char and check_number:
            # results.append(Word)
            print(Word)

    return results


exercise17("Emma25 is Data scientist50 and AI Expert")

# Exercise 18: Replace each special symbol with # in the following string


def exercise18(Str):
    list_char = "qwertyuioplkjhgfdsazxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM1234567890 "
    output = ""
    for index in range(len(Str)):
        if list_char.find(Str[index]) >= 0:
            output += Str[index]
    return output
