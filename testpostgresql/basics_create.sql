---------------------------------------------------------------------------
--
-- basics.sql-
--    Tutorial on the basics (table creation and data manipulation)
--
--
-- $PostgreSQL: pgsql/src/tutorial/basics.source,v 1.5.12.1 2010/02/02 18:52:06 momjian Exp $
--
---------------------------------------------------------------------------

-----------------------------
-- Creating a New Table:
--	A CREATE TABLE is used to create base tables.  PostgreSQL has
--	its own set of built-in types.  (Note that SQL is case-
--	insensitive.)
-----------------------------

CREATE TABLE weather (
	city		varchar(80),
	temp_lo		int,		-- low temperature
	temp_hi		int,		-- high temperature
	prcp		real,		-- precipitation
	date		date
);

CREATE TABLE cities (
	name		varchar(80),
	location	point
);


-----------------------------
-- Populating a Table With Rows:
--	An INSERT statement is used to insert a new row into a table.  There 
--	are several ways you can specify what columns the data should go to.
-----------------------------

-- 1. The simplest case is when the list of value correspond to the order of
--    the columns specified in CREATE TABLE.

INSERT INTO weather 
    VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');

INSERT INTO cities 
    VALUES ('San Francisco', '(-194.0, 53.0)');

-- 2. You can also specify what column the values correspond to.  (The columns
--    can be specified in any order.  You may also omit any number of columns,
--    e.g., unknown precipitation below.

INSERT INTO weather (city, temp_lo, temp_hi, prcp, date)
    VALUES ('San Francisco', 43, 57, 0.0, '1994-11-29');

INSERT INTO weather (date, city, temp_hi, temp_lo)
    VALUES ('1994-11-29', 'Hayward', 54, 37);
