function re=U(n,rx1,ry1,parameters)
% global cellnumber d NN
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
F1=real(wfuna(n,XX,YY,rx1,ry1,parameters));
nor=trapz(y,trapz(x,conj(F1).*F1,2));
F1=F1/sqrt(nor);
s=abs(F1).^4;
re=trapz(y,trapz(x,s,2));
end