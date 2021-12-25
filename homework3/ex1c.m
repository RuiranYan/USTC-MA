h=1;%设置步长
itr=20;%迭代次数
f_1_pred=zeros(itr,1);
f_1=cos(1.2);%真实结果
n=1:itr;
%Richardson外推
for i=1:itr
    f_1_pred(i)=Richardson(1.2,i,h);
end
f_1_pred %打印估算值
err=abs(f_1_pred-f_1) %打印误差
%画图
figure
semilogy(n,err)