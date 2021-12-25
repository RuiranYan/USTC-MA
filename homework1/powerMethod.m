function [lambda,v] = powerMethod(A,x,eps,itr)
%POWERMETHOD 幂法求模最大特征值及其对应特征向量

lambda=[];
v=[];
for i=1:itr
    y=x./max(abs(x));
    x=A*y;
end
y1=x./max(abs(x));
x1=A*y1;
err1=max(abs(x1./y1-x./y));
err2=max(abs(A*x1./y1-A*x./y));
if err1<eps
    lambda=max((x1)./y1);
    v=y;
elseif err2<eps
    lamda1=sqrt((A*A*y)./y);
    lambda=[lambda lamda1(1)];
    lamda2=-lamda1;
    lambda=[lambda lamda2(1)];
    v1=A*A*y+lamda1(1).*(A*y);
    v1=v1./max(abs(v1));
    v=[v v1];
    v2=A*A*y-lamda1(1).*(A*y);
    v2=v2./max(abs(v2));
    v=[v v2];
end
end

