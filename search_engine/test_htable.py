
from htable import *


def test_empty():
    table = htable(5)
    assert htable_str(table) == "{}"
    assert htable_buckets_str(table) == """0000->
0001->
0002->
0003->
0004->
"""


def test_single():
    table = htable(5)
    htable_put(table, "parrt", 99)
    assert htable_str(table) == "{parrt:99}"
    assert htable_buckets_str(table) == """0000->
0001->
0002->
0003->parrt:99
0004->
"""


def test_a_few():
    table = htable(5)
    for i in range(1, 11):
        htable_put(table, i, i)
    s = htable_str(table)
    assert s=="{5:5, 10:10, 1:1, 6:6, 2:2, 7:7, 3:3, 8:8, 4:4, 9:9}"
    s = htable_buckets_str(table)
    assert s == """0000->5:5, 10:10
0001->1:1, 6:6
0002->2:2, 7:7
0003->3:3, 8:8
0004->4:4, 9:9
"""


def test_str_to_set():
    table = htable(5)
    htable_put(table, "parrt", {2, 99, 3942})
    htable_put(table, "tombu", {6, 3, 1024, 99, 102342})
    assert htable_str(table) == "{tombu:set([1024, 3, 99, 6, 102342]), parrt:set([2, 99, 3942])}"
    assert htable_buckets_str(table) == """0000->
0001->tombu:set([1024, 3, 99, 6, 102342])
0002->
0003->parrt:set([2, 99, 3942])
0004->
"""