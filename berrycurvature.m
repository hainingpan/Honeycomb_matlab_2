function [kcxmap,kcymap,kcx2map,kcy2map,bcmap,omega]=berrycurvature(level,parameters)
n=40;
b1=parameters.b1;
b2=parameters.b2;

% kp=parameters.kp;
% kn=parameters.kn;
a1=b1/(2*n);
a2=b2/(2*n);

xrange=-n:n;
yrange=-n:n;
kxmap=zeros(2*n+1,2*n+1);
kymap=zeros(2*n+1,2*n+1);
kcx2map=zeros(2*n,2*n); %after shifting to Hexagon
kcy2map=zeros(2*n,2*n);  %after shifting to Hexagon
umap=zeros(2*n+1,2*n+1,(2*parameters.Nmax+1)^2);
omega=abs(cross([a1,0],[a2,0]));
omega=omega(3);

Nx=length(xrange);
Ny=length(yrange);
parfor xindex=1:Nx
    kx=xrange(xindex);
    for yindex=1:Ny
        ky=yrange(yindex);
        k=kx*a1+ky*a2;
        [~,vec]=energy(k(1),k(2),parameters);
        umap(xindex,yindex,:)=vec(:,level);
        kxmap(xindex,yindex)=k(1);
        kymap(xindex,yindex)=k(2);
    end
end

kcxmap=(kxmap(1:end-1,1:end-1)+kxmap(1:end-1,2:end)+kxmap(2:end,1:end-1)+kxmap(2:end,2:end))/4;
kcymap=(kymap(1:end-1,1:end-1)+kymap(1:end-1,2:end)+kymap(2:end,1:end-1)+kymap(2:end,2:end))/4;

K_L=[-b2(2)/2/sqrt(3),b2(2)/2];
K_R=-K_L;
M_1=[0,b2(2)/2];
rotmat=@(x) [cos(x), sin(x);-sin(x), cos(x)];
M_2=M_1*rotmat(pi/3);
M_3=-M_1;
M_4=-M_2;
G_L=(b2-b1)/2;
G_R=-G_L;

parfor xindex=1:Nx-1
    for yindex=1:Ny-1
        k=[kcxmap(xindex,yindex),kcymap(xindex,yindex)];
        shift=[0,0];
        if inpolygon(k(1),k(2),[K_L(1),M_2(1),G_L(1)],[K_L(2),M_2(2),G_L(2)])
            shift=a1*2*n;
        end
        if inpolygon(k(1),k(2),[K_L(1),M_1(1),G_L(1)],[K_L(2),M_1(2),G_L(2)])
            shift=-a2*2*n;
        end
        if inpolygon(k(1),k(2),[K_R(1),M_3(1),G_R(1)],[K_R(2),M_3(2),G_R(2)])
            shift=a2*2*n;
        end
        if inpolygon(k(1),k(2),[K_R(1),M_4(1),G_R(1)],[K_R(2),M_4(2),G_R(2)])
            shift=-a1*2*n;
        end   
        kcx2map(xindex,yindex)=k(1)+shift(1);
        kcy2map(xindex,yindex)=k(2)+shift(2);
    end
end
    
    
    % kcx2map=(kx2map(1:end-1,1:end-1)+kx2map(1:end-1,2:end)+kx2map(2:end,1:end-1)+kx2map(2:end,2:end))/4;
% kcy2map=(ky2map(1:end-1,1:end-1)+ky2map(1:end-1,2:end)+ky2map(2:end,1:end-1)+ky2map(2:end,2:end))/4;


bcmap=-angle(dot(umap(1:end-1,1:end-1,:),umap(1:end-1,2:end,:),3)...
    .*dot(umap(1:end-1,2:end,:),umap(2:end,2:end,:),3)...
    .*dot(umap(2:end,2:end,:),umap(2:end,1:end-1,:),3)...
    .*dot(umap(2:end,1:end-1,:),umap(1:end-1,1:end-1,:),3))/omega;
    
end