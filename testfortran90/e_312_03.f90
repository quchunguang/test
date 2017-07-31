dimension A(20), B(20,30)
integer, parameter:: i_max=4, j_max=5
integer sum/0/

do 10 i=1,i_max
	A(i)=i
	sum=sum+A(i)
10 continue
print *, sum

do 20 i=1,i_max
20 A(i)=i+1

do i=1,i_max
	A(i)=i*i
end do

do 100 i=1,i_max
	do 200 j=1,j_max
		B(i,j)=A(i)+j
	200 continue
100 continue

do 300 i=1,i_max
	A(i)=i/10.
	do 300 j=1,j_max
300		B(i,j)=A(i)**2/j

do i=1,i_max
	do j=1,j_max
		print *, i,j
	end do
end do

end