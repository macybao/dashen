##Atomic Data Types
>**Built in numeric classes: int, float**
>
>>Operators:
>>
>>|Operator|Description|
>>|:-----|:-----|
>>|+|Addition|
>>|-|Subtraction|
>>|*|Multiplication|
>>|/|Division|
>>|%|Modulo|
>>|//|Integer Division|

<br/>
>**Boolean Data Types**
>>Operators:
>>
>>|Operator|Description|
>>|:-----|:-----|
>>|and|returns TRUE if both values are true|
>>|or|returns TRUE if one of the values is true|
>>|not|negates the truth value|
>>|<|less than|
>>|>|greater than|
>>|<=|less or equal to|
>>|>=|greater or equal to|
>>|==|equal to|
>>|!=|not equal to|

<br/>
>**Identifiers**
>
>* *Start with letter or underscore*
>* *Case sensitive*
>* *Can be of any length* 

##Collection Data Types
###Ordered
>**List [ ]**
>
>* ***Heterogeneous*** *(Data doesn't have to be from the same class)*
>* *Sequentially ordered* 
>* ***Methods:***
>
>|Method|Use|Explanation|
>|:-----|:-----|:-----|
>|append|list.append(item)|
>|insert|list.insert(i, item)|
>|pop|list.pop() / list.pop( i )|removes&returns the last position in the list/removes&returns the ith position in the list|
>|sort|list.sort()|
>|reverse|list.reverse()|
>|del|del list[ i ]|delete the item in ith position|
>|index|list.index(item)|returns the index of the **first** occurrence of the item|
>|count|list.count(item)|returns the number of the occurrence of the item|
>|remove|list.remove(item)|removes the **first** occurrence of the item|
>|range|range(start point,end point,skip step)|data extracted does **not** include the end point|

<br/>
>**Strings (characters: letters, numbers, symbols)**
>
>* *Immutable*
>* *Sequentially ordered*
>* ***Input:*** 
>```
>Var = input("Please enter sth:")
>```
>* String formatting:
>	* 
>```
>print("hello world", sep = "##", end = "###")
>```
>	* 
>```
>print("%s is %d years old" %(name, age)
>```
>	
>|`%` + character|Output|
>|:-----|:-----|
>|%d,%i|integer|
>|%u|unsinged integer|
>|%f|floating point as m.ddddd|
>|%e|floating point as m.ddddde+/-xx|
>|%E|floating point as m.dddddE+/-xx|
>|%g|use %e for exponents less than -4 or greater than +5+5, otherwise use %f|
>|%c|single character|
>|%s|String, or any Python data object that can be converted to a string by using the str function.|
>*Examples*
>
>```
>>>>price = 24
>>>>item = "banana"
>>>>print("The $s costs %d cents" %(item, price))
>	The banana costs 24 cents
>>>>print("The %+10s costs %5.2f cents"%(item,price))
>	The     banana costs 24.00 cents
>>>>print("The %+10s costs %10.2f cents"%(item,price))
>	The     banana costs      24.00 cents
>>>>itemdict = {"item":"banana","cost":24}
>>>>print("The %(item)s costs %(cost)7.1f cents"%itemdict)
>	The banana costs    24.0 cents
>```
>  
>* ***Methods:*** 
>
>|Method|Use|Explanation|
>|:-----|:-----|:-----|
>|center|string.center(w)|returns a string centered in a field of size w|
>|count|string.count(item)|returns the # of occurrences of item in the string|
>|ljust|string.ljust(w)|returns a string left-justified in a field of size w|
>|lower|string.lower()|returns a string in all lowercase|
>|rjust|string.rjust(w)|returns a string right-justified in a field of size w|
>|find|string.find(item)|returns the index of the first occurrence of item|
>|split|string.split(schar)|splits a string into substrings at schar|

<br/>
>>**Supoort Operators for Lists & Strings**
>>
>|Operator|Names|Description |
>|:-----|:-----|:-----|
>|[ ]|Indexing|Access an element of a sequence|
>|+|Concatenation|Combine sequences together|
>|*|Repetition|Concatenate a repeated number of times|
>|in|Membership|Ask whether an item is in a sequence|
>|len|Length|Ask the number of items in the sequence|
>|[:]|Slicing|Extract a part of a sequence(**Not** include the second index value)|

<br/>
>**Tuples （ ）**
>
>* *Heterogeneous*
>* *Immutable*

###Unordered
>**Sets { }**
>
>* *Heterogeneous*
>* *Immutable*
>* *Not allowed duplicates*
>* *Support Operators:*
>
>|Operator|Name|Description|
>|:-----|:-----|:-----|
>|in|membership|ask if a value is in a set|
>|len|length|returns the # of elements in a set|
>|`|`|`set1 | set2`|returns a new set with all elements from both sets|
>|&|set1 & set2|returns a new set with only those elements common to both sets|
>|-|set1 - set2|returns a new set with all items from the first set not in the second|
>|<=|set1 <= set2|asks whether all elements of the first set are in the second|
>
>* ***Methods:*** 
>
>|Method|Use|Explanation|
>|:-----|:-----|:-----|
>|union|set.union(other set)|
>|intersection|set.intersection(other set)|
>|difference|set.difference(other set)|Returns a new set with all items from first set not in second|
>|issubset|set.issubset(other set)|asks whether all elements of one set are in the other|
>|add|set.add(item)| |
>|remove|set.remove(item)|removes item from the set|
>|pop|set.pop()|removes an arbitrary element from the set|
>|clear|set.clear()|removes all elements in the set|

<br/>
>**Dictionaries { keys:values }**
>
>* *Support Operators:*
>
>|Operator|Name|Description|
>|:-----|:-----|:-----|
>|`[ ]`|dict[ k ]|Returns the value associated with k, otherwise its an error|
>|in|key in dict|Returns True if key is in the dictionary, False otherwise|
>|del|del dict[key]|Removes the entry from the dictionary|
>
>* ***Methods:*** 
>
>|Method|Use|Explanation|
>|:-----|:-----|:-----|
>|keys|dict.keys()|Returns the keys of the dictionary in a dict_keys object|
>|values|dict.values()|Returns the values of the dictionary in a dict_values object|
>|items|dict.itmes()|Returns the key-value pairs in a dict_items object|
>|get|dict.get(k)/dict.get(k,alt)|Returns the value associated with k, None otherwise/Returns the value associated with k, alt otherwise|





