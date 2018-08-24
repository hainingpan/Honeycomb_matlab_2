function re=vm(xx,yy,parameters)
% global d a h
d=parameters.d;
a=parameters.a;
h=parameters.h;
%xx=gpuArray(xx);
%yy=gpuArray(yy);
x=1/2*sqrt(3)*d*((2*yy)/(3*d)-floor((2*yy)/(3*d)))+sqrt(3)*d*(-((-sqrt(3)*xx+yy)/(3*d))-floor(-((-sqrt(3)*xx+yy)/(3*d))));
y=3*d/2*((2*yy)/(3*d)-floor((2*yy)/(3*d)));
re=(((x-sqrt(3)*d/2).^2+(y-d/2).^2<a^2)|((x-sqrt(3)*d).^2+(y-d).^2<a^2))*(-h);
re=gather(re);
end