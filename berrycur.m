function curvature=berrycur(n,parameters)
areadiamond=parameters.areadiamond;
% n=3;
nor=sqrt(areadiamond);
d=parameters.d;
Nk=parameters.Nk;
NN=parameters.NN;
xr=(4*pi/(3*sqrt(3)*d))*1.2;
yc=(2*pi)/(3*d)*1.2;
kxlist=linspace(-xr,xr,Nk);
kylist=linspace(-yc,yc,Nk);
xlist=linspace(0,sqrt(3)*d,NN);
ylist=linspace(0,3/2*d,NN);
[xgrid,ygrid]=meshgrid(xlist,ylist);
% wf=zeros(kx,ky,x,y)
wf=zeros(Nk,Nk,NN,NN);
for xindex=1:Nk
    for yindex=1:Nk
        kx=kxlist(xindex);
        ky=kylist(yindex);
        tmp=um(n,kx,ky,xgrid,ygrid,parameters)/nor;        
        psic=tmp(NN/2,NN/2);
%         psic=tmp(1,1);
%         if xindex==1 && yindex==1
%             if abs(real(psic))>abs(imag(psic))
%                 op=@real;
%             else
%                 op=@imag;
%             end
%         end     
%         wf(xindex,yindex,:,:)=((op(psic)<0)*(-1)+(op(psic)>=0)).*tmp;   
        factor=abs(psic)/psic;
        wf(xindex,yindex,:,:)=tmp*factor;
    end
end
wfdx=zeros(Nk,Nk,NN,NN);
wfdy=zeros(Nk,Nk,NN,NN);
for xindex=1:NN
    for yindex=1:NN
        x=xlist(NN);
        y=ylist(NN);
        [wdx,wdy]=gradient(wf(:,:,xindex,yindex),(2*xr)/(Nk-1),(2*yc)/(Nk-1));
        wfdx(:,:,xindex,yindex)=wdx;
        wfdy(:,:,xindex,yindex)=wdy;        
    end
end
curvature=zeros(Nk,Nk);
for xindex=1:Nk
    for yindex=1:Nk
        wdx=wfdx(xindex,yindex,:,:);
        wdy=wfdy(xindex,yindex,:,:);
        cur=-1i*(conj(wdx).*wdy-conj(wdy).*wdx);
        curvature(xindex,yindex)=trapz(ylist,trapz(xlist,squeeze(cur),2));
    end
end
end 
% save('wf.mat','wf');
% save('curvature.mat','curvature');
