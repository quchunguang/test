integer h(5)
data h/5*0/
write(*,'(5i5)') h  !I/O列表中的数组
h=2
write(*,100) h(2:3) !I/O列表中的数组片段
100 format(2i3)
end
