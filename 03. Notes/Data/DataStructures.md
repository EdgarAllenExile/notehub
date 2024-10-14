# Data Structures

## Hash Tables
### Details
Also Known As: Dictionary or Map

### Overview
A hash table is a data structure that implements an associative array. This array maps keys to values and hashes them to compute an index or hash code this creates an array of buckets or slots, from which the value can be found. During look up, the key is hashed and the resulting hash points to the value. This mapping is called a hash map.

Time complexity in a hash map is independant of each lookup is independant of the size of the table. 

Hashing is an example of space vs time tradeoffs. If memory is infinite then the entire key can be used an an index to locate the value, conversely if time is infinite, then values can be stored without regard for their key and can be retrieved with binary or linear search.

### Performance
Overall, a hash tables are on average more efficient than Search Trees or other table lookup structures.
