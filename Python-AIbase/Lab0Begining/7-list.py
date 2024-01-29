# Exercise 1: Reverse a list in Python
def list_Exercise1(list: list):
    list.reverse()
    print(list)


list_Exercise1([100, 200, 300, 400, 500])

# Exercise 2: Concatenate two lists index-wise


def list_Exercise2(list1: list, list2: list):
    print('Exercise 2: Concatenate two lists index-wise')
    result = []
    for i in range(len(list1)):
        result.append(list1[i]+list2[i])
    print(result)


list1 = ["M", "na", "i", "Ke"]
list2 = ["y", "me", "s", "lly"]
list_Exercise2(list1, list2)

# Exercise 3: Turn every item of a list into its square


def list_Exercise3(list: list):
    print('Exercise 3: Turn every item of a list into its square')
    result = []
    for i in range(len(list)):
        result.append(list[i]*list[i])
    print(result)


sampleDict = {
    "class": {
        "student": {
            "name": "Mike",
            "marks": {
                "physics": 70,
                "history": 80
            }
        }
    }
}
list_Exercise3([1, 2, 3, 4, 5, 6, 7])


# Exercise 4: Concatenate two lists in the following order


def list_Exercise3(list1: list, list2: list):
    print('Exercise 4: Concatenate two lists in the following order')
    result = []
    for item1 in list1:
        for item2 in list2:
            result.append(item1 + ' ' + item2)
    print(result)


list1 = ["Hello ", "take "]
list2 = ["Dear", "Sir"]
list_Exercise3(list1, list2)
