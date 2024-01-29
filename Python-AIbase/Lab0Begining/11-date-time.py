from datetime import datetime, timedelta


# Exercise 1: Print current date and time in Python
print('Exercise 1: Print current date and time in Python')
print(datetime.now())

# Exercise 2: Convert string into a datetime object
print('Exercise 2: Convert string into a datetime object')
date_string = "Jan 14 2024  10:35PM"
datetime_object = datetime.strptime(date_string, '%b %d %Y %I:%M%p')
print(datetime_object)

# Exercise 3: Subtract a week (7 days)  from a given date in Python
print('Subtract a week (7 days)  from a given date in Python')
given_date = datetime(2024, 1, 14)
print("Given date")
print(given_date)
days_to_subtract = 7
res_date = given_date - timedelta(days=days_to_subtract)
print("New Date")
print(res_date)

# Exercise 4: Print a date in a the following format
print('Exercise 4: Print a date in a the following format')
# Day_name  Day_number  Month_name  Year
given_date = datetime(2024, 1, 14)
print("Given date is")
print(given_date.strftime('%A %d %B %Y'))
