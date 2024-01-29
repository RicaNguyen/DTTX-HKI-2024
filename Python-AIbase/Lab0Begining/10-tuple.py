

# Exercise 1: Reverse the tuple
# Use tuple slicing to reverse the given tuple. Note: the last element starts at -1.
print('# Exercise 1: Reverse the tuple')
tuple1 = (10, 20, 30, 40, 50)
tuple1 = tuple1[::-1]
print(tuple1)

# Exercise 2: Access value 20 from the tuple
print('# Exercise 2: Access value 20 from the tuple')
tuple2 = ("Orange", [10, 20, 30], (5, 15, 25))
print(tuple2[1][1])

# Exercise 3: Create a tuple with single item 50
print('# Exercise 3: Create a tuple with single item 50')
tuple3 = (50)
print(tuple3)

# Exercise 4: Unpack the tuple into 4 variables
print('# Exercise 4: Unpack the tuple into 4 variables')
tuple4 = (10, 20, 30, 40)
a = tuple4[0]
b = tuple4[1]
c = tuple4[2]
d = tuple4[3]
print(a)  # should print 10
print(b)  # should print 20
print(c)  # should print 30
print(d)  # should print 40
