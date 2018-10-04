% store=load('cp.mat');
% map=store.intensitymap;
% figure;
% plot(enlist,squeeze(sum(map,[1,2])))
% % surf(klist,enlist,squeeze(map(:,50,:))','edgecolor','none');view(2)
d=parameters.d;
den=100;
eden=200;
enlist=linspace(-0.02,0.015,eden);
klist=linspace(-2*pi*6/(3*d),2*pi*6/(3*d),den);
intensitymap=zeros(den,eden);    
 parfor ii=1:den
     ky=klist(ii);  
%      kx=klist(ii);
     intensitymap(ii,:)=lw(0,ky,enlist,parameters);
end