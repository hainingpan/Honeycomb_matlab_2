level=10;
NN=parameters.NN;
lds=zeros(NN,NN,level);
enmap=zeros(NN,NN,level);
for i=1:level
    rs=populationplot(i,parameters);
    lds(:,:,i)=cell2mat(rs(1));
    enmap(:,:,i)=cell2mat(rs(2));
end
ub=max(enmap(:));
lb=min(enmap(:));
itv=1000;
endiv=linspace(lb,ub,itv);
LDOS=zeros(itv,1);
for ii=1:itv-1
    LDOS(ii)=mean(lds(endiv(ii)<enmap & enmap<endiv(ii+1)));
end
LDOS(isnan(LDOS))=0;
plot(1000*endiv',LDOS)


    