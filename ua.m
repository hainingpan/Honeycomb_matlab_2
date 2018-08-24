function re=ua(n,kx,ky,x,y,parameters)
% global d
d=parameters.d;
re=0.5*(um(n,kx,ky,x,y,parameters)+um(n,kx,ky,x+sqrt(3)/2*d,y+d/2,parameters)-um(n,kx,ky,x+sqrt(3)*d,y+d,parameters));
end