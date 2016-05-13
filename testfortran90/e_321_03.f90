parameter (n=10)
write(*,'(a)') '  Loop:   1st   2nd   3rd'

loop_1: do i=1,n
	if(i.gt.3) exit loop_1
	write(*,1) i
	loop_2: do j=1,n
		if(j.gt.2) cycle loop_2
		if(i.eq.2 .and. j.gt.1) exit loop_2
		write(*,2) j
		loop_3: do k=1,n
			if(k.gt.2) cycle loop_3
			if(i.eq.1 .and. j.gt.1) exit loop_2 !跳出最内2层循环
			write(*,3) k
		end do loop_3
	end do loop_2
end do loop_1

1 format(10x,i2)
2 format(16x,i2)
3 format(22x,i2)

end
