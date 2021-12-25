n=2^6;
u=[0:1/999:1];% 取1000个等距点
y_real=sin(2*pi*u).*exp(cos(2*pi*u));% 真实值
x=[0:1/n:(n-1)/n];% 插值点
y=sin(2*pi*x).*exp(cos(2*pi*x));
y_pred=zeros(size(u));%初始化插值函数预测点
% Lagrange基函数组合
for k=1:n
    y_pred=y_pred+ ...
        y(k)*((-1)^(k-1)*sin(n*pi*u) ...
        .*cot(pi*(u-x(k))))/n ...
        .*(~ismembertol(u,x,1e-6)) ...
        +y(k).*(ismembertol(u,x,1e-6));
end
err = abs(y_pred-y_real);
figure
semilogy(u,err)