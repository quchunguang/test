implicit none
integer :: score,n0=0,n1=0,n2=0,n3=0,n4=0
do 
	read *, score
	if(score<0 .or. score>100) then
		print *,'满分=',n0,' 优=',n1,' 良=',n2,' 及格=',n3,' 不及格=',n4
		exit
	else
		select case(score)
			case(100)
				print *, '满分'; n0=n0+1
			case(85:99)
				print *, '优  '; n1=n1+1
			case(70:84)
				print *, '良  '; n2=n2+1
			case(60:69)
				print *, '及格'; n3=n3+1
			case default
				print *, '不及格'; n4=n4+1
		end select
	end if
end do
END
