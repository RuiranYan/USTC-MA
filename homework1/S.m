function [x,time] = S(A,b,x_exact,w)
%S 使用Sor迭代求解线性系统，不加速

D = diag(diag(A));
L = tril(A)-diag(diag(A));
U = triu(A) - diag(diag(A));
D_inverse = diag(diag(1./A));
L_tilde = -D_inverse*L;
U_tilde = -D_inverse*U;
g = D_inverse*b;

err = zeros(1500,1);
x = eye(size(b));
tic
for i=1:1500
   err(i) = max(abs(x-x_exact));
   %if err(i)< 1e-15
   %    break;
   %end
   x = (eye(size(A))-w.*L_tilde)\...
   (((1-w).*eye(size(A))+w.*U_tilde)*x+w.*g); 
end
time = toc;

a = 1:1500;
semilogy(a,err)
s = ['\leftarrow w=',num2str(w)];
text(50,err(50),s,'FontSize',20)
hold on

end

