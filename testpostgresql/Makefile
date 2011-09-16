# Install
#   $ sudo apt-get install postgresql
#   $ sudo -u postgres sh
#   $ createuser -A -D qcg
#   新角色允许创建其它新的角色吗? (y/n) y
# Create database $(DB_NAME) before `make`
#   $ createdb -O qcg mydb
#   $ exit
DB_NAME=mydb
DB_USER_NAME=qcg
#OPTIONS=-A -t  # run without table header and extra spaces
OPTIONS=-s 	# run step by step

all: 		create queue
clean: 		drop

create: 	basics_create.sql
	psql -U $(DB_USER_NAME) $(OPTIONS) -f $< $(DB_NAME)
queue: 		basics_queue.sql
	psql -U $(DB_USER_NAME) $(OPTIONS) -f $< $(DB_NAME)
drop: 		basics_drop.sql
	psql -U $(DB_USER_NAME) $(OPTIONS) -f $< $(DB_NAME)
arg: 		arg.sql
	psql -U $(DB_USER_NAME) $(OPTIONS) -f $< -v city="'San Francisco'" $(DB_NAME)
arg2: 		arg2.sql
	psql -U $(DB_USER_NAME) $(OPTIONS) -f $< -v city="'San Francisco'" $(DB_NAME)
