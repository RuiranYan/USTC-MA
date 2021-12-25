function [x,time] = J(A,b,x_exact)
%J 使用Jacobi迭代求解线性系统，不加速

D_inverse = diag(diag(1./A));% 对角矩阵的逆可以由对角线上元素取倒数得到
R = eye(size(A)) - D_inverse*A;
g = D_inverse*b;
err = zeros(1500,1);
x = eye(size(b));
tic
for i=1:1500
   err(i) = max(abs(x-x_exact));
   x = R*x+g;
end
time = toc;
a = 1:1500;
semilogy(a,err)
s = '\leftarrow Jacobi';
text(500,err(500),s,'FontSize',20)
hold on
end

