function re=bloch2wannier(Uk,kset,rx,ry,parameters)
cellnumber=parameters.cellnumber;
d=parameters.d;
NN=parameters.NN;
pp=[3/4*sqrt(3*cellnumber)*d 3*sqrt(cellnumber)*d/4];
np=[-sqrt(3*cellnumber)*d/4 3*sqrt(cellnumber)*d/4];
nn=[-3/4*sqrt(3*cellnumber)*d -3/4*sqrt(cellnumber)*d];
pn=[sqrt(3*cellnumber)*d/4 -3*d/4*sqrt(cellnumber)];
x=linspace(nn(1),pp(1),NN);
y=linspace(nn(2),pp(2),NN);
[XX,YY]=meshgrid(x,y);
re=0;
Nband=length(Uk{1});
parfor kindex=1:length(kset)
    kx=kset{kindex}(1);
    ky=kset{kindex}(2);
%     psi=zeros(NN,NN,Nband);
%     for nindex=1:Nband
%         psi(:,:,nindex)=psim(nindex,kx,ky,XX,YY,parameters);
%     end
    psi=psiaup(Nband,kx,ky,XX,YY,parameters);
    re=re+reshape((Uk{kindex}*reshape(psi,[],Nband).').',NN,NN,Nband).*exp(-1i*[kx,ky]*[rx,ry]');
end
% R=conj(re).*re;
% intR=trapz(y,trapz(x,R,2));
% re=re./sqrt(intR);
end
    