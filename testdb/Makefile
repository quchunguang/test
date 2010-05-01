all: 		testmysql
clean: 		
	rm -f testmysql *~
testmysql: 	testmysql.c
	gcc testmysql.c -Wall -ansi -o testmysql -L/user/lib/mysql -lmysqlclient
