format long
eps=1e-11;
itr=1000;
A1=[-148 -105 -83 -67;488 343 269 216;-382 -268 -210 -170;50 38 32 29];
A2=A1.*(-1);
A3=[222 580 584 786;-82 -211 -208 -288;37 98 101 132;-30 -82 -88 -109];
x=[1;1;1;1];
rng(2);
A4=rand(100,100);
p=complex(0.8,-0.6);
%(a):
[A1_lambda,A1_v]=powerMethod(A1,x,eps,itr)
[A2_lambda,A2_v]=powerMethod(A2,x,eps,itr)
%(b):
[A3_lambda,A3_v]=powerMethod(A3,x,eps,itr)
%(c):
[l,v]=inv_power((A4-p.*eye(100,100)),ones(100,1),eps,itr);
A4_lambda=1./l+p
A4_v=v
%判断结果正确性
%abs(A4_lamda-p)-min(abs(eig(A4)-p))<eps
%abs(min(eig(A4)-A4_lamda))<eps
%abs(max(v))

