read *, m,n
do while (m/=n)
	do while (m>n)
		m=m-n
	end do
	do while (n>m)
		n=n-m
	end do
end do
print *, '最大公约数＝',m
end