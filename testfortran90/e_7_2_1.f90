OPEN(3,FILE='FSEQ')
!  FSEQ is a formatted sequential fife by default.
WRITE(3,'(A,I3)') 'RECORD',1
WRITE(3, '()')
WRITE(3, '(A11) ') 'The 3rd one'
CLOSE(3)
END

