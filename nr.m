function re=nr(index,x,y)
global d NN;
xr=(4*pi/(3*sqrt(3)*d));
xcr=(2*pi/(3*sqrt(3)*d));
yc=(2*pi)/(3*d);
k=yc/(xcr-xr);
b=(xr*yc)/(-xcr + xr);
sum=0;
for kx=linspace(-xr,xr,NN)
    for ky=linspace(-yc,yc,NN)
            ttemp=population(index,kx,ky)*exp(1i*(kx*x+ky*y))*(~((abs(kx)<=xr)&(abs(kx)>=xcr)&(abs(ky)>=k*abs(kx)+b))); 
            sum=sum+ttemp;
    end
end
re=sum;
end