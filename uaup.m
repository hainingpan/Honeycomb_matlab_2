function re=uaup(n,kx,ky,x,y,parameters)
% global d
d=parameters.d;
re=0.5*(uup(n,kx,ky,x,y,parameters)+uup(n,kx,ky,x+sqrt(3)/2*d,y+d/2,parameters)-uup(n,kx,ky,x+sqrt(3)*d,y+d,parameters));
end