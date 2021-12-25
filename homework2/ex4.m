% 初始化x,y
y=[0.6087;0.6849;0.7368;0.8111];
x=[2.1;2.5;2.8;3.2];
% 对x,y每个元素取倒数
y_inv=1./y;
x_inv=1./x;
A=[ones(size(x)) x_inv];% 得到A矩阵
Y=y_inv;% 得到Y矩阵
b_a=(A'*A)\(A'*Y);% 通过最小二乘法得到a,b
% 输出a,b的值
a=b_a(2)
b=b_a(1)
y_pred=x./(b_a(1).*x+b_a(2));% 得到预测的y值
l2=norm(y-y_pred)% 计算2-范式并打印