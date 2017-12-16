class Tree:
	def __init__(self, label, branches=()):
		self.label = label
		self.branches = list(branches)

	def is_leaf(self):
		return not self.branches

	def __repr__(self):
		if self.is_leaf():
			return 'Tree(' + repr(self.label) + ')'
		return 'Tree(' + repr(self.label) + ', ' + repr(self.branches) + ')'

class Link:
	empty = ()

	def  __init__(self, first, rest=empty):
		self.first = first
		self.rest = rest

	def __repr__(self):
		if self.rest is Link.empty:
			rest = ''
		else:
			rest = ', ' + repr(self.rest)
		return 'Link({0}{1})'.format(self.first, rest)

def skip(lst):
	if lst is Link.empty:
		return lst
	if lst.rest is Link.empty:
		return Link(lst.first)
	return Link(lst.first, skip(lst.rest.rest))

def skip(lst):
	if lst is Link.empty or lst.rest is Link.empty:
		return lst
	lst.rest = skip(lst.rest.rest)
	return lst

def reverse(lst):
	def reverse_helper(lst, temp=Link.empty):
		if lst is Link.empty:
			return temp
		return reverse_helper(lst.rest, Link(lst.first, temp))
	return reverse_helper(lst)

def reverse(lst):
	if lst == Link.empty or lst.rest == Link.empty:
		return lst
	else:
		new_start = reverse(lst.rest)
		lst.rest.rest = lst
		lst.rest = Link.empty
		return new_start

def reverse(lst):
	if lst is Link.empty or lst.rest is Link.empty:
		return lst
	secondElement = lst.rest
	lst.rest = Link.empty
	reversedRest = reverse(secondElement)
	secondElement.rest = lst
	return reversedRest

def has_cycle(s):
	if s is Link.empty or s.rest is Link.empty:
		return False
	slow, fast = s, s.rest
	while fast is not Link.empty and fast.rest is not Link.empty:
		if fast is slow or fast.rest is slow:
			return True
		slow, fast = slow.rest, fast.rest.rest
	return False


class nil:
	def __repr__(self):
		return 'nil'

	def __len__(self):
		return 0

	def __getitem__(self, i):
		raise IndexError('Index out of range')

	def map(self, fn):
		return nil

nil = nil()

class Pair:
	def __init__(self, first, second):
		self.first = first
		self.second = second

	def __repr__(self):
		return 'Pair({}, {})'.format(self.first, self.second)

	def __len__(self):
		return 1 + len(self.second)

	def __getitem__(self, i):
		if i == 0:
			return self.first
		return self.second[i-1]

	def map(self, fn):
		return Pair(fn(self.first), self.second.map(fn))

def cal_eval(exp):
	if isinstance(exp, Pair):
		if exp.first == 'and':
			return eval_and(exp.second)
		else:
			return calc_apply(cal_eval(exp.first), list(exp.second.map(cal_eval)))
	elif exp in OPERATORS:
		return OPERATORS[exp]
	else:
		return exp

def calc_apply(op, args):
	return op(*args)

def eval_and(operands);
	curr  = operands
	last = True
	while curr is not nil:
		last = cal_eval(curr.first)
		if not last:
			return False
		curr = curr.second
	return last






































