function [eiv,vec]=energycp(kx,ky,parameters)

tmp=parameters.tmp;
d=parameters.d;
offdiag=parameters.offdiag;
hbar=parameters.hbar;
Nmax=parameters.Nmax;
eph=parameters.eph;
eexc=parameters.eexc;
mx=parameters.mx;
dtn=parameters.dtn;
g=parameters.g;
mph=18.396;
tmp4=[kx,ky]+[2*pi/(sqrt(3)*d),4*pi/(3*d)].*tmp-[zeros(size(tmp(:,2))),tmp(:,1)].*[0,2*pi/(3*d)];
H11=(eph+dtn+hbar^2/(2*mph).*(tmp4*tmp4')).*eye((2*Nmax+1)^2)+offdiag;
H12=g.*eye((2*Nmax+1)^2);
H22=(eexc+hbar^2/(2*mx).*(tmp4*tmp4')).*eye((2*Nmax+1)^2);
H=[H11,H12;H12,H22];
[vec,ei]=eig(H);
eiv=diag(ei);

end
