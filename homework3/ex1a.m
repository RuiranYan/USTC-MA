h=[];
for i =-15:0
    h=[h,10^i];
end
f_1=cos(1.2);
f_1_pred=(sin(1.2+h)-sin(1.2))./h;
err=abs(f_1-f_1_pred);
figure
loglog(h,err)