! example of namelist input

namelist/my/n,m
read (*,nml=my)
write(*,nml=my)
end

!the following are valid input for namelist variable assignment:

! $my n=1/
! $my n=2$
! $my n=3$end
! &my n=4&
! &my n=5$END

! &my
!  n=1
!  m=2
!  /