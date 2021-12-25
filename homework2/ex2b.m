u=[-1:2/1999:1];% 分割2000个区间
y_real=1./(1.+25*u.^2);% 真实值
err_max=[];
n2=[];% n2储存不同n值
for exp=2:7
    n=2^exp;
    x=[];
    for j=0:n
        x=[x cos(j*pi/n)]; % Chebyshev点
    end
    y=1./(1+25*x.^2);
    % 形成差商表
    g=y;
    for k=1:n
        for j=n:-1:k
            g(j+1)=(g(j+1)-g(j))/(x(j+1)-x(j-k+1));
        end
    end
    % 得到newton插值函数
    t=1;
    newton=g(1);
    for k=1:n
        t=t.*(u-x(k));
        newton=newton+t*g(k+1);% 插值结果用newton储存
    end
    err_max=[err_max max(abs(newton-y_real))];
    n2=[n2 2^exp];
end
err_max;
% 画图
figure
semilogy(n2,err_max)