from lab04 import *

# Q13
def flatten(lst):
    """Returns a flattened version of lst.

    >>> flatten([1, 2, 3])     # normal list
    [1, 2, 3]
    >>> x = [1, [2, 3], 4]      # deep list
    >>> flatten(x)
    [1, 2, 3, 4]
    >>> x = [[1, [1, 1]], 1, [1, 1]] # deep list
    >>> flatten(x)
    [1, 1, 1, 1, 1, 1]
    """
    "*** YOUR CODE HERE ***"
    new_lst = []
    for elem in lst:
        if type(elem) == list:
            new_lst += flatten(elem)
        else:
            new_lst += [elem]
    return new_lst

# Q14
def merge(lst1, lst2):
    """Merges two sorted lists.

    >>> merge([1, 3, 5], [2, 4, 6])
    [1, 2, 3, 4, 5, 6]
    >>> merge([], [2, 4, 6])
    [2, 4, 6]
    >>> merge([1, 2, 3], [])
    [1, 2, 3]
    >>> merge([5, 7], [2, 4, 6])
    [2, 4, 5, 6, 7]
    """
    "*** YOUR CODE HERE ***"
    len1, len2 = len(lst1), len(lst2)
    i, j = 0, 0
    lst = []
    while i < len1 or j < len2:
        if i == len1 or (j <len2 and lst2[j] < lst1[i]):
            lst += [lst2[j]]
            j = j + 1
        else:
            lst += [lst1[i]]
            i = i + 1
    return lst
