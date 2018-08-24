function re=bz(kx,ky,parameters)

xr=(4*pi/(3*sqrt(3)*parameters.d));
xcr=(2*pi/(3*sqrt(3)*parameters.d));
yc=(2*pi)/(3*parameters.d);
k=yc/(xcr-xr);
b=(xr*yc)/(-xcr + xr);
re=(~((abs(kx)<=xr)&(abs(kx)>=xcr)&(abs(ky)>k*abs(kx)+b)));
end
