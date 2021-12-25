function f=Richardson(x_0,j,h)
if j==1 %边界
    f=(sin(x_0+h)-sin(x_0))./h;
else %递归过程
    f=(2^(j-1)*Richardson(x_0,j-1,h/2) ...
        -Richardson(x_0,j-1,h))/(2^(j-1)-1);
end

