function re=tV(n,rx1,ry1,rx2,ry2,parameters)
global cellnumber d NN
cellnumber=parameters.cellnumber;
d=parameters.d;
NN=parameters.NN;
pp=[3/4*sqrt(3*cellnumber)*d 3*sqrt(cellnumber)*d/4];
np=[-sqrt(3*cellnumber)*d/4 3*sqrt(cellnumber)*d/4];
nn=[-3/4*sqrt(3*cellnumber)*d -3/4*sqrt(cellnumber)*d];
pn=[sqrt(3*cellnumber)*d/4 -3*d/4*sqrt(cellnumber)];
x=linspace(nn(1),pp(1),NN);
y=linspace(nn(2),pp(2),NN);

%x=gpuArray(x);
%y=gpuArray(y);
[XX,YY]=meshgrid(x,y);
% tic
% knw=um(1,0,0,XX,YY,parameters);
% toc
F1=real(wfuna(n,XX,YY,rx1,ry1,parameters));
% F2=real(wfunb(n,XX,YY,rx2,ry2,parameters));
FI=interp2(F1,4);
% F2=interp2(F2,4);
n2=length(FI);
x2=linspace(nn(1),pp(1),length(FI));
y2=linspace(nn(2),pp(2),length(FI));
[xx2,yy2]=meshgrid(x2,y2);
nor=trapz(y2,trapz(x2,FI.*FI,2));
% fprintf("%d",n2);
tranx=rx2-rx1;
trany=ry2-ry1;
tranxind=floor(tranx/((pp(1)-nn(1))/n2));
tranyind=floor(trany/((pp(2)-nn(2))/n2));
F2=circshift(FI,[tranyind,tranxind]);
if (tranxind<=0)
    xshift=(1:-tranxind);
else
    xshift=(mod(-tranxind,n2):n2);
end
if (tranyind<=0)
    yshift=(1:-tranyind);
else
    yshift=(mod(-tranyind,n2):n2);
end
F2(yshift,:)=0;
F2(:,xshift)=0;

FI=FI/sqrt(nor);
F2=F2/sqrt(nor);
V=vm(xx2,yy2,parameters);                                                                                                                                                                                                                                                                                                                                            
s=FI.*F2.*V;
re=trapz(y2,trapz(x2,s,2));
end