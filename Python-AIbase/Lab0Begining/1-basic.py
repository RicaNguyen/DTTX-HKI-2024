# Exercise 1: Calculate the multiplication and sum of two numbers
number1 = int(input("Please input number1:"))
number2 = int(input("Please input number2:"))
print("number1=" + str(number1))
print("number2= " + str(number2))
print("sum of number1 and number2 = " + str(number1+number2))
# Exercise 2: Print the sum of the current number and the previous number
print("Printing current and previous number sum in a range(10)")
for x in range(10):
    if x == 0:
        print("Current Number 0 Previous Number 0  Sum: 0")
    else:
        print("Current Number " + str(x) + " Previous Number " +
              str(x-1) + " Sum: " + str(x+x-1))
# Exercise 3: Print characters from a string that are present at an even index number
Str = str(input("Input string:"))
print("Orginal String is  pynative ")
print("Printing only even index chars")
for x in range(len(Str)):
    if x % 2 != 0:
        print(Str[x])
# Exercise 4: Remove first n characters from a string


def remove_chars(Str, numOfchar):
    output = ""
    for x in range(numOfchar, len(Str)):
        output += Str[x]
    return output
# Exercise 5: Check if the first and last number of a list is the same


def is_first_and_last_the_same(Str):
    numberDigits = Str.split(" ")
    return numberDigits[0] == numberDigits[len(numberDigits)-1]
