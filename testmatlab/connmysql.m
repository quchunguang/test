connA = database('test', 'root', 'qu-cg123', 'com.mysql.jdbc.Driver', 'jdbc:mysql://localhost:3306/test');
ping(connA);

cursorA = exec(connA, 'select id, date from testmatlab');
cursorA = fetch(cursorA);    % Fetch all rows of data
A = cell2mat(cursorA.Data)

close(cursorA);             % Close the cursor and the connection.
close(connA);