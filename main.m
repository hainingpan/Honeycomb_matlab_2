% Entrance
% global a d h mu hbar e c Nmax cellnumber b1 b2 areadiamond coarr tmp offdiag NN;
% Parameters
parameters=struct('a',5.076,'d',15.5417,'h',0.0046053,'mu',18.396,'hbar',1,'e',1,'c',1,'g',5.75e-3,'mx',400*3.6*5.11,'eph',0,'eexc',0,'dtn',-14.58700084/1000,'Nmax',5,'cellnumber',400,'NN',100,'Nk',100,'gammakraw',2.74E-01,'gamma',1.87E-04);

parameters.b1=2*pi/(parameters.d)*[1/sqrt(3) -1/3];
parameters.b2=2*pi/(parameters.d)*[0 2/3];
parameters.areadiamond=3*sqrt(3)/2*(parameters.d)^2;
% Fourier Transformation
parameters.coarr=zeros(4*parameters.Nmax+1);
for n=-2*parameters.Nmax:2*parameters.Nmax
    for m=-2*parameters.Nmax:2*parameters.Nmax
        parameters.coarr(n+2*parameters.Nmax+1,m+2*parameters.Nmax+1)=coa(n,m,parameters);
    end
end
[X,Y]=meshgrid(-parameters.Nmax:parameters.Nmax,-parameters.Nmax:parameters.Nmax);
parameters.tmp=zeros(2*parameters.Nmax+1,2*parameters.Nmax+1);
parameters.tmp(:,:,1)=X;
parameters.tmp(:,:,2)=Y;
parameters.tmp=reshape(parameters.tmp,[(2*parameters.Nmax+1)^2,2]);
tmp2=zeros((2*parameters.Nmax+1)^2,(2*parameters.Nmax+1)^2,2);
for j=1:(2*parameters.Nmax+1)^2
    tmp2(j,:,:)=parameters.tmp;
end
N=tmp2(:,:,1)-transpose(tmp2(:,:,1))+2*parameters.Nmax+1;
M=tmp2(:,:,2)-transpose(tmp2(:,:,2))+2*parameters.Nmax+1;
tmp3=(M-1)*(4*parameters.Nmax+1)+N;
parameters.offdiag=parameters.coarr(tmp3);


