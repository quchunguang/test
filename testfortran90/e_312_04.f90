dimension a(20)
open(1,file='in.dat',form='formatted',status='old')
read(1,*) (a(i),i=1,20)

do i=1,20
	do j=i+1,20
		if(a(i) < a(j)) then
			x=a(i); a(i)=a(j); a(j)=x
		end if
	end do
end do

print *, a
end