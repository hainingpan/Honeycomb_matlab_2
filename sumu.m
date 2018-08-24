function re=sumu(n,rx1,ry1,rx2,ry2,offset,parameters)
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
F1=real(wfuna(n,XX,YY,rx1,ry1,parameters));
re=F1;
% F2=real(wfuna(n,XX,YY,rx2,ry2,parameters));
% nor=trapz(y,trapz(x,conj(F2).*F2,2));
% F1=F1/sqrt(nor);
% F2=F2/sqrt(nor);
% i=1;
% UF=zeros(NN);
% for xi=x
%     for yi=y
%         U=real(1./sqrt((xi+offset-XX)^2+(yi+offset-YY)^2));        
%         s=U.*F2;
%         UF(i)=trapz(y,trapz(x,s,2));
%         i=i+1;
%     end
% end
% s2=F1.*UF;
% re=trapz(y,trapz(x,s2,2));
end