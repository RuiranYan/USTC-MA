n = 2^4; % 定义n
x = [-1:2/n:1]; % 得到区间端点x_i
% 得到h_i
h=[];
for i=1:n
    h=[h x(i+1)-x(i)];
end 
y=sin(4.*x.^2)+(sin(4.*x)).^2; % 得到y_i
% 初始化lambda,mu,d
lambda=ones(n,1);
mu=ones(n,1);
d=ones(n,1);
% 对除端点的lambda,mu,d赋值
for i=2:n
    lambda(i-1)=h(i)/(h(i)+h(i-1));
    mu(i-1)=1-lambda(i-1);
    d(i-1)=6/(h(i)+h(i-1))*((y(i+1)-y(i))/h(i) - (y(i)-y(i-1))/h(i-1));
end
% 对端点的lambda,mu,d赋值
d(n)=6/(h(1)+h(n))*((y(2)-y(1))/h(1) - (y(n+1)-y(n))/h(n));
%
lambda(n)=h(1)/(h(1)+h(n));
mu(n)=1-lambda(n);
lambda2=lambda;
lambda2(n)=[];
mu2=mu;
mu2(1)=[];
% 得到求解M的系数矩阵A
A=diag(mu2,-1)+2.*eye(n)+diag(lambda2,1);
A(1,n)=mu(1);
A(n,1)=lambda(n);
M=A\d; %得到M
M=[M(n);M]
x2=[-1:2/1999:1];% 分割2000个插值点
S=zeros(1,size(x2,1));% 初始化S
% 通过式(1)得到分段函数S
for i=1:n
    S=S+ ...
    (((x(i+1)-x2).^3*M(i)+(x2-x(i)).^3*M(i+1))/6/h(i) ...
    +((x(i+1)-x2)*y(i)+(x2-x(i))*y(i+1))/h(i) ...
    -(h(i)/6)*((x(i+1)-x2)*M(i)+(x2-x(i))*M(i+1)) ...
    ).*(x2>x(i)&x2<=x(i+1));% 分段函数即所有函数值.*其区间最后求和
end
% 单独得到S(1)
S(1)=((x(1+1)-x2(1)).^3*M(1)+(x2(1)-x(1)).^3*M(1+1))/6/h(1) ...
        +((x(1+1)-x2(1))*y(1)+(x2(1)-x(1))*y(1+1))/h(1) ...
        -(h(1)/6)*((x(1+1)-x2(1))*M(1)+(x2(1)-x(1))*M(1+1));
y2=sin(4.*x2.^2)+(sin(4.*x2)).^2;% 真实值
% 画图
figure
semilogy(x2,abs(y2-S))

err_max=zeros(1,7);% 初始化误差
n2=[];% n2储存n值
for exp=4:10
    n = 2^exp;% 定义n
    x = [-1:2/n:1];% 得到区间端点x_i
    % 得到h_i
    h=[];
    for i=1:n
        h=[h x(i+1)-x(i)];
    end 
    y=sin(4.*x.^2)+(sin(4.*x)).^2; % 得到y_i
    % 初始化lambda,mu,d
    lambda=ones(n,1);
    mu=ones(n,1);
    d=ones(n,1);
    % 对除端点的lambda,mu,d赋值
    for i=2:n
        lambda(i-1)=h(i)/(h(i)+h(i-1));
        mu(i-1)=1-lambda(i-1);
        d(i-1)=6/(h(i)+h(i-1))*((y(i+1)-y(i))/h(i) - (y(i)-y(i-1))/h(i-1));
    end
    % 对端点的lambda,mu,d赋值
    d(n)=6/(h(1)+h(n))*((y(2)-y(1))/h(1) - (y(n+1)-y(n))/h(n));
    %
    lambda(n)=h(1)/(h(1)+h(n));
    mu(n)=1-lambda(n);
    lambda2=lambda;
    lambda2(n)=[];
    mu2=mu;
    mu2(1)=[];
    % 得到求解M的系数矩阵A
    A=diag(mu2,-1)+2.*eye(n)+diag(lambda2,1);
    A(1,n)=mu(1);
    A(n,1)=lambda(n);
    M=A\d; %得到M
    M=[M(n);M];
    x2=[-1:2/1999:1];% 分割2000个插值点
    S=zeros(1,size(x2,1));% 初始化S
    % 通过式(1)得到分段函数S
    for i=1:n
        S=S+ ...
            (((x(i+1)-x2).^3*M(i)+(x2-x(i)).^3*M(i+1))/6/h(i) ...
            +((x(i+1)-x2)*y(i)+(x2-x(i))*y(i+1))/h(i) ...
            -(h(i)/6)*((x(i+1)-x2)*M(i)+(x2-x(i))*M(i+1)) ...
            ).*(x2>x(i)&x2<=x(i+1));
    end
    % 单独得到S(1)
    S(1)=((x(1+1)-x2(1)).^3*M(1)+(x2(1)-x(1)).^3*M(1+1))/6/h(1) ...
            +((x(1+1)-x2(1))*y(1)+(x2(1)-x(1))*y(1+1))/h(1) ...
            -(h(1)/6)*((x(1+1)-x2(1))*M(1)+(x2(1)-x(1))*M(1+1));
    y2=sin(4.*x2.^2)+(sin(4.*x2)).^2;% 真实值
    err_max(exp-3)=max(abs(y2-S));% 计算误差并保存
    n2=[n2 2^exp];
end
% 打印err_max结果
err_max ;
% 画图
figure
loglog(n2,err_max,'-')