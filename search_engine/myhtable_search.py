# Got slate magazine data from http://www.anc.org/data/oanc/contents/
# rm'd .xml, .anc files, leaving just .txt
# 4534 files in like 55 subdirs

from htable import *
from words import get_text, words


def myhtable_create_index(files):
    """
    Build an index from word to set of document indexes
    This does the exact same thing as create_index() except that it uses
    your htable.  As a number of htable buckets, use 4011.
    Returns a list-of-buckets hashtable representation.
    """
    result = htable(4011)
    for file in files:
        try:
            f = open(file)
            content = f.read()
            all_words = words(content)
            for w in all_words:
                files = htable_get(result, w)
                if files is not None:
                    files.add(file)
                    htable_put(result, w, files)
                else:
                    htable_put(result, w, set([file]))
        finally:
            f.close()
    return result


def myhtable_index_search(files, index, terms):
    """
    This does the exact same thing as index_search() except that it uses your htable.
    I.e., use htable_get(index, w) not index[w].
    """
    result_set = set([])
    first = True
    for term in terms:
        files_set = htable_get(index, term)
        if files_set is None:
            break
        else:
            if first:
                result_set = files_set
                first = False
            else:
                result_set = result_set & files_set
    return list(result_set)

