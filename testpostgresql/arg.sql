SELECT * FROM weather WHERE city=:city::varchar(20) AND prcp > 0.0;
