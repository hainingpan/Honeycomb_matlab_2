function correctt(n,rx,ry,parameters)
d=parameters.d;
Nk=parameters.Nk;

xr=(4*pi/(3*sqrt(3)*d));
xcr=(2*pi/(3*sqrt(3)*d));
yc=(2*pi)/(3*d);
k=yc/(xcr-xr);
b=(xr*yc)/(-xcr + xr);

cor=correct(n,parameters);

ss=zeros(Nk,Nk);
kxrange=linspace(-xr,xr,Nk);

parfor kxindex=1:Nk
    kyrange=linspace(-yc,yc,Nk);
    for kyindex=1:Nk
        kx=kxrange(kxindex);
        ky=kyrange(kyindex);
        ttemp=um(n,kx,ky,rx,ry,parameters);
%         ttemp=um(n,kx,ky,rx,ry,parameters).*(~((abs(kx)<=xr)&(abs(kx)>=xcr)&(abs(ky)>=k*abs(kx)+b))); 
        ss(kyindex,kxindex)=ttemp;
%       ss(kyindex,kxindex)=cor(kyindex,kxindex)*ttemp; 
    end
end
re=real(ss);
im=imag(ss);
re=abs(ss);
x=linspace(-xr,xr,Nk);
y=linspace(-yc,yc,Nk);
% % [X,Y]=meshgrid(x,y);
% figure
% % plot(x,re(15,:))
% surf(x,y,re,'FaceColor','interp','EdgeColor','none','FaceLighting','gouraud');
% view(2)
% colorbar
% title(strcat('real of wf in k-space @n=',num2str(n)));
% 
figure
surf(x,y,im,'FaceColor','interp','EdgeColor','none','FaceLighting','gouraud');
view(2)
colorbar
title(strcat('imag of wf in k-space @n=',num2str(n)));

%% save modulus
% ftemp=figure;
% surf(x,y,re,'FaceColor','interp','EdgeColor','none','FaceLighting','gouraud');
% view(2)
% colorbar
% title(strcat('modulus of wf in k-space @n=',num2str(n)));
% savefig(ftemp,strcat('.\energy\pk\',num2str(n),'.fig'));

end