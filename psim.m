function re=psim(n,kx,ky,x,y,parameters)
re=exp(1i*(kx*x+ky*y)).*um(n,kx,ky,x,y,parameters);
end