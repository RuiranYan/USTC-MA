u=[-1:2/1999:1];% 分割2000个区间
y_real=1./(1.+25*u.^2);% 真实值
err_max=[];
n2=[];% n2储存n值
for exp=2:7
    n=2^exp;
    x=[];
    for j=0:n
        x=[x cos(j*pi/n)];
    end
    % 改变插值点顺序
    rng(22);
    x=x(randperm(size(x,2)));
    y=1./(1+25*x.^2);
    % 形成差商表
    g=y;
    for k=1:n
        for j=n:-1:k
            g(j+1)=(g(j+1)-g(j))/(x(j+1)-x(j-k+1));
        end
    end
    t=1;
    newton=g(1);
    for k=1:n
        t=t.*(u-x(k));
        newton=newton+t*g(k+1);
    end
    err_max=[err_max max(abs(newton-y_real))];
    n2=[n2 2^exp];
end
err_max;
% 画图
figure
semilogy(n2,err_max)