implicit none
integer :: i,n
real :: y=0, term

read *, n
do i=1,n
	term=1./(i*(i+1))
	y=y+term
	if(abs(term)<=1.e-5) exit
end do
print *, 'sum',y,' term=',i

end
