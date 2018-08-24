function re=ub(n,kx,ky,x,y,parameters)
% global d
d=parameters.d;
re=ua(n,kx,ky,x-sqrt(3)*d/2,y-d/2,parameters);
end