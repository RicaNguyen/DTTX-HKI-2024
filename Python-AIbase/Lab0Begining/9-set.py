def set_Exercise1(sample_set: set, sample_list: list):
    print('Exercise 1: Add a list of elements to a set')
    sample_set.update(sample_list)
    print(sample_set)


sample_set = {"Yellow", "Orange", "Black"}
sample_list = ["Blue", "Green", "Red"]
set_Exercise1(sample_set, sample_list)


def set_Exercise2():
    print('Exercise 2: Return a new set of identical items from two sets')
    set1 = {10, 20, 30, 40, 50}
    set2 = {30, 40, 50, 60, 70}
    print(set1.intersection(set2))


set_Exercise2()


def set_Exercise2():
    print('Exercise 2: Return a new set of identical items from two sets')
    set1 = {10, 20, 30, 40, 50}
    set2 = {30, 40, 50, 60, 70}
    print(set1.intersection(set2))


set_Exercise2()


def set_Exercise3():
    print('Exercise 3: Get Only unique items from two sets')
    set1 = {10, 20, 30, 40, 50}
    set2 = {30, 40, 50, 60, 70}
    print(set1.union(set2))


set_Exercise3()


def set_Exercise4():
    print('Exercise 4: Update the first set with items that don’t exist in the second set')
    set1 = {10, 20, 30}
    set2 = {20, 40, 50}
    set1.difference_update(set2)
    print(set1)


set_Exercise4()
