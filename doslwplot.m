store=load('cp.mat');
map=store.intensitymap;
figure;
plot(enlist,squeeze(sum(map,[1,2])))
% surf(klist,enlist,squeeze(map(:,50,:))','edgecolor','none');view(2)