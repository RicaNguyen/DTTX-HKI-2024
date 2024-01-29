# Exercise 1: Convert two lists into a dictionary
def data_dict_Exercise1(listKey: list, listValues: list):
    print('Exercise 1: Convert two lists into a dictionary')
    result = {}
    for i in range(len(listKey)):
        result[listKey[i]] = listValues[i]
    print(result)


data_dict_Exercise1(['Ten', 'Twenty', 'Thirty'], [10, 20, 30])

# Exercise 2: Merge two Python dictionaries into one


def data_dict_Exercise2(dict1: dict, dict2: dict):
    print('# Exercise 2: Merge two Python dictionaries into one')
    result = dict1

    dict2_keys = dict2.keys()  # [Thirty Fourty Fifty]
    for dict2_key in dict2_keys:
        result[dict2_key] = dict2[dict2_key]
    print(result)


dict1 = {'Ten': 10, 'Twenty': 20, 'Thirty': 30}
dict2 = {'Thirty': 30, 'Fourty': 40, 'Fifty': 50}
data_dict_Exercise2(dict1, dict2)

# Exercise 3: Print the value of key ‘history’ from the below


def data_dict_Exercise3(dict: dict):
    print('# Exercise 3: Print the value of key ‘history’ from the below')
    print(dict['class']['student']['marks']['history'])


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
data_dict_Exercise3(sampleDict)


# Exercise 4: Initialize dictionary with default values


def data_dict_Exercise4(employees: list, defaults: dict):
    print('Exercise 4: Initialize dictionary with default values')
    result = dict()
    for employee in employees:
        result[employee] = defaults
    print(result)


employees = ['Kelly', 'Emma']
defaults = {"designation": 'Developer', "salary": 8000}
data_dict_Exercise4(employees, defaults)
