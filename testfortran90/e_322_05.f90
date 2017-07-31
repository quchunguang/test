!正弦函数用泰勒级数展开：sinx=x-x^3/3!+x^5/5!-x^7/7!+...。计算有限精度范围内的值。
real   , parameter:: pi=3.141592, err=1.e-6
integer, parameter:: max_terms=10

read *, x; x=x*pi/180
k=1; term=x; sin_=term

do while((abs(term)>err) .and. (k<=max_terms))
	term=-term*x*x/(2*k*(2*k+1))
	k=k+1
	sin_=sin_+term
	print *,k,sin_
end do

print *,sin(x)
end