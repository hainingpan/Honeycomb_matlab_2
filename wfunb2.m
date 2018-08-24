%Ek*wfunb
function re=wfunb2(n,x,y,rx,ry,parameters)
% global d NN;
d=parameters.d;
NN=parameters.NN;
areafbz=8*pi^2/(3*sqrt(3)*d^2);
xr=(4*pi/(3*sqrt(3)*d));
xcr=(2*pi/(3*sqrt(3)*d));
yc=(2*pi)/(3*d);
k=yc/(xcr-xr);
b=(xr*yc)/(-xcr + xr);
i=1;
sum=0;
cor=correct(n,parameters);
for kx=linspace(-xr,xr,NN)
    for ky=linspace(-yc,yc,NN) 
        ek=energy(kx,ky,parameters);
        ss=ek(n)*exp(-1i*([kx,ky]*([rx,ry])')).*exp(1i*(kx*x+ky*y)).*cor(i).*ub(n,kx,ky,x,y,parameters).*(~((abs(kx)<=xr)&(abs(kx)>=xcr)&(abs(ky)>k*abs(kx)+b)));
            sum= sum+ ss;     
            i=i+1;
    end
end
re=sum*4*xr*yc/NN^2/areafbz;
end