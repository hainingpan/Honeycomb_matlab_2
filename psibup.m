function re=psibup(n,kx,ky,x,y,parameters)
re=exp(1i*(kx*x+ky*y)).*ubup(n,kx,ky,x,y,parameters);
end