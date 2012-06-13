clear
for K=1:15							
	A = zeros(K,K) ;					%<2>
	for ii = 1:K						%<3>
		for jj = 1:K					%<4>
			A(ii,jj) = 1/(ii+jj-1);	
		end
	end									%<7>
	CA(K)=cond(A);					
	if K==5							
		format rat					
		disp('A5='),disp(A)
		format							
	end
end
semilogy(CA)							
grid on
xlabel('矩阵的阶'),ylabel('矩阵条件数')
title('Hilbert矩阵的条件数')
