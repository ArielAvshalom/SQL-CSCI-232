#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Mar 24 19:26:38 2022

@author: arielavshalom
"""

import time

my_array = [1,2,3,4,5,6]
my_array_2 = [7,8,9,10,11,12]

my_array.__contains__(6)
array_doubles = []
for value in my_array:
    #3
    for second_value in my_array_2:
        #7
        #print((value, second_value))
        #time.sleep(1)
        array_doubles.append((value, second_value))
