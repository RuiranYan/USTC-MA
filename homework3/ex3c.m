h=0.001;% 设置步长
x=0:h:2;
y=zeros(1,size(x,2));
% 得到多步法系数
alpha=1/3*h;
beta=4/3*h;
gamma=1/3*h;
y(1)=0;%初始值
%RUNGE-KUTTA方法
k1=x(1)*exp(-4*x(1))-4*y(1);
k2=(x(1)+h/2)*exp(-4*(x(1)+h/2))-4*(y(1)+h/2*k1);
y(2)=y(1)+h*k2;
%多步转移
for i=3:size(x,2)
    y(i)=1/(4*alpha+1)*( ...
        y(i-2)+alpha*x(i)*exp(-4*x(i)) ...
        +beta*(x(i-1)*exp(-4*x(i-1))-4*y(i-1)) ...
        +gamma*(x(i-2)*exp(-4*x(i-2))-4*y(i-2))...
        );
end
%画图
figure
plot(x,y)
