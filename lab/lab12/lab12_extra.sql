.read lab12.sql

CREATE TABLE sp17favnum AS
  SELECT number, count(*) as count from sp17students group by number order by count desc limit 1;


CREATE TABLE sp17favpets AS
  SELECT pet, count(*) as count from sp17students group by pet order by count desc limit 10;


CREATE TABLE fa17favpets AS
  SELECT pet, count(*) as count from students group by pet order by count desc limit 10;


CREATE TABLE fa17dog AS
  SELECT pet, count(*) from students where pet = 'dog';


CREATE TABLE fa17alldogs AS
  SELECT 'dog', count(*) from students where pet like '%dog%';


CREATE TABLE obedienceimages AS
  SELECT seven, denero, hilfinger, count(*) from students where seven = '7' group by denero, hilfinger;

CREATE TABLE smallest_int_count AS
  SELECT smallest, count(*) from students group by smallest;
