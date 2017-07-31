SUBROUTINE count(n)
   INTEGER :: sum=0            !sum的初始值设定不要放在类型定义语句中
   DO i=1, 10
      sum=sum+i
   END DO
   n=sum                       !子程序执行后sum的值没有被忘记
END

PROGRAM main
  INTEGER :: n
  CALL count(n); PRINT*, n
  CALL count(n); PRINT*, n
END


