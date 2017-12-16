create table records as
	select "Ben Bitdiddle" as name, "Computer" as division, "Wizard" as title, 6000 as salary, "Oliver Warbucks" as supervisor union
	select "Alyssa P Hacker", "Computer", "Programmer", 40000, "Ben Bitdiddle" union
	select "Cy D Fect", "Computer", "Programmer", 35000, "Ben Bitdiddle" union
	select "Lem E Tweakit", "Computer", "Technician", 25000, "Ben Bitdiddle" union
	select "Louis Reasoner", "Computer", "Programmer Trainee", 30000, "Alyssa P Hacker" union
	select "Oliver Warbucks", "Administration", "Big Wheel", 150000, "Oliver Warbucks" union
	select "Eben Scrooge", "Accounting", "Chief Accountant", 75000, "Oliver Warbucks" union
	select "Robert Cratchet", "Accounting", "Scrivener", 18000, "Eben Scrooge";

create table meetings as
	select "Accounting" as division, "Monday" as day, "9am" as time union
	select "Computer", "Wednesday", "4pm" union
	select "Administration", "Monday", "11am" union
	select "Administration", "Thursday", "1pm";

create table courses as
	select "John DeNero" as professor, "CS 61A" as course, "Fa17" as semester union
	select "Paul Hilfinger", "CS 61A", "Fa17" union
	select "Paul Hilfinger", "CS 61A", "Sp17" union
	select "John DeNero", "Data 8", "Sp17" union
	select "Josh Hug", "CS 61B", "Sp17" union
	select "Satish Rao", "CS 70", "Sp17" union
	select "Nicholas Weaver", " CS 61C", "Sp17" union
	select "Gerald Friendland", "CS 61C", "Sp17" union
	select "John DeNero", "CS 61A", "Fa16" union
	select "Paul Hilfinger", "CS 61B", "Fa16";

create table num_taught as
	select "Gerald Friendland" as professor, "CS 61C" as course, 1 as times union
	select "John DeNero", "CS 61A", 2 union
	select "John DeNero", "Data 8", 1 union
	select "Josh Hug", "CS 61B", 1 union
	select "Nicholas Weaver", "CS 61C", 1 union
	select "Paul Hilfinger", "CS 61A", 2 union
	select "Paul Hilfinger", "CS 61B", 1 union
	select "Satish Rao", "CS 70", 1;
