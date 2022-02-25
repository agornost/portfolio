#!/usr/bin/env python
import pandas as pd
from tabulate import tabulate
import subprocess
from os.path import exists

subprocess.run(["clear"])
password_input = '(none)'

if exists('output.csv'):
    data = pd.read_csv("output.csv", names = ['UserId', 'Password'])
    while password_input != "exit":
        password_input = input("Enter password of interest or type 'exit': ")
        if password_input in data['Password'].values:
            single_password = data[data.Password == password_input]
            single_password = single_password.groupby(['UserId']).size().sort_values(ascending = False).head(10).reset_index()
            print('\033[1m' + "Most commonly used UserID for " + '\033[0m' + password_input + '\033[1m' + " password"+ '\033[0m')
            print(tabulate(single_password, headers = ['UserID','Count'], tablefmt = 'psql',showindex=False))
        elif password_input == "exit":
            break
        else:
            print('\033[1m' + "No entry for " + '\033[0m' + password_input + '\033[1m' + " password found"+ '\033[0m')
else:
    print("No data file found. Please choose 'Data Harvesting' option first")
