d=parameters.d;
NN=parameters.NN;
a=parameters.a;
xr=(4*pi/(3*sqrt(3)*d));
xcr=(2*pi/(3*sqrt(3)*d));
yc=(2*pi)/(3*d);
k=yc/(xcr-xr);
b=(xr*yc)/(-xcr + xr);
ss=zeros(NN,NN);
i=1;
for kx=linspace(-xr,xr,NN)
    for ky=linspace(-yc,yc,NN)
            etmp=energy(kx,ky,parameters);
            ss(i)=etmp(1)*(~((abs(kx)<=xr)&(abs(kx)>=xcr)&(abs(ky)>=k*abs(kx)+b)));
           i=i+1;
    end
end
er=zeros(NN,NN);
i=1;
for x=linspace(-10*d,10*d,NN)
    for y=linspace(-10*d,10*d,NN)
        kxset=linspace(-xr,xr,NN)*x;
        kyset=linspace(-yc,yc,NN)*y;
        [KXset,KYset]=meshgrid(kxset,kyset);
        expo=exp(1i*(KXset+KYset));
        intg=ss.*expo;
        er(i)=trapz(kyset,trapz(kxset,intg,2));
        i=i+1;
    end
end     
        
figure
surf(linspace(-10*d,10*d,NN),linspace(-10*d,10*d,NN),real(er),'FaceColor','interp','EdgeColor','none','FaceLighting','gouraud');
view(2);
colorbar
        

site1=[sqrt(3)/2*d,d/2];
site2=[sqrt(3)*d,d];
for i=-5:5
    for j=-5:5
        centerpoint=site1+i*[sqrt(3)*d,0]+j*[sqrt(3)/2*d,3/2*d];
        circle(centerpoint(1),centerpoint(2),a);
        centerpoint2=site2+i*[sqrt(3)*d,0]+j*[sqrt(3)/2*d,3/2*d];
        circle(centerpoint2(1),centerpoint2(2),a);
    end
end
 axis([-10*d,10*d,-10*d,10*d]);

