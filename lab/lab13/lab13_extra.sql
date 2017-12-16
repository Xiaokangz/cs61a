CREATE TABLE pairs AS
	with nums(n) as (
		select 0 union
		select n + 1 from nums where n < 42
	)
	select a.n as x, b.n as y from nums as a, nums as b where a.n <= b.n;