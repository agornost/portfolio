#!/usr/bin/python3
import hashlib

#hidden password hash
passwordHash = "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824"

#Declaring function for iteration through alphabet characters
#with maximum length of word
from itertools import chain, product
def bruteforce(charset, maxlength):
    return (''.join(candidate)
        for candidate in chain.from_iterable(product(charset, repeat=i)
        for i in range(1, maxlength + 1)))

#Looping for each combination of letters with condition of matching with
#password hash
for attempt in bruteforce('abcdefghijklmnopqrstuvwxyz', 5):
    #hash the word
    attemptHash = hashlib.sha256(attempt.encode("utf-8")).hexdigest()
    print(f"Trying password {attempt}:{attemptHash}")
    # match it against password
    if(attemptHash == passwordHash):
        print(f"Password has been cracked! It was {attempt}")
        break
