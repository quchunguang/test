x=-12345.6789
y=0.456789
z=7.89123e23
write(*,'(3(1x,en13.5  ))') x,y,z
write(*,'(3(1x,en13.2e4))') x,y,z
write(*,'(3(1x,es13.5  ))') x,y,z
write(*,'(3(1x,es13.2e4))') x,y,z
end
