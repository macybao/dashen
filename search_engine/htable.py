"""
A hashtable represented as a list of lists with open hashing.
Each bucket is a list of (key,value) tuples
"""

def htable(nbuckets):
    """Return a list of nbuckets lists"""
    return [[] for i in range(nbuckets)]


def hashcode(o):
    """
    Return a hashcode for strings and integers; all others return None
    For integers, just return the integer value.
    For strings, perform operation h = h*31 + ord(c) for all characters in the string
    """
    if isinstance(o, int):
        return o
    elif isinstance(o, str):
        h = 0
        for c in o:
            h = h * 31 + ord(c)
        return h
    else:
        raise RuntimeError('hashcode - not supported type: ' + type(o))


def bucket_indexof(table, key):
    """
    You don't have to implement this, but I found it to be a handy function.
    Return the element within a specific bucket; the bucket is table[key].
    You have to linearly search the bucket.
    """
    offset = hashcode(key) % len(table)
    bucket = table[offset]
    for pair in bucket:
        if len(pair) == 2 and hashcode(pair[0]) == hashcode(key):
            return pair
    return None


def htable_put(table, key, value):
    """
    Perform table[key] = value
    Find the appropriate bucket indicated by key and then append value to the bucket.
    If the bucket for key already has a key,value pair with that key then replace it.
    Make sure that you are only adding (key,value) associations to the buckets.
    """
    offset = hashcode(key) % len(table)
    bucket = table[offset]
    bucket.append((key, value))
    table[offset] = bucket


def htable_get(table, key):
    """
    Return table[key].
    Find the appropriate bucket indicated by the key and look for the association
    with the key. Return the value (not the key and not the association!)
    Return None if key not found.
    """
    offset = hashcode(key) % len(table)
    bucket = table[offset]
    for pair in bucket:
        if len(pair) == 2 and hashcode(pair[0]) == hashcode(key):
            return pair[1]
    return None


def htable_buckets_str(table):
    """
    Return a string representing the various buckets of this table. The output looks like:
	0000->
	0001->
	0002->
	0003->parrt:99
	0004->
    where parrt:99 indicates an association of (parrt,99) in bucket 3.
    """
    count = 0
    str_list = []
    for bucket in table:
        if len(bucket) == 0:
            str_list.append('%04d->' % count)
        else:
            bucket_str = '%04d->' % count
            bucket_str_list = []
            for pair in bucket:
                bucket_str_list.append('%s:%s' % (pair[0], pair[1]))
            str_list.append(bucket_str + ', '.join(bucket_str_list))
        count += 1
    return '\n'.join(str_list) + '\n'


def htable_str(table):
    """
    Return what str(table) would return for a regular Python dict such as {parrt:99}.
    The order should be bucket order and then insertion order in bucket.
    The insertion order is guaranteed when you append to the buckets in htable_put().
    """
    result = '{'
    str_list = []
    for bucket in table:
        for pair in bucket:
            str_list.append('%s:%s' % (pair[0], pair[1]))
    result += ', '.join(str_list) + '}'
    return result
