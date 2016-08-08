# Got slate magazine data from http://www.anc.org/data/oanc/contents/
# rm'd .xml, .anc files, leaving just .txt
# 4534 files in like 55 subdirs

from words import get_text, words


def linear_search(files, terms):
    """
    Given a list of fully-qualified filenames, return a list of them
    whose file contents has all words in terms as normalized by your words() function.
    Parameter terms is a list of strings.
    Perform a linear search, looking at each file one after the other.
    """
    result = []
    for file in files:
        try:
            f = open(file)
            content = f.read()
            all_words = words(content)
            contains = True
            for term in terms:
                if term.lower() not in all_words:
                    contains = False
                    break
            if contains:
                result.append(file)
        finally:
            f.close()
    return result
