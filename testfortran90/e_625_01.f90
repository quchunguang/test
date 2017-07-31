PROGRAM main
	INTERFACE
		REAL FUNCTION trace(sqr)
			REAL,INTENT(IN) :: sqr(:,:) ! 迟型数组
		END FUNCTION
	END INTERFACE   

	REAL,ALLOCATABLE :: a(:,:)
	INTEGER :: n,i
	PRINT*,'正方矩阵的行数(或列数)='
	READ*, n
	ALLOCATE(a(n,n))
	DO i=1,n
		PRINT '(A,I2,A)','第',i,'行元素='
		READ *, a(i,1:n)
	END DO
	PRINT '(A,F7.4)','Trace = ',trace(a)
END

FUNCTION trace(x) RESULT(tr)
	REAL,INTENT(IN) :: x(:,:)      ! 2维数组
	REAL :: tr
	INTEGER :: n1,n2,i
	n1=SIZE(x,1); n2=SIZE(x,2)
	IF(n1/=n2) THEN
		PRINT*,'非正方矩阵' ; RETURN
	ELSE
		tr=0.
		DO i=1,n1
			tr=tr+x(i,i)
		END DO
	END IF
END FUNCTION
