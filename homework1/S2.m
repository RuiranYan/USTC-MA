function [x,time] = S2(A,b,x_exact,w)
%S2 使用Sor迭代求解线性系统，加速

D = diag(A);
D_inv = 1./D;
err = zeros(1500,1);
x = eye(size(b));
xsize=size(b,1);
tic
for i=1:1500
    err(i)=max(abs(x-x_exact));
    x(1)=(1-w)*x(1)+w*D_inv(1)*(b(1)+x(2));
    for j=(1+1):(size(b,1)-1)
        x(j)=(1-w)*x(j)+w*D_inv(j)*(b(j)+x(j-1)+x(j+1));
    end
    x(xsize) = (1-w)*x(xsize)+w*D_inv(xsize)* ...
    (b(xsize)+x(xsize-1));
end
time = toc;
err(1500);
end


