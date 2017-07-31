	Complex Function f0(a,b,z)
	complex a,b,z
	f0=a*z+b*conjg(z)
	return
	end
c
	Complex Function f1(c,d,z)
	complex c,d,z
	f1=C*(z-1)+d*(conjg(z)-1)+1
	return
	end
c
	Program Complex_map
	implicit none
	complex f0,f1,a,b,c,d,ORIGIN,val
	integer order,loop,i,func_list,lsb
	parameter(ORIGIN=(0.0,0.0),order=18)
c
	call init_Complex_map(a,b,c,d)
c
	open(1,file='fenxing.dat')	
	do loop=0,2**order-1
		val=f0(a,b,val)
		func_list=loop
		do i=1,order
			lsb=func_list.and.'01'x
			if(lsb.eq.0) then
				val=f0(a,b,val)
			else
				val=f1(c,d,val)
			end if
			func_list=func_list/2
		end do
		write(1,*) real(val),aimag(val)
	end do
	close(1)
	end
	
	Subroutine init_complex_map(a,b,c,d)
	complex a,b,c,d
	a=(0.0,0.0)
	b=cmplx(0.4614,0.4614)
	c=cmplx(0.622,-0.196)
	d=(0.0,0.0)
c
	a=(0.0,0.0)
	b=cmplx(1./2, sqrt(3.)/6)
	c=(0.0,0.0)
	d=cmplx(1./2,-sqrt(3.)/6)
	return
	end