function re=coa(m,n,parameters)
% global d a h b1 b2
re=zeros(length(m),length(n));
l1=((n==0)&(m==0));
l2=~l1;
re(l1)=-(4*parameters.a.^2*parameters.h*pi/(3*sqrt(3)*(parameters.d)^2));
re(l2)=-parameters.h/(3*sqrt(3)/2*(parameters.d)^2)*2*pi*(parameters.a)./sqrt(4/3*pi^2*(m(l2)/parameters.d).^2+(-2*m(l2)*pi/(3*parameters.d)+(4*n(l2)*pi)/(3*parameters.d)).^2).*besselj(1,sqrt(4/3*pi^2*(m(l2)/parameters.d).^2+(-2*m(l2)*pi/(3*parameters.d)+(4*n(l2)*pi)/(3*parameters.d)).^2)*parameters.a).*(exp(-1i*((m(l2)+n(l2)).*2*pi/3))+exp(-1i*((2*m(l2)-n(l2)).*2*pi/3)));
end