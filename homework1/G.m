function [x,time] = G(A,b,x_exact)
%G 使用Gauss-Seidel迭代求解线性系统，不加速

D = diag(diag(A));
L = tril(A)-diag(diag(A));
U = triu(A) - diag(diag(A));
err = zeros(1500,1);
x = eye(size(b));
tic
for i=1:1500
    err(i) = max(abs(x-x_exact));
    x = (D+L)\(-U*x+b);
end
time = toc;
a = 1:1500;
semilogy(a,err)
s = '\leftarrow Gauss-Seidel';
text(300,err(300),s,'FontSize',20)
hold on
end

