INTEGER :: nn(0:9), j
CHARACTER(LEN=80):: cn
CHARACTER(LEN=30):: fmt
nn = (/ 1, 5, 12, 22, 28, 35, 48, 28, 10, 3 /)
fmt='(1X, I2, "-", I2, 1X, A50)'
DO j=0, 9
	CALL str(nn(j),cn)
	PRINT fmt, 10*j, 10*j+9, cn
END DO
END

SUBROUTINE str(n,c)
	INTEGER, INTENT(IN) :: n
	CHARACTER(LEN=80), INTENT(OUT) :: c
	INTEGER :: k
	c=' '; c(1:1)='I'
	DO k=2, n+1
		c(k:k) = '+'
	END DO
END
