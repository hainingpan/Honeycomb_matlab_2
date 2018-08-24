g=zeros(level,1);
f=zeros(level,1);
minindex=zeros(2,1,level-1);
for j=1:level-1
%       f(j)=figure;
%     surf(kxrange,kyrange,map(:,:,j)*1000,'EdgeColor','None');view(2);axis tight;
%     title(num2str(j));
%       
% 
%     surf(kxrange,kyrange,(map(:,:,j+1)-map(:,:,j))*1000,'EdgeColor','None');view(2);axis tight;
%     
    g(j)=min(min(map(:,:,j+1)-map(:,:,j)));
%        g2(j)=min(min(map(:,:,j+1)))-max(max(map(:,:,j)));
%     index=find(map(:,:,j+1)-map(:,:,j)==g(j));
%     xi=fix(index/parameters.NN)+1;
%     yi=mod(index,parameters.NN)+1;
%     minindex(:,:,j)=[kxrange(xi),kyrange(yi)];
%     title(strcat('E',num2str(j+1),'-','E',num2str(j),',min=',num2str(1000*min(min(map(:,:,j+1)-map(:,:,j)))),'meV (k_x,k_y)=(',num2str(minindex(1,1,j)),',',num2str(minindex(2,1,j)),')'));
%     hold on;
%     plot3(minindex(1,1,j),minindex(2,1,j),10,'*r')
    
%    
%     xlabel('k_x');
%     ylabel('k_y');
%     colorbar;
%     h = colorbar;
%     xlabel(h, 'meV')
% %     
%     savefig(f(j),strcat('.\energy\gapzero\',num2str(j),'.fig'));  
%     close all;
end