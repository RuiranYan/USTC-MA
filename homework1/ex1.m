% ex1.a.b
aaa = ones(10,1);
bbb = [-aaa,aaa*2,-aaa];
A = spdiags(bbb,[-1 0 1],10,10);
b = [2;-2;2;-1;0;0;1;-2;2;-2];
x_exact = [1;0;1;0;0;0;0;-1;0;-1];
timeList = zeros(3,2);
% J method
J(A,b,x_exact);
% G method
G(A,b,x_exact);
w=[0.3 0.6 1.3 1.6];
for i=1:4
    S(A,b,x_exact,w(i));
end

%ex1.c
%迭代次数:1500，Sor迭代w=1.6
T=zeros(10,1);
for i =1:10
    [~,T(i)]=J(A,b,x_exact);
end
timeList(1,1) = sum(T);
for i =1:10
    [~,T(i)]=G(A,b,x_exact);
end
timeList(2,1) = sum(T);
for i =1:10
    [~,T(i)]=S(A,b,x_exact,1.6);
end
timeList(3,1) = sum(T);
for i =1:10
    [~,T(i)]=J2(A,b,x_exact);
end
timeList(1,2) = sum(T);
for i =1:10
    [~,T(i)]=G2(A,b,x_exact);
end
timeList(2,2) = sum(T);
for i =1:10
    [~,T(i)]=S2(A,b,x_exact,1.6);
end
timeList(3,2) = sum(T);
timeList
