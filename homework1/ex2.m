format long
xl0=-1.5;
xm0=0.5;
xr0=3;
a0=[1,-3,0,2];
a1=[3,-6,0];
m=10;%迭代次数
err=[];
xl_list=xl0;
x=xl0;
nl=[];
for i=1:m
    x1=x-(a0(1)*x^3+a0(2)*x^2+a0(3)*x+a0(4)) ...
        /(a1(1)*x^2+a1(2)*x+a1(3));
    if abs(x1-x)<=1e-15
        break
    end
    err=[err;(x1-x)];
    if i>2
        loge_k_0=log10(abs(err(i-2)+err(i-1)));
        loge_k_1=log10(abs(err(i-1)+err(i)));
        loge_kplus1_0=log10(abs(err(i-1)));
        loge_kplus1_1=log10(abs(err(i)));
        nl=[nl;(loge_kplus1_0-loge_kplus1_1)... 
            /(loge_k_0-loge_k_1)];
    end
    xl_list = [xl_list;x1];
    x=x1;
end
x
xl_list
%err;
nl
err=[];
xm_list=xm0;
x=xm0;
nm=[];
for i=1:m
    x1=x-(a0(1)*x^3+a0(2)*x^2+a0(3)*x+a0(4))... 
        /(a1(1)*x^2+a1(2)*x+a1(3));
    if abs(x1-x)<=1e-15
        break
    end
    err=[err;(x1-x)];
    if i>2
        loge_k_0=log10(abs(err(i-2)+err(i-1)));
        loge_k_1=log10(abs(err(i-1)+err(i)));
        loge_kplus1_0=log10(abs(err(i-1)));
        loge_kplus1_1=log10(abs(err(i)));
        nm=[nm;(loge_kplus1_0-loge_kplus1_1)... 
            /(loge_k_0-loge_k_1)];
    end
    xm_list = [xm_list;x1];
    x=x1;
end
x
xm_list
%err;
nm
err=[];
xr_list=xr0;
x=xr0;
nr=[];
for i=1:m
    x1=x-(a0(1)*x^3+a0(2)*x^2+a0(3)*x+a0(4))... 
        /(a1(1)*x^2+a1(2)*x+a1(3));
    if abs(x1-x)<=1e-15
        break
    end
    err=[err;(x1-x)];
    if i>2
        loge_k_0=log10(abs(err(i-2)+err(i-1)));
        loge_k_1=log10(abs(err(i-1)+err(i)));
        loge_kplus1_0=log10(abs(err(i-1)));
        loge_kplus1_1=log10(abs(err(i)));
        nr=[nr;(loge_kplus1_0-loge_kplus1_1)... 
            /(loge_k_0-loge_k_1)];
    end
    xr_list = [xr_list;x1];
    x=x1;
end
x
xr_list
%err;
nr


