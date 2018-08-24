function re=wfuna(n,x,y,rx,ry,parameters)
% global d NN;
d=parameters.d;
Nk=parameters.Nk;
areafbz=8*pi^2/(3*sqrt(3)*d^2);
xr=(4*pi/(3*sqrt(3)*d));
xcr=(2*pi/(3*sqrt(3)*d));
yc=(2*pi)/(3*d);
k=yc/(xcr-xr);
b=(xr*yc)/(-xcr + xr);
sum=0;
cor=correct(n,parameters);
kxrange=linspace(-xr,xr,Nk);
parfor kxindex=1:Nk 
    kyrange=linspace(-yc,yc,Nk);
    for kyindex=1:Nk
        kxi=kxrange(kxindex);
        kyi=kyrange(kyindex);
        ss=exp(-1i*([kxi,kyi]*([rx,ry])')).*exp(1i*(kxi*x+kyi*y)).*cor(kyindex,kxindex).*ua(n,kxi,kyi,x,y,parameters).*(~((abs(kxi)<=xr)&(abs(kxi)>=xcr)&(abs(kyi)>k*abs(kxi)+b)));
        sum= sum+ ss;     
    end
end
re=sum*4*xr*yc/Nk^2/areafbz;
end