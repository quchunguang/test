!     This program demonstrates the NAMELIST Statement

      INTEGER(1) i1
      INTEGER(2) i2
      INTEGER(4) i4, iarray(3)
      LOGICAL(1) l1
      LOGICAL(2) l2
      LOGICAL    l4
      REAL       r4
      REAL(8)    r8         !(8)
      COMPLEX    z4
      COMPLEX(8) z8         !(8)
      CHARACTER  c1*1, c10*10
      NAMELIST /example/ i1, i2, i4, l1, l2, l4, r4, r8,                &
     &                   z4, z8, c1, c10, iarray
      i1  =  11
      i2  =  12
      i4  =  14
      l1  = .TRUE.
      l2  = .TRUE.
      l4  = .TRUE.
      r4  =  24.0
      r8  =  28.0d0
      z4  = (38.0, 0.0)
      z8  = (316.0d0, 0.0d0)
      c1  = 'A'
      c10 = 'abcdefghij'

      iarray(1) = 41
      iarray(2) = 42
      iarray(3) = 43
      WRITE (*,example)
      OPEN (9,FILE='nametest.dat')
      WRITE (9,example)
      END
