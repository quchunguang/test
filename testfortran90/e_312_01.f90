double precision x, term, sum
read *, n,x
term=1.d0 ; sum=1.d0
do 10 i=1,n
	term=term*x/i;	sum=sum+term
10 continue
print *, sum
end