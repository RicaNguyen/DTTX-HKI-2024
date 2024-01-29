# Exercise 1: Create a function in Python
def exercise1(name, age):
    print(name)
    print(age)
# Exercise 2: Create a function with variable length of arguments


def func1(*args):
    for x in range(len(args)):
        print(args[x])

# Exercise 3: Return multiple values from a function


def calculation(a, b):
    add = a+b
    sub = a-b
    return add, sub


# Exercise 4: Create a function with a default argument
res = calculation(40, 10)
print(res)
