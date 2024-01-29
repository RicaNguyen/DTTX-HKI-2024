# Exercise 1: Print First 10 natural numbers using while loop
for x in range(1, 11):
    print(x)
# Exercise 2: Print the following pattern
rows = 5
for y in range(1, rows+1):
    for i in range(1, y+1):
        print(i, end=' ')
    print("")
# Exercise 3: Calculate the sum of all numbers from 1 to a given number
number = int(input("Please input number:"))
sum = 0
for z in range(1, number+1):
    sum += z
print("sum =", sum)
# Exercise 4: Write a program to print multiplication table of a given number
multiplication = 2
for l in range(1, 11):
    print(multiplication*l)
