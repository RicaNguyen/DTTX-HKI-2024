# https://www.askpython.com/python/array/print-an-array-in-python
# https://java2blog.com/convert-string-array-to-int-array-python/
def read_int_from_string():
    stringOfNumber = str(
        input("Input list of number sep by space. Press Enter to end:"))
    numberDigits = stringOfNumber.split(" ")
    lst_int = [eval(i) for i in numberDigits]
    return lst_int
