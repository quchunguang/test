INTEGER :: nn(0:8)=(/0,1,2,3,4,5,6,7,8/), mm(0:7)

FORALL(i=0:7)
	nn(i) = 0
	mm(i) = nn(i+1)
END FORALL

! µÈ¼ÛÓÚ nn(0:7) = 0
!        mm(0:7) = nn(1:8)

write(*,'(a,10i2)') 'nn= : ',nn
write(*,'(a,10i2)') 'mm= : ',mm

nn(0:8)=(/0,1,2,3,4,5,6,7,8/)

DO i=0,7
	nn(i) = 0
	mm(i) = nn(i+1)
END DO

write(*,*)
write(*,'(a,10i2)') 'nn= : ',nn
write(*,'(a,10i2)') 'mm= : ',mm
END
