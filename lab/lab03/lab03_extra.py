from lab03 import *

def is_palindrome(n):
    """
    Fill in the blanks '_____' to check if a number
    is a palindrome.

    >>> is_palindrome(12321)
    True
    >>> is_palindrome(42)
    False
    >>> is_palindrome(2015)
    False
    >>> is_palindrome(55)
    True
    """
    x, y = n, 0
    f = lambda: y * 10 + x % 10
    while x > 0:
        x, y = x // 10, f()
    return y == n

def skip_mul(n):
    """Return the product of n * (n - 2) * (n - 4) * ...

    >>> skip_mul(5) # 5 * 3 * 1
    15
    >>> skip_mul(8) # 8 * 6 * 4 * 2
    384
    """
    if n == 2 or n == 1:
        return n
    else:
        return n * skip_mul(n - 2)

def count_up(n):
    """Print out all numbers up to and including n in ascending order.

    >>> count_up(5)
    1
    2
    3
    4
    5
    """
    def counter(i):
        if i > n:
            return
        print(i)
        counter(i + 1)
        "*** YOUR CODE HERE ***"
    counter(1)

def is_prime(n):
    """Returns True if n is a prime number and False otherwise.

    >>> is_prime(2)
    True
    >>> is_prime(16)
    False
    >>> is_prime(521)
    True
    """
    "*** YOUR CODE HERE ***"
    def is_divisor(i):
        if i == n:
            return True
        if n % i ==0:
            return False
        return is_divisor(i + 1)
    return is_divisor(2)

def interleaved_sum(n, odd_term, even_term):
    """Compute the sum odd_term(1) + even_term(2) + odd_term(3) + ..., up
    to n.

    >>> # 1 + 2^2 + 3 + 4^2 + 5
    ... interleaved_sum(5, lambda x: x, lambda x: x*x)
    29
    """
    "*** YOUR CODE HERE ***"
    def unit_sum(i, flag):
        if flag == 1:
            ans = odd_term(i)
        else:
            ans = even_term(i)
        if i == n:
            return ans
        else:
            return ans + unit_sum(i + 1, 1 - flag)
    return unit_sum(1, 1)


def ten_pairs(n):
    """Return the number of ten-pairs within positive integer n.

    >>> ten_pairs(7823952)
    3
    >>> ten_pairs(55055)
    6
    >>> ten_pairs(9641469)
    6
    """
    "*** YOUR CODE HERE ***"
    def counter(i, n):
        if n == 0:
            return 0
        elif n % 10 == i:
            return counter(i, n // 10) + 1
        else:
            return counter(i, n // 10)
    if n == 0:
        return 0
    else:
        return ten_pairs(n // 10) + counter(10 - n % 10, n // 10)
