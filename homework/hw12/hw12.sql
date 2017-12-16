CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size from dogs, sizes where height > min and height <= max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_height AS
  SELECT child from parents, dogs where parent = name order by height desc;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  with siblings as (select a.child as first, b.child as second from parents as a, parents as b where a.child < b.child and a.parent = b.parent)
  SELECT first || " and " || second || " are " || c.size || " siblings" from siblings, size_of_dogs as c, size_of_dogs as d where first = c.name and second = d.name and c.size = d.size;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks AS
  with 
    sums(names, total, n, last) as (
      select name, height, 1, height from dogs union 
      select names || ", " || name, total + height, n + 1, height from dogs, sums
      where height > last and n < 4
      )
  SELECT names, total from sums where total >= 170 order by total;
