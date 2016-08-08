from collections import defaultdict  # https://docs.python.org/2/library/collections.html

from words import get_text, words


def create_index(files):
    """
    Given a list of fully-qualified filenames, build an index from word
    to set of document indexes. The document index is just the index into the
    files parameter (indexed from 0).
    Make sure that you are mapping a word to a set, not a list.
    For each word w in file i, add i to the set of documents containing w
    Returns a dict object.
    """
    result = {}
    for file in files:
        try:
            f = open(file)
            content = f.read()
            all_words = words(content)
            for w in all_words:
                if w in result:
                    fs = result[w]
                    fs.add(file)
                    result[w] = fs
                else:
                    result[w] = set([file])
        finally:
            f.close()
    return result


def index_search(files, index, terms):
    """
    Given an index and a list of fully-qualified filenames, return a list of them
    whose file contents has all words in terms as normalized by your words() function.
    Parameter terms is a list of strings.
    You can only use the index to find matching files; you cannot open the files and look inside.
    """
    result_set = set([])
    first = True
    for term in terms:
        if term not in index:
            break
        else:
            files_set = index[term]
            if first:
                result_set = files_set
                first = False
            else:
                result_set = result_set & files_set
    return list(result_set)
