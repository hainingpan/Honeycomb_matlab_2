function re=wfi(n,x,y,parameters)
% global d 
d=parameters.d;
NN=parameters.NN;
areafbz=8*pi^2/(3*sqrt(3)*d^2);
xr=(4*pi/(3*sqrt(3)*d));
xcr=(2*pi/(3*sqrt(3)*d));
yc=(2*pi)/(3*d);
k=yc/(xcr-xr);
b=(xr*yc)/(-xcr + xr);
sum=0;
for kx=linspace(-xr,xr,NN)
    for ky=linspace(-yc,yc,NN)
                 sum=sum+exp(-1i*(sqrt(3)*d*kx/2+ky*d/2)).*um(n,kx,ky,x,y,parameters).*(~((abs(kx)<=xr)&(abs(kx)>=xcr)&(abs(ky)>k*abs(kx)+b)));
         
    end
end
re=sum/(NN)*sqrt(4*xr*yc/areafbz);
end