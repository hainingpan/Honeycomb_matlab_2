function re=psia(n,kx,ky,x,y,parameters)
re=exp(1i*(kx*x+ky*y)).*ua(n,kx,ky,x,y,parameters);
end
