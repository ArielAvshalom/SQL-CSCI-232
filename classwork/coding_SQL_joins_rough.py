# -*- coding: utf-8 -*-
"""
Created on Tue Nov 17 09:59:31 2020

@author: Ariel
"""
import time
import termcolor


#Nested Loop Join/Inner Loop Join
table1 = [1,2,3,4,5,76,42,123,32]
table2 = [3,4,5,6,7,75,77,76,122,123,33,32]
loop = 0

#in table1 : 3, nancy, drew, 11/16/55, detective
#in table2 : 3, 17,000,000, Executive

table3 = []
#table3 is going to be our joined table
for value_1 in table1:
    for value_2 in table2:
        loop+=1
        print(f"we are now in {value_1} and {value_2}. This is loop number {loop}.")
        time.sleep(.5)
        
        if value_1 == value_2:
            print(termcolor.colored("winner", 'green'))
            table3.append([value_1,value_2])
        else:
            print(termcolor.colored('no match', 'red'))
            



#hash join


#a hash/dictionary will look like this:
    
my_dict = {
    1: 'jane eyre',
    2: 'war and peace',
    3: 'the book thief'
    }

my_dict.__contains__(2)
my_dict.__contains__(5)

#for a hash join, the optimizer will pick the smaller table and turn it into a hash table

my_hash_table = dict()

table4 = []

for value in range(len(table1)):
    my_hash_table[table1[value]] = value
    
for value in table2:
    time.sleep(.5)
    print(f"we are now in {value} in table2")
    if my_dict.__contains__(value):
        table4.append([value, 'in table2'])
        print(termcolor.colored(' in hash', 'green'))
    else:
        print(termcolor.colored('not in hash', 'red'))

#if you have a good version of a hash, one that can do constant time lookups, then you will output in approximately O(n)
#But if you use a red-black tree for your hash, it take log(n) to look something up in the hash and the total cost of the algorithm is O(nlogn)

#IF you have tables that are 10000, log(10000) = 13
#130000 operations at O(nlogn) time
#If you use inner loop join, it'll take 100000000 passes through the loop

#You can't join on less than or greater than or between operators with hash join.



#merge join 

#The SQL tables were indexed or sorted and it only took one loop through the table to make a join.

table5 = [1,2,4,6,7,9,13,27,101,171,231]
table6 = [4,5,6,7,8,97,131,171,231,251,365,707]

pos_left = 0
pos_right = 0

#while currentpos != len(table5):

    
#loop through table 5
#If the value in the current loop is greater than the value in table6, then increment table 6 by one
#if the value in the the current loop is less than the value in table6, then increment table5 by one
#if equivalent then append to table7

#Total time: if you're sorting it right now, sorting can take O(n) for non-compartive sorting or O(nlogn) for a good comparitive sorting algorithm
#Looping through a sorted table is O(n)

#So depending on the sorting used, its either O(n) time or O(nlogn) time.

#merge join is approximately equivalent to joining with an index.
table7 = []
while table5 != [] and table6 != []:
    if table5[0] < table6[0]:
        time.sleep(2)
        print(termcolor.colored('left table value less than right', 'magenta'))
        table5.pop(0)
    if table5[0] > table6[0]:
        time.sleep(2)
        print(termcolor.colored('right table value less than left', 'yellow'))
        table6.pop(0)
        
    if table5[0] == table6[0]:
        time.sleep(2)
        table7.append(table5.pop(0))
        table6.pop(0)
        print(termcolor.colored('success!', 'green'))

