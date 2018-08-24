parameters.d=2.699684791*5.076;
parameters.h=4.23512e-3;
parameters.mu=5.090841487*5.11;


d=parameters.d;
Nk=parameters.Nk;
Nmax=parameters.Nmax;
level=10;
areafbz=8*pi^2/(3*sqrt(3)*d^2);
xr=(4*pi/(3*sqrt(3)*d));
xcr=(2*pi/(3*sqrt(3)*d));
yc=(2*pi)/(3*d);
k=yc/(xcr-xr);
b=(xr*yc)/(-xcr + xr);
kxrange=linspace(-xr,xr,Nk);
kyrange=linspace(-yc,yc,Nk);
map=zeros(Nk,Nk,level);
for kxindex=1:Nk
    for kyindex=1:Nk
        kx=kxrange(kxindex);
        ky=kyrange(kyindex);
%         if (~((abs(kx)<=xr)&&(abs(kx)>=xcr)&&(abs(ky)>=k*abs(kx)+b)))
            en=energycp(kx,ky,parameters);
%         else
%             en=zeros(Nmax^2,1);
%         end
            for j=1:level
                map(kyindex,kxindex,j)=en(j);
            end
    end
end
         