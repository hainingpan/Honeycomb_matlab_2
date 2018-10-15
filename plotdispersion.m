d=parameters.d;
Nmax=parameters.Nmax;
den=100;
klist=linspace(-2*pi*6/(3*d),2*pi*6/(3*d),den);
eivmap=zeros(2*(2*Nmax+1)^2,den);
for kindex=1:den
    k=klist(kindex);
    eiv=energycp(0,k,parameters);
    eivmap(:,kindex)=eiv;
end
figure;
plot(klist,eivmap(1:123,:));