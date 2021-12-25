function [x,time] = G2(A,b,x_exact)
%G2 使用Gauss-Seidel迭代求解线性系统，加速

D = diag(A);
D_inv = 1./D;
err = zeros(1500,1);
x = eye(size(b));
tic
for i=1:1500
    err(i)=max(abs(x-x_exact));
    x(1)=D_inv(1)*(b(1)+x(2));
    for j=(1+1):(size(b,1)-1)
        x(j)=D_inv(j)*(b(j)+x( j-1)+x(j+1));
    end
    x(size(b,1)) = D_inv(size(b,1))*(b(size(b,1))+x(size(b,1)-1));
end
time = toc;
err(1500);
end

