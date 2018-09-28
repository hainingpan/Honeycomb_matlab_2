function re=ubup(n,kx,ky,x,y,parameters)
% global d
d=parameters.d;
re=uaup(n,kx,ky,x-sqrt(3)*d/2,y-d/2,parameters);
end