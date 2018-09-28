function re=psiup(n,kx,ky,x,y,parameters)
re=exp(1i*(kx*x+ky*y)).*uup(n,kx,ky,x,y,parameters);
end