function re=psib(n,kx,ky,x,y,parameters)
re=exp(1i*(kx*x+ky*y)).*ub(n,kx,ky,x,y,parameters);
end