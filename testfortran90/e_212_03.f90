read *, n
i=2; k=0
do while (i<=int(sqrt(n*1.)) .and. k==0)
    if(mod(n,i).eq.0) then
        k=i
    else
        i=i+1
    end if
end do
if(k==0) then
    print *, '是素数'
else
    print *, '不是素数，可被',k,'整除'
end if
end