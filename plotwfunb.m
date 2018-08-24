function plotwfunb(n,parameters)
% global d a
d=parameters.d;
a=parameters.a;
cellnumber=parameters.cellnumber;
NN=parameters.NN;
pp=[3/4*sqrt(3*cellnumber)*d 3*sqrt(cellnumber)*d/4];
np=[-sqrt(3*cellnumber)*d/4 3*sqrt(cellnumber)*d/4];
nn=[-3/4*sqrt(3*cellnumber)*d -3/4*sqrt(cellnumber)*d];
pn=[sqrt(3*cellnumber)*d/4 -3*d/4*sqrt(cellnumber)];
x=linspace(nn(1),pp(1),NN);
y=linspace(nn(2),pp(2),NN);
[XX,YY]=meshgrid(x,y);
if (n==2||n==4)
    Fw=(wfunb(n,XX,YY,0,2*d,parameters));
else
    Fw=(wfunb(n,XX,YY,0,d,parameters));
end
F=real(Fw);
Fi=imag(Fw);
figure;
surf(x,y,F,'FaceColor','interp','EdgeColor','none','FaceLighting','gouraud');
title(strcat('real of Wannier function @n=',num2str(n)))
view(2);
colorbar;
axis tight
% hold on
% site1=[sqrt(3)/2*d,d/2];
% site2=[sqrt(3)*d,d];
% for i=-5:5
%     for j=-5:5
%         centerpoint=site1+i*[sqrt(3)*d,0]+j*[sqrt(3)/2*d,3/2*d];
%         circle(centerpoint(1),centerpoint(2),a);
%         centerpoint2=site2+i*[sqrt(3)*d,0]+j*[sqrt(3)/2*d,3/2*d];
%         circle(centerpoint2(1),centerpoint2(2),a);
%     end
% end
% axis([-5*d,5*d,-5*d,5*d])
% 
% figure
% surf(x,y,Fi,'FaceColor','interp','EdgeColor','none','FaceLighting','gouraud');
% view(2);
% title(strcat('imag of Wannier function @n=',num2str(n)));
% colorbar
% hold on
% site1=[sqrt(3)/2*d,d/2];
% site2=[sqrt(3)*d,d];
% for i=-5:5
%     for j=-5:5
%         centerpoint=site1+i*[sqrt(3)*d,0]+j*[sqrt(3)/2*d,3/2*d];
%         circle(centerpoint(1),centerpoint(2),a);
%         centerpoint2=site2+i*[sqrt(3)*d,0]+j*[sqrt(3)/2*d,3/2*d];
%         circle(centerpoint2(1),centerpoint2(2),a);
%     end
% end
% axis([-5*d,5*d,-5*d,5*d])