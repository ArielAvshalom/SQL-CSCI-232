#We did the bruteforce method earlier
table3 = []
for value_1 in table1:
    for value_2 in table2:
        if value_1 == value_2:
            print(termcolor.colored("winner", 'green'))
            table3.append([value_1,value_2])

And we mentioned that this was O(N*M)

#merge join - only done on mainframes ~ index join
#hash join - which is the preferred method these days

#you have two tables
#sort the keys on both tables
#Then you loop through both tables at the same time

[1,2,3,4,6,12]
[4,5,7,8,9,12]

while not at end of the table:
    increment + 1
    if table1[increment] < table2[increment]
    we increase the table 1 increment
    else if table2... < table1...
    we increase table 2's increment

table1_len, table2_len = len(table1), len(table2)
pos1, pos2 = 0, 0
while pos1 < table1_len and pos2 < table2_len:
    if table1[pos1] < table2[pos2]:
        pos1+=1
    elif table1[pos1] > table2[pos2]:
        pos2+=1
    else:
        table3.append([column(table1[pos1]), cokumn(table2[pos2])])
        pos1 += 1
        pos2 += 1

[1,2,3,4,6,12]
[4,5,7,8,9,12]
table3 = [4,12]

#We don't do merge joins anymore


#Let's look at hash joins now.

#A hash table is a table with O(1) lookup

[5,2,6,3,8,2,1,4,7]
O(1) lookup for finding if 5 exists or if 7 exists or if 1 exists

We take the smaller table and we put it into a hash table
O(M) time where M is the smaller table size

Then we go though the larger table and see if the keys in the larger table exist in the hashed table
O(N) where N is the larger table size

hash_table = dict(smaller_table)

for value in larger_table:
    if hash_table[value]:
        table3.append([column(table1[value]), column(table2[value])])

O(n + m) time
If lookups are logarithmic:
O(nlog(m) + m)

two tables with a million values each

Brute force cost is:

10^6 * 10^6 = 10^12

Vs the cost of logarthmic:

10^6 * log(10^6) = 20 million + 10^6

Vs the cost of linear

10^6 + 10^6 = 2 million

""" A problem that can really be bad
select eid 
    from employee
inner join 
    position
    on employee.eid = position.eid
;

--This will by default try to do a hash join
--that will either be O(n+m) or O(nlogm) depending on the way your hash is created. The data structure behind the scenes matters.


select eid 
    from employee
inner join 
    position
    on employee.eid > position.eid;
--don't do this! It becomes nested!
--instead do comparisons in the where or having clause (if using a group by statement)


"""