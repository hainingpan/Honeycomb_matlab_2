function re=populationplot(index,parameters)
d=parameters.d;
NN=parameters.NN;
xr=(4*pi/(3*sqrt(3)*d));
xcr=(2*pi/(3*sqrt(3)*d));
yc=(2*pi)/(3*d);
k=yc/(xcr-xr);
b=(xr*yc)/(-xcr + xr);
popmap=zeros(NN);
enmap=zeros(NN);
kxset=linspace(-4*xr,4*xr,NN);
kyset=linspace(-4*yc,4*yc,NN);
for kyind=1:NN
    for kxind=1:NN
            kx=kxset(kxind);
            ky=kyset(kyind);
            popmap(kyind,kxind)=population(index,kx,ky,parameters); 
            en=energy(kx,ky,parameters);
            enmap(kyind,kxind)=en(index);
    end
end
re={popmap,enmap};
% ub=max(max(enmap));
% lb=min(min(enmap));
% itv=10;
% endiv=linspace(lb,ub,NN/itv);
% ldos=zeros(NN/itv,1);
% for ii=1:NN/itv-1
% ldos(ii)=mean(popmap(endiv(ii)<enmap & enmap<endiv(ii+1)));
% end
% figure
% surf(linspace(-xr,xr,NN),linspace(-yc,yc,NN),ttemp,'FaceColor','interp','EdgeColor','none','FaceLighting','gouraud');
% view(2)
% re=[endiv(1:end)',ldos];
end