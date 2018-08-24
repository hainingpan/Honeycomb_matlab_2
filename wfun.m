function re=wfun(n,x,y,parameters)
% global d ;
d=parameters.d;
NN=parameters.NN;
areafbz=8*pi^2/(3*sqrt(3)*d^2);
xr=(4*pi/(3*sqrt(3)*d));
xcr=(2*pi/(3*sqrt(3)*d));
yc=(2*pi)/(3*d);
k=yc/(xcr-xr);
b=(xr*yc)/(-xcr + xr);
re=zeros(NN,NN);
KX=linspace(-xr,xr,NN);%fbz
KY=linspace(-yc,yc,NN);i=1;
sum=0;
for kx=linspace(-xr,xr,NN)
    for ky=linspace(-yc,yc,NN)
            sum= sum+exp(-1i*([kx,ky]*([0,0]+[0,0])')).*ub(n,kx,ky,x,y,parameters).*(~((abs(kx)<=xr)&(abs(kx)>=xcr)&(abs(ky)>k*abs(kx)+b)));           
    end
end
re=sum*4*xr*yc/NN^2;

% for kx=linspace(-xr,xr,NN)
%     for ky=linspace(yc,-yc,NN)
%             re(i)= exp(-1i*([kx,ky]*([0,0]+[0,0])')).*ua(n,kx,ky,x,y).*(~((abs(kx)<=xr)&(abs(kx)>=xcr)&(abs(ky)>k*abs(kx)+b)));
%             i=i+1;
%     end
% end
% re=trapz(KY,trapz(KX,re,2));
end