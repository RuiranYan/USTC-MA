h0=1;%设置步长
N=20;%最大外推阶数
x0=1.2;
eps=1e-15;
f1=cos(1.2);%真实结果
h=[];
R=zeros(N);
for k=0:N
    h=[h h0/(2^k)];
end
R(1,1)=(sin(x0+h(1))-sin(x0))/h(1);
for k=2:N+1
    R(k,1)=(sin(x0+h(k))-sin(x0))/h(k);
    for j=2:k
        R(k,j)=(2^(j-1)*R(k,j-1)-R(k-1,j-1))/(2^(j-1)-1);
    end
    if abs(R(k,k)-R(k-1,k-1))<eps
        break
    end
end
R
f1_pred=[];
for i=1:k-1
    f1_pred=[f1_pred R(i,i)];
end
f1_pred %打印估算值
err=abs(f1_pred-f1) %打印误差
n=1:k-1;
figure
semilogy(n,err)