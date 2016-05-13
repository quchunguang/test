!=====================    圆周率π的计算    ==============================!
!       π ＝ 32*Arctan(1/10) - 4*Arctan(1/239) - 16*Arctan(1/515)        !
! ========================================================================!
   MODULE multimal
      INTEGER :: mal = 10**5, prec
!
      INTERFACE OPERATOR(.plus.)                     ! .plus.  = +
         MODULE PROCEDURE add
      END INTERFACE
      INTERFACE OPERATOR(.minus.)                    ! .minus. = -
         MODULE PROCEDURE subtract
      END INTERFACE
      INTERFACE OPERATOR(.times.)                    ! .times. = *
         MODULE PROCEDURE multiply
      END INTERFACE
      INTERFACE OPERATOR(.div.)                      ! .div.   = /
         MODULE PROCEDURE divide
      END INTERFACE
!
   CONTAINS
!     --------------------------------------------------------------------
      FUNCTION add(x, y) RESULT(z)                   !  z = x + y
         INTEGER, INTENT(IN) :: x(0:prec), y(0:prec)
         INTEGER :: z(0:prec), i, zi, r
            r = 0
         DO i = prec, 0, -1
            zi = x(i) + y(i) + r
            r = zi/mal                               ! 重复
            z(i) = zi - r*mal
         END DO
      END FUNCTION add
!     --------------------------------------------------------------------
      FUNCTION subtract(x, y) RESULT(z)              !  z = x - y
         INTEGER, INTENT(IN) :: x(0:prec), y(0:prec)
         INTEGER :: z(0:prec), i, zi, r
            r = 1
         DO i = prec, 0, -1
            zi = x(i) + (mal - 1 - y(i)) + r
            r = zi/mal                               ! 重复
            z(i) = zi - r*mal
         END DO
      END FUNCTION subtract
!     --------------------------------------------------------------------
      FUNCTION multiply(x, s) RESULT(z)              !  z = x * s
         INTEGER, INTENT(IN) :: x(0:prec), s
         INTEGER :: z(0:prec), i, r, zi
            r = 0
         DO i = prec, 0, -1
            zi   = x(i)*s + r
            r    = zi/mal                            ! 重复
            z(i) = zi - r*mal
         END DO
      END FUNCTION multiply
!     --------------------------------------------------------------------
      FUNCTION divide(x, s) RESULT(z)                !  z = x / s
         INTEGER, INTENT(IN) :: x(0:prec), s
         INTEGER :: z(0:prec), i, r, zi
            r = 0 
         DO i = 0, prec
            zi   = x(i) + r*mal
            z(i) = zi/s
            r    = zi - s*z(i)                       ! 剩余
         END DO
      END FUNCTION divide
   END MODULE multimal
! ========================================================================
   PROGRAM pi_main                                   !!!    Main Program
      USE multimal
      INTEGER :: digit
      INTEGER, ALLOCATABLE :: pi(:)
!
      PRINT *," How many digits? (0 < digit < 100,000): "
      READ*, digit
      prec = CEILING(digit/5.0) + 1
      ALLOCATE( pi(0:prec) )
!
      pi =        (arctan( 10) .times. 32)       &
          .minus. (arctan(239) .times.  4)       &
          .minus. (arctan(515) .times. 16)
!
      PRINT "(20X, '***** π的计算 ( ', I6, ' 位 ) *****')", digit
      PRINT "(' π = 3.', I5.5, 9I6.5/(7X, 10I6.5))", pi(1:prec-1)
   CONTAINS
!     --------------------------------------------------------------------
      FUNCTION arctan(k) RESULT(a)                   !!!   a = Arctan(1/k) 
         INTEGER, INTENT(IN)  :: k
         INTEGER :: a(0:prec), unity(0:prec), n 
         unity = (/ 1, (0, n = 1, prec) /)           ! unity = 1.00000 00000...
            a = 0
         DO n = INT( 0.5*digit/LOG10(REAL(k)) )+1, 1, -1 
            a = (((unity .div.(2*n+1)) .minus. a) .div. k) .div. k
         END DO
            a = (unity .minus. a) .div. k            ! for n = 0 
      END FUNCTION arctan
   END PROGRAM pi_main
