U=zeros(21,51);
for i=1:11
    x=0:0.02:1.00;
    t=0:0.1:2.00;
    
    [X,T]=meshgrid(x,t);
    
    for s=1:51
        U(1,s)=100+s-s;
        for q1=1:20
            q=q1+1;
            X1=0.02.*(s-1);
            T1=0.1.*(q-1);
            U(q,s)=U(q,s)+100.*(2/(i*pi)).*(1-cos(i*pi)).*sin(i.*pi.*X1).*exp(-i*i*T1);
        end
    end
end
mesh(x,t,U)