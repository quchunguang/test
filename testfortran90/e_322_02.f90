read *, n
j=int(sqrt(n*1.));	i=2; k=0
do_while: do while (i<=j)
	if(mod(n,i)==0) then
		k=i
		exit do_while
	end if
	i=i+1
end do do_while
if(k/=0) then
	print *, '不是素数，可被',k,'整除'
else
	print *, '是素数'
end if
end