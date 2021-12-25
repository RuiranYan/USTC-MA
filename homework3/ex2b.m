format long
real_result=7.9549265210128;%真实值
max_m=100;%设置最大区间数
pred_result=zeros(max_m,1);%初始化
m=1:max_m;
for mi=1:max_m
    h=2*pi/mi;%计算步长
    %得到算法结果
    result=0.5*(exp(cos(-pi))+exp(cos(pi)));
    for i=1:mi-1
        result=result+exp(cos(-pi+i*h));
    end
    result=result*h;
    %保存结果
    pred_result(mi)=result;
end
%得到误差
err=abs(pred_result-real_result);
%画图
figure
semilogy(m,err)