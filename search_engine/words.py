
import os
import re
import string


def filelist(root):
    """Return a fully-qualified list of filenames under root directory"""
    list = []
    if root is None:
        return list
    for dirpath, dirnames, filenames in os.walk(root):
        for filename in filenames:
            list.append(os.path.join(dirpath, filename))
    return list


def get_text(fileName):
    f = open(fileName)
    s = f.read()
    f.close()
    return s


def words(text):
    """
    Given a string, return a list of words normalized as follows.
    Split the string to make words first by using regex compile() function
    and string.punctuation + '0-9\\r\\t\\n]' to replace all those
    char with a space character.
    Split on space to get word list.
    Ignore words < 3 char long.
    Lowercase all words
    """
    result = []
    p = re.compile(r'[' + string.punctuation + '0-9\r\t\n]')
    replaced_text = p.sub(' ', text)
    words = replaced_text.split(' ')
    for w in words:
        if len(w) >= 3:
            result.append(w.lower())
    return result



def results(docs, terms):
    """
    Given a list of fully-qualifed filenames, return an HTML file
    that displays the results and up to 2 lines from the file.
    Return at most 100 results.  Arg terms is a list of string terms.
    """
    head = '<html><body><h2>Search results for <b>%s</b> in %s files</h2>' % (' '.join(terms), len(docs))
    foot = '</body></html>'
    content = ''
    p = re.compile(r'\s')
    for file in docs:
        try:
            content += '<p><a href="file://%s">%s</a><br>' % (file, file)
            f = open(file)
            count = 0
            for line in f:
                s = p.sub('', line)
                if s != '' and count < 2:
                    content += line + '<br>'
                    count += 1
                elif count >= 2:
                    break
            content += '<br>'
        finally:
            f.close()
    return head + content + foot


def filenames(docs):
    """Return just the filenames from list of fully-qualified filenames"""
    if docs is None:
        return []
    return [os.path.basename(d) for d in docs]
