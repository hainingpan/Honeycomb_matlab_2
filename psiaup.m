function re=psiaup(n,kx,ky,x,y,parameters)
re=exp(1i*(kx*x+ky*y)).*uaup(n,kx,ky,x,y,parameters);
end
