function re=t(n,rx1,ry1,rx2,ry2,parameters)
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
F1=real(wfuna2(n,XX,YY,rx1,ry1,parameters));
F2=real(wfunb(n,XX,YY,rx2,ry2,parameters));
FI=interp2(F1,4);
FI2=interp2(F2,4);
x2=linspace(nn(1),pp(1),length(FI));
y2=linspace(nn(2),pp(2),length(FI));
nor=trapz(y2,trapz(x2,FI2.*FI2,2));
% nor=trapz(y,trapz(x,conj(F2).*F2,2));
FI=FI/sqrt(nor);
FI2=FI2/sqrt(nor);
s=FI.*FI2;
re=trapz(y2,trapz(x2,s,2));
end