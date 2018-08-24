d=parameters.d;
den=100;
eden=200;
enlist=linspace(-0.005,0.00,eden);
klist=linspace(-2*pi*6/(3*d),2*pi*6/(3*d),den);
intensitymap=zeros(den,den,eden);    
   parfor ii=1:den
        for jj=1:den
        ky=klist(jj);  
        kx=klist(ii);
        disp([kx,ky]);      
        intensitymap(ii,jj,:)=lw(kx,ky,enlist,parameters);
        end
    end
% figure;surf(klist,enlist,intensitymap,'edgecolor','none');view(2)
save('cp.mat','intensitymap');