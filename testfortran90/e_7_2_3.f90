CHARACTER xyz(3)
INTEGER(4) idata(35)
DATA idata/35*-1/,xyz/'x', 'y', 'z'/
OPEN(3,FILE='USEQ',FORM='UNFORMATTED')
WRITE(3) idata
WRITE(3) xyz
CLOSE(3)
END
