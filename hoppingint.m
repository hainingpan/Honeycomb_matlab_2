function [tdata,t1data,tVdata,t1Vdata,Udata]=hoppingint(n,parameters)
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
rx1=0;ry1=d;
neighborset={[0,2*d],[sqrt(3)/2*d,d/2],[-sqrt(3)/2*d,d/2]};
nextneighborset={[sqrt(3)*d,d],[sqrt(3)/2*d,5/2*d],[-sqrt(3)/2*d,5/2*d],[-sqrt(3)*d,d],[-sqrt(3)/2*d,-1/2*d],[sqrt(3)/2*d,-1/2*d]};
[XX,YY]=meshgrid(x,y);
[F1,F1e]=wannier(n,XX,YY,rx1,ry1,parameters);
F1=real(F1);
F1e=real(F1e);
tdata=zeros(1,3);
t1data=zeros(1,6);
tVdata=zeros(1,3);
t1Vdata=zeros(1,6);
FI=interp2(F1,4);
FIe=interp2(F1e,4);
n2=length(FI);
x2=linspace(nn(1),pp(1),n2);
y2=linspace(nn(2),pp(2),n2);
[xx2,yy2]=meshgrid(x2,y2);
nor=trapz(y2,trapz(x2,FI.*FI,2));
FI=FI/sqrt(nor);
FIe=FIe/sqrt(nor);
ru=FI.^4;
Udata=trapz(y2,trapz(x2,ru,2));
for ii=1:3
    rx2=neighborset{ii}(1);
    ry2=neighborset{ii}(2);    
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
    st=FIe.*F2;
    tdata(ii)=trapz(y2,trapz(x2,st,2));
    V=vm(xx2,yy2,parameters);
    sv=FI.*F2.*V;
    tVdata(ii)=trapz(y2,trapz(x2,sv,2));
end

for ii=1:6
    rx2=nextneighborset{ii}(1);
    ry2=nextneighborset{ii}(2);  
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
    st=FIe.*F2;
    t1data(ii)=trapz(y2,trapz(x2,st,2));
    V=vm(xx2,yy2,parameters);
    sv=FI.*F2.*V;
    t1Vdata(ii)=trapz(y2,trapz(x2,sv,2));
end  
end