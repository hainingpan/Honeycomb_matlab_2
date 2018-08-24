% x=linspace(-5*d,5*d,NN);
% y=linspace(-5*d,5*d,NN);
% [X,Y]=meshgrid(x,y);
% nrdata=nr(3,X,Y);
% figure;
% surf(linspace(-10*d,10*d,NN),linspace(-10*d,10*d,NN),real(nrdata),'FaceColor','interp','EdgeColor','none','FaceLighting','gouraud');
% view(2);
% 
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
for jj=1:1
x=linspace(-5*d,5*d,NN);
y=linspace(-5*d,5*d,NN);
[X,Y]=meshgrid(x,y);
nrdata=nr(jj,X,Y);
figure;
surf(linspace(-10*d,10*d,NN),linspace(-10*d,10*d,NN),real(nrdata),'FaceColor','interp','EdgeColor','none','FaceLighting','gouraud');
view(2);

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
end