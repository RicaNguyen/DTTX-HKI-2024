def multiplication_two_number(num1, num2):
    result = num1*num2
    return result


# Exercise 1: Accept numbers from a user
number1 = int(input("Please input number1:"))
number2 = int(input("Please input number2:"))
print(str(number1) + "*" + str(number2)+"=" +
      str(multiplication_two_number(number1, number2)))
# Exercise 2: Display three string “Name”, “Is”, “James” as “Name**Is**James”
print('My', 'Name', 'Is', 'James', sep='**')
# Exercise 4: Display float number with 2 decimal places using print()
num4 = float(input("Please input number4:"))
print('%.2f' % num4)
# Exercise 5: Accept a list of 5 float numbers as an input from the user
nums = []
numofe = int(input("Please input number of element:"))
for x in range(numofe):
    print("please input num", x, ":")
    item = float(input())
    nums.append(item)
print("List number", nums)
