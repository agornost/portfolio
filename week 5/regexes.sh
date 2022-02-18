#!/bin/bash

grep -r ' sed ' ./*/                #all sed statements
grep -r '^m' ./*/                   #all lines that start with the letter m
grep -r '\<[0-9]\{3\}\>' ./*/       #all lines that contain three digit numbers
grep -r 'echo.*(\S+\s+){3}.*' ./*/  #all echo statements with at least three words
grep -r '^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$'
'
# 8 characters length
# 2 letters in Upper Case
# 1 Special Character (!@#$&*)
# 2 numerals (0-9)
# 3 letters in Lower Case
