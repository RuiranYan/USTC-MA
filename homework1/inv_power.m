function [lambda,v] = inv_power(A,x,eps,itr)
%INV_POWER 反幂法求模最小特征值及其对应特征向量

lambda=[];
v=[];
for i=1:itr
    y=x./max(abs(x));
    x=A\y;
end
y1=x./max(abs(x));
x1=A\y1;
err1=max(abs(x1./y1-x./y));
err2=max(abs(A\x1./y1-A\x./y));
if err1<eps
    lambda=max((x1)./y1);
    v=y;
elseif err2<eps
    lambda1=sqrt((A\(A\y))./y);
    lambda=[lambda 1/lambda1(1)];
    lambda2=-lambda1;
    lambda=[lambda 1/lambda2(1)];
    v1=A\(A\y)+lambda1(1).*(A\y);
    v1=v1./max(abs(v1));
    v=[v v1];
    v2=A\(A\y)-lambda1(1).*(A\y);
    v2=v2./max(abs(v2));
    v=[v v2];
end
end


