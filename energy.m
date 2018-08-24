function [eiv,vec]=energy(kx,ky,parameters)

tmp=parameters.tmp;
d=parameters.d;
offdiag=parameters.offdiag;
hbar=parameters.hbar;
mu=parameters.mu;
Nmax=parameters.Nmax;
tmp4=[kx,ky]+[2*pi/(sqrt(3)*d),4*pi/(3*d)].*tmp-[zeros(size(tmp(:,2))),tmp(:,1)].*[0,2*pi/(3*d)];
H=hbar^2/(2*mu)*eye((2*Nmax+1)^2).*(tmp4*tmp4')+offdiag;
[vec,ei]=eig(H);
eiv=diag(ei);

end
