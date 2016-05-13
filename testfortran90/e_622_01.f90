FUNCTION hex(n)
	CHARACTER(LEN=8) :: hex
	CHARACTER(LEN=1) :: h(0:15) = (/ '0', '1', '2', '3', '4', '5', '6', &
								'7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' /)
	INTEGER, INTENT(IN) :: n
	INTEGER :: nin, j, nn
	hex = ' '
	nin = n            ! n仅用于输入，不能再被赋值。
	DO j = 8, 1, -1
		nn = nin/16
		hex(j:j) = h(nin-16*nn)
		IF(nn == 0) EXIT
		nin = nn
	END DO
END FUNCTION

PROGRAM main
	CHARACTER(LEN=8) :: hex  !函数名的类型在引用侧也须加以声明
	INTEGER :: i
	PRINT *, 'Input a positive Integer or negative one to stop:'
	DO
		READ *, i;   IF( i<0 ) EXIT 
		PRINT *, hex(i)
	END DO
END
