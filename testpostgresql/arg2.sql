-- Before run a plpgsql script, createlang first!
-- $ createlang plpgsql $DB_NAME

--DROP FUNCTION foo();
CREATE OR REPLACE FUNCTION foo(TEXT) RETURNS TEXT AS $$
DECLARE
	--citys varchar(20) := 'San Francisco';
	citys varchar(20) := $1;
	city_name TEXT;
BEGIN
	SELECT INTO city_name city FROM weather WHERE city=citys AND prcp > 0.0;
	RETURN city_name;
END;
$$ LANGUAGE plpgsql;
select foo(:city);
