# Exercise 1: Create a list by picking an odd-index items from the first list and even index items from the second

def data_structure_Exercise1(list1: [], list2: []):
    print('Exercise 1: Create a list by picking an odd-index items from the first list and even index items from the second')
    odd_result = []
    even_result = []

    for i in range(0, len(list1)):
        if i % 2 != 0:
            odd_result.append(list1[i])
    print('Element at odd-index positions from list one')
    print(odd_result)

    for j in range(0, len(list2)):
        if j % 2 == 0:
            even_result.append(list2[j])
    print('Element at even-index positions from list two')
    print(even_result)

    result = []
    result.extend(odd_result)
    result.extend(even_result)
    print('Printing Final third list')
    print(result)


data_structure_Exercise1([3, 6, 9, 12, 15, 18, 21], [4, 8, 12, 16, 20, 24, 28])


# Exercise 2: Remove and add item in a list
def data_structure_Exercise2(list: list):
    print('Exercise 2: Remove and add item in a list')
    itemAtIndex4 = list.pop(4)
    print('List After removing element at index 4')
    print(list)

    print('List after Adding element at index 2')
    list.insert(2, itemAtIndex4)
    print(list)

    print('List after Adding element at last')
    list.append(itemAtIndex4)
    print(list)


data_structure_Exercise2([34, 54, 44, 27, 79, 91, 41])


# Exercise 3: Slice list into 3 equal chunks and reverse each chunk
def data_structure_Exercise3(list: list):
    print("Exercise 3: Slice list into 3 equal chunks and reverse each chunk")
    arr1 = []
    arr2 = []
    arr3 = []

    length_each_chunk = len(list)/3

    for i in range(len(list)):
        if i < length_each_chunk:
            arr1.append(list[i])
        if (i > length_each_chunk and i < length_each_chunk*2):
            arr2.append(list[i])
        if (i > 2*length_each_chunk):
            arr3.append(list[i])

    print(f'Chunk 1 {arr1}')
    arr1.reverse()
    print(f'After reversing it {arr1}')

    print(f'Chunk 2 {arr2}')
    arr2.reverse()
    print(f'After reversing it {arr2}')

    print(f'Chunk 3 {arr3}')
    arr3.reverse()
    print(f'After reversing it {arr3}')


data_structure_Exercise3([11, 45, 8, 23, 14, 12, 78, 45, 89])

# Exercise 4: Count the occurrence of each element from a list


def data_structure_Exercise4(list: list):
    print("Exercise 4: Count the occurrence of each element from a list")
    Count_occurrence = dict()

    for item in list:
        if Count_occurrence.get(item) is None:
            Count_occurrence[item] = 1
        else:
            Count_occurrence[item] = Count_occurrence[item] + 1

    print(f"Printing count of each item {Count_occurrence}")


data_structure_Exercise4([11, 45, 8, 11, 23, 45, 23, 45, 89])
