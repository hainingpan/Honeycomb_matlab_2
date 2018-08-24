%data=load('co.dat')
%PoFT(sqrt(3)*d/2,0);
x=linspace(-5*d,5*d,50);
y=linspace(-5*d,5*d,50);
[XX,YY]=meshgrid(x,y);
%f=@(x,y) arrayfun(@PoFT,x,y);
% f=@(x,y) arrayfun(@(xx,yy) um(1,0,0,xx,yy),x,y);
Fw=(wfuna2(1,XX,YY,0,2*d));
F=real(Fw);
Fi=imag(Fw);
% F=imag(um(1,(4*pi/(3*sqrt(3)*d)),0,XX,YY));
% F=re(PoFT(X,Y));
figure
surf(x,y,F,'FaceColor','interp','EdgeColor','none','FaceLighting','gouraud');
view(2)
% for i=1:50
% scatter(XX(:,i),YY(:,i),'filled','cdata',F(:,i))
% hold on
% end
colorbar
hold on

%Draw lattice
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
axis([-5*d,5*d,-5*d,5*d])