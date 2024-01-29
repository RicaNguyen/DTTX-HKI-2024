# Exercise 1: Calculate the multiplication and sum of two numbers
# number1= int(input("Please input number1:"))
# number2= int(input("Please input number2:"))
# print("number1=" + str(number1))
# print("number2= " + str(number2))
# print("sum of number1 and number2 = " + str(number1+number2))
# Exercise 2: Print the sum of the current number and the previous number
# print("Printing current and previous number sum in a range(10)")
# for x in range(10):
#   if x==0:
#     print ("Current Number 0 Previous Number 0  Sum: 0")
#   else:
#     print("Current Number "+ str(x) +" Previous Number " +str(x-1) +  " Sum: " +str(x+x-1))
# Exercise 3: Print characters from a string that are present at an even index number
# Str=str(input("Input string:"))
# print("Orginal String is  pynative ")
# print("Printing only even index chars")
# for x in range(len(Str)):
#     if x%2!=0:
#         print(Str[x])
# Exercise 4: Remove first n characters from a string
# numOfchar = int(input("Input numOfchar:"))


from util import read_int_from_string


def remove_chars(Str, numOfChar):
    output = ""
    for x in range(numOfChar, len(Str)):
        output += Str[x]
    return output

# print("Sub string: " + remove_chars(Str,numOfchar) )
 # ""
# Exercise 5: Check if the first and last number of a list is the same
# stringOfNumber=str(input("Input list of number sep by space:"))


def is_first_and_last_the_same(Str):
    numberDigits = Str.split(" ")
    return numberDigits[0] == numberDigits[len(numberDigits)-1]


print("is_first_and_last_the_same: " +
      str(is_first_and_last_the_same("123 4 56 7 8 3245")))
print("is_first_and_last_the_same: " +
      str(is_first_and_last_the_same("41 4 56 7 8 1")))
print("is_first_and_last_the_same: " +
      str(is_first_and_last_the_same("6 4 6 7 8 6")))

# Exercise 6: Display numbers divisible by 5 from a list


def numbers_divisible_by_5(list_int: list[int]):
    print("Exercise 6: Display numbers divisible by 5 from a list")
    print("Given list: ", list_int)
    print("Divisible by 5: ", list_int)
    # https://www.w3schools.com/python/python_for_loops.asp
    for x in list_int:
        if x % 5 == 0:
            print(x)
    print("-----------------------------")


# Exercise6Input = read_int_from_string()
numbers_divisible_by_5([40, 4, 56, 10, 8, 1])


# Exercise 7: Return the count of a given substring from a string


def count_substring_in_string(srcString: str, subString: str):
    print("Exercise 7: Return the count of a given substring from a string")
    cnt = srcString.count(subString)
    # https://ioflood.com/blog/append-to-string-python
    print(f"{subString} appeared {cnt} times")
    print("-----------------------------")


count_substring_in_string("Emma is good developer. Emma is a writer", "Ema")
