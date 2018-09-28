%um from m=1:n 
function re=uup(n,kx,ky,x,y,parameters)
areadiamond=parameters.areadiamond;
cellnumber=parameters.cellnumber;
Nmax=parameters.Nmax;
b1=parameters.b1;
b2=parameters.b2;
d=parameters.d;
[narray,~]=size(x);
[~,aa]=energy(kx,ky,parameters);
total=0;counter=0;

ah=aa(:,1:n);
pages=(2*Nmax+1)*(2*Nmax+1);
aa_g=aa(:,n);
sum_g=zeros(narray,narray,pages);
aa3_g=zeros(1,1,pages);
aa3_g(:)=aa_g;
jsum_g=b1(1)*x+b1(2)*y;
ksum_g=b2(1)*x+b2(2)*y;
jindexset=repmat(-Nmax:Nmax,2*Nmax+1,1);
jindex=jindexset(:);
iindexset=transpose(jindexset);
kindex=iindexset(:);
jindex_g=zeros(1,1,pages);
jindex_g(:)=jindex;
kindex_g=zeros(1,1,pages);
kindex_g(:)=kindex;
exp_g=exp(1i*(jindex_g.*jsum_g+kindex_g.*ksum_g));
re=reshape(reshape(exp_g,[],pages)*ah,narray,narray,n);
end