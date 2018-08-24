%% generate wfuna and wfuna2
function [wfa,wfa2]=wannier(n,x,y,rx,ry,parameters)
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
sum2=0;
cor=correct(n,parameters);
kxrange=linspace(-xr,xr,Nk);
if (n==2)||(n==4)
    parfor kxindex=1:Nk 
        kyrange=linspace(-yc,yc,Nk);
        for kyindex=1:Nk
            kxi=kxrange(kxindex);
            kyi=kyrange(kyindex);
            ek=energy(kxi,kyi,parameters);
            ss=exp(-1i*([kxi,kyi]*([rx,ry])')).*exp(1i*(kxi*x+kyi*y)).*cor(kyindex,kxindex).*ua(n,kxi,kyi,x,y,parameters).*(~((abs(kxi)<=xr)&(abs(kxi)>=xcr)&(abs(kyi)>k*abs(kxi)+b)));
            ss2=ss*ek(n);
            sum= sum+ ss;  
            sum2=sum2+ss2;        
        end
    end
else
    parfor kxindex=1:Nk 
        kyrange=linspace(-yc,yc,Nk);
        for kyindex=1:Nk
            kxi=kxrange(kxindex);
            kyi=kyrange(kyindex);
            ek=energy(kxi,kyi,parameters);
            ss=exp(-1i*([kxi,kyi]*([rx,ry])')).*exp(1i*(kxi*x+kyi*y)).*cor(kyindex,kxindex).*ub(n,kxi,kyi,x,y,parameters).*(~((abs(kxi)<=xr)&(abs(kxi)>=xcr)&(abs(kyi)>k*abs(kxi)+b)));
            ss2=ss*ek(n);
            sum= sum+ ss;  
            sum2=sum2+ss2;        
        end
    end
end
wfa=sum*4*xr*yc/Nk^2/areafbz;
wfa2=sum2*4*xr*yc/Nk^2/areafbz;
end