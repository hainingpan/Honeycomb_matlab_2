function re=lw(kx,ky,epsilon,parameters)
Nmax=parameters.Nmax;
d=parameters.d;
b1=parameters.b1;
b2=parameters.b2;
xr=(4*pi/(3*sqrt(3)*d));
xcr=(2*pi/(3*sqrt(3)*d));
yc=(2*pi)/(3*d);
k=yc/(xcr-xr);
b=(xr*yc)/(-xcr + xr);
gammak=parameters.gammakraw/d;
gamma=parameters.gamma;
%%
% mband=100;
mband=2*(2*Nmax+1)^2;

%%
tot=0;
[KX,KY]=meshgrid(linspace(-xr,xr,21),linspace(-yc,yc,21));
for kk=1:length(KX(:))
    kx0=KX(kk);
    ky0=KY(kk);
%     [evalue,evector]=energy(kx0,ky0,parameters);
    [evalue,evector]=energycp(kx0,ky0,parameters);
    evalueset=(abs(evector(1:(2*Nmax+1)^2,1:mband)).^2);
    [epsilonmat,evaluemat]=meshgrid(epsilon,evalue(1:mband));
    lorentz=1./((epsilonmat-evaluemat).^2+gamma^2);    

%     if (~((abs(kx0)<=xr)&(abs(kx0)>=xcr)&(abs(ky0)>=k*abs(kx0)+b)))
        linewidthset=zeros(2*Nmax+1);
        for i=-Nmax:Nmax
            for j=-Nmax:Nmax        
                linewidthset(j+Nmax+1,i+Nmax+1)= exp(-norm([kx,ky]-([kx0,ky0]+[i,j]*[b1;b2]))^2/gammak^2);
            end
        end    
        tot=tot+linewidthset(:)'*evalueset*lorentz;
%     end
end
re=tot;
end