function re=population(index,kx,ky,parameters)
global d NN 
d=parameters.d;
NN=parameters.NN;
x=linspace(0,sqrt(3)*d,NN);
y=linspace(0,3/2*d,NN);
[X,Y]=meshgrid(x,y);
U=um(index,kx,ky,X,Y,parameters);
re=trapz(y,trapz(x,U,2))/(sqrt(3)*d*3/2*d);
re=abs(re)^2;
end