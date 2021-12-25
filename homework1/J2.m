function [x2,time] = J2(A,b,x_exact)
%J2 使用Jacobi迭代求解线性系统，加速

D = diag(A);
D_inv = 1./D;
err = zeros(1500,1);
x2 = eye(size(b));
xsize=size(b,1);
tic
for i=1:1500
    x1 = x2;
    err(i)=max(abs(x2-x_exact));
    x2(1)=D_inv(1)*(b(1)+x1(2));
    for j=(1+1):(size(b,1)-1)
        x2(j)=D_inv(j)*(b(j)+x1(j-1)+x1(j+1));
    end
    x2(xsize) = D_inv(xsize)*(b(xsize)+x1(xsize-1));
end
time = toc;
err(1500);
end

