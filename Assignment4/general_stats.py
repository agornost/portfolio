#!/usr/bin/env python
import pandas as pd
import matplotlib.pyplot as plt
from tabulate import tabulate
import subprocess
from os.path import exists
import math
from passwordstrength.entropy import Entropy

subprocess.run(["clear"])

if exists('output.csv'):
    data = pd.read_csv("output.csv", names = ['UserId', 'Password'])

    #5 most common passwords
    y = data.groupby('Password').size().sort_values(ascending = False).head(5)
    df = y.reset_index()

    #Terminal table
    print('\033[1m' + "Top 5 most commonly used passwords" + '\033[0m')
    print(tabulate(df, headers = ['Password','Count'], tablefmt = 'psql',showindex=False))

    #Most common UserId-Password pairs
    common_pair = data.groupby(['UserId','Password']).size().sort_values(ascending = False).head(17)
    common_pair = common_pair.reset_index().sort_values('UserId')
    print('\033[1m' + "Most commonly used UserID-Passwords pairs" + '\033[0m')
    print(tabulate(common_pair, headers = ['UserID','Password','Count'], tablefmt = 'psql',showindex=False))

    #Most secure passwords
    secure_passwords = data['Password'].reset_index()
    secure_passwords = secure_passwords[secure_passwords.Password.str.contains(r'[@#&$%*]')]

        #Entropy calculation
    pass_list = secure_passwords['Password'].values
    entropy = Entropy()
    list = []
    for i in pass_list:
            list.append(math.log2(entropy.entropy(i)))
    secure_passwords['Entropy'] = list
    print('\033[1m' + "Most secure passwords" + '\033[0m')
    print(tabulate(secure_passwords, headers = ['Row number','Password','Entropy, bits'], tablefmt = 'psql',showindex=False))

    # Pie chart
    labels = df['Password']
    plt.pie(y, labels = labels, shadow = True)
    plt.title("Top 5 most commonly used passwords")
    mngr = plt.get_current_fig_manager()
    mngr.full_screen_toggle()
    plt.show(block=True)
else:
    print("No data file found. Please choose 'Data Harvesting' option first")
