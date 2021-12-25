pred=[];
n=[];
for i=1:5
    n=[n 10^i];
end
h=2./n;
for j=1:size(n,2)
    hi=1/n(j);
    x=0:hi:2;
    y=zeros(1,size(x,2));
    alpha=1/3*hi;
    beta=4/3*hi;
    gamma=1/3*hi;
    y(1)=0;
    %RUNGE-KUTTA
    k1=x(1)*exp(-4*x(1))-4*y(1);
    k2=(x(1)+hi/2)*exp(-4*(x(1)+hi/2))-4*(y(1)+hi/2*k1);
    y(2)=y(1)+hi*k2;
    for i=3:size(x,2)
        y(i)=1/(4*alpha+1)*( ...
            y(i-2)+alpha*x(i)*exp(-4*x(i)) ...
            +beta*(x(i-1)*exp(-4*x(i-1))-4*y(i-1)) ...
            +gamma*(x(i-2)*exp(-4*x(i-2))-4*y(i-2))...
            );
    end
    y(size(x,2))
    pred = [pred y(size(x,2))];
end
y2_real=0.5*2^2*exp(-4*2);
err_y2=abs(pred-y2_real);
figure
loglog(h,err_y2)