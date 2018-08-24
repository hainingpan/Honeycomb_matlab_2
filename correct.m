function re=correct(n,parameters)
d=parameters.d;
Nk=parameters.Nk;
% NN=100;
xr=(4*pi/(3*sqrt(3)*d));
xcr=(2*pi/(3*sqrt(3)*d));
yc=(2*pi)/(3*d);
k=yc/(xcr-xr);
b=(xr*yc)/(-xcr + xr);

kc=0;
ktemp=zeros(Nk,1);
ki=1;
%Special
if(n==7)
    kxset=linspace(-xr*0.9,0,2*Nk);
    for kx=kxset
        ktemp(ki)=abs(real(um(n,kx,0,0,d,parameters)));
        ki=ki+1;
    end
     [~,idx]=min(ktemp);
     kc=kxset(idx);
end
if (n==8)
    kxset=linspace(-xr,0,4*Nk);
    for kx=kxset
        ktemp(ki)=um(n,kx,1*10^-3,0,d,parameters);
        ktemp(ki)=(real(ktemp(ki))<0)*(-ktemp(ki))+(real(ktemp(ki))>0)*(ktemp(ki));
        ki=ki+1;
    end
   id=1;
   while(abs(imag(ktemp(id)))>2*10^-4)
       id=id+1;
   end
   kc=abs(kxset(id));
end
if (n==9)
    kxset=linspace(-xr,0,20*Nk);
    for kx=kxset
        ktemp(ki)=um(n,kx,1.*10^-4,0,d,parameters);
        ktemp(ki)=(real(ktemp(ki))<0)*(-ktemp(ki))+(real(ktemp(ki))>0)*(ktemp(ki));
        ki=ki+1;
    end
   id=1;
   while(abs(imag(ktemp(id)))>2*10^-6)
       id=id+1;
   end
   kc=abs(kxset(id))*0.985;
end
kxrange=linspace(-xr,xr,Nk);
ss=zeros(Nk,Nk);
parfor kxindex=1:Nk 
    kyrange=linspace(-yc,yc,Nk);
    for kyindex=1:Nk
        kx=kxrange(kxindex);
        ky=kyrange(kyindex);
            ttemp=um(n,kx,ky,0,2*d,parameters).*(~((abs(kx)<=xr)&(abs(kx)>=xcr)&(abs(ky)>=k*abs(kx)+b))); 
%              ttemp=ua(n,kx,ky,sqrt(3)/2*parameters.d,parameters.d/2,parameters).*(~((abs(kx)<=xr)&(abs(kx)>=xcr)&(abs(ky)>=k*abs(kx)+b))); 
            
            switch n
                case 1
                    ss(kyindex,kxindex)=((real(ttemp)<0).*(-1)+(real(ttemp)>=0));
                case 2      
                     ss(kyindex,kxindex)=((imag(ttemp)<0).*(-1)+(imag(ttemp)>=0));
%                      ss(kyindex,kxindex)=((real(ttemp)<0).*(-1)+(real(ttemp)>=0));
%                      if (pi/3<(angle(kx+ky*1i))&&(angle(kx+ky*1i))<2*pi/3)||(-pi/3<(angle(kx+ky*1i))&&(angle(kx+ky*1i))<0) || (-pi<(angle(kx+ky*1i))&&(angle(kx+ky*1i))<-2*pi/3)
%                         ss(kyindex,kxindex)=((real(ttemp)<0).*(-1)+(real(ttemp)>=0));
%                      else
%                           ss(kyindex,kxindex)=((real(ttemp)>0).*(-1)+(real(ttemp)<=0));
%                      end
                case 3
                   if (pi/6<abs(angle(kx+ky*1i))&&abs(angle(kx+ky*1i))<pi/2 || 5*pi/6<abs(angle(kx+ky*1i)))
                        ss(kyindex,kxindex)=((real(ttemp)<0).*(-1)+(real(ttemp)>=0))*(-1i);
                    else
                        ss(kyindex,kxindex)=((real(ttemp)>0).*(-1)+(real(ttemp)<=0))*(-1i);
                   end 
                case 4
                     ss(kyindex,kxindex)=((imag(ttemp)<0).*(-1)+(imag(ttemp)>=0))*(-1i);                     
                case 5
                    ss(kyindex,kxindex)=((real(ttemp)<0).*(-1)+(real(ttemp)>=0));
                case 6
                    if (0<angle(kx+ky*1i)&&angle(kx+ky*1i)<pi/6 || pi/3<angle(kx+ky*1i)&&angle(kx+ky*1i)<pi/2 || 2*pi/3<angle(kx+ky*1i)&&angle(kx+ky*1i)<5*pi/6 || -pi/3<angle(kx+ky*1i)&&angle(kx+ky*1i)<-pi/6 || -2*pi/3<angle(kx+ky*1i) && angle(kx+ky*1i)<-pi/2 || -pi<angle(kx+ky*1i)&& angle(kx+ky*1i)<-5*pi/6)
                         ss(kyindex,kxindex)=((real(ttemp)<0).*(-1)+(real(ttemp)>=0));
                    else
                         ss(kyindex,kxindex)=((real(ttemp)>0).*(-1)+(real(ttemp)<=0));
                    end
                case 7
                     if (kx^2+ky^2>=kc^2)
                         ss(kyindex,kxindex)=((real(ttemp)<0).*(-1)+(real(ttemp)>=0));
                     else
                          ss(kyindex,kxindex)=((real(ttemp)>0).*(-1)+(real(ttemp)<=0));
                     end               
                     if (abs(real(ttemp))<10^-4)
                          if (0<angle(kx+ky*1i)&&angle(kx+ky*1i)<pi/3 || 2*pi/3<angle(kx+ky*1i) &&angle(kx+ky*1i)<pi || -2*pi/3<angle(kx+ky*1i) && angle(kx+ky*1i)<-pi/3)
                         ss(kyindex,kxindex)=((imag(ttemp)>0).*(-1)+(imag(ttemp)<=0));
                          else
                         ss(kyindex,kxindex)=((imag(ttemp)<0).*(-1)+(imag(ttemp)>=0));
                          end
                     end               
                case 8
                    ss(kyindex,kxindex)=((real(ttemp)<0).*(-1)+(real(ttemp)>=0)); 
                    if ~(abs(kx)<kc/2&&abs(ky)<kc*sqrt(3)/2 || abs(kx)>kc/2&&abs(kx)<kc&&abs(ky)<(abs(kx)-kc)*(-sqrt(3)))
                          if (pi/6<abs(angle(kx+ky*1i))&&abs(angle(kx+ky*1i))<pi/2 || 5*pi/6<abs(angle(kx+ky*1i)))
                          ss(kyindex,kxindex)=((imag(ttemp)>0).*(-1)+(imag(ttemp)<=0));
                          else
                          ss(kyindex,kxindex)=((imag(ttemp)<0).*(-1)+(imag(ttemp)>=0));
                          end
                    end
                case 9
                    ss(kyindex,kxindex)=((real(ttemp)<0).*(-1)+(real(ttemp)>=0)); 
                   if (abs(kx)<kc/2&&abs(ky)<kc*sqrt(3)/2 || abs(kx)>kc/2&&abs(kx)<kc&&abs(ky)<(abs(kx)-kc)*(-sqrt(3)))
                     if (pi/6<abs(angle(kx+ky*1i))&&abs(angle(kx+ky*1i))<pi/2 || 5*pi/6<abs(angle(kx+ky*1i)))
                      ss(kyindex,kxindex)=((imag(ttemp)>0).*(-1)+(imag(ttemp)<=0));
                      else
                      ss(kyindex,kxindex)=((imag(ttemp)<0).*(-1)+(imag(ttemp)>=0));
                     end
                   end
                case 10
                   ss(kyindex,kxindex)=((real(ttemp)<0).*(-1)+(real(ttemp)>=0));       
                case 11
                    if (pi/6<abs(angle(kx+ky*1i))&&abs(angle(kx+ky*1i))<pi/2 || 5*pi/6<abs(angle(kx+ky*1i)))
                      ss(kyindex,kxindex)=((imag(ttemp)>0).*(-1)+(imag(ttemp)<=0));
                      else
                      ss(kyindex,kxindex)=((imag(ttemp)<0).*(-1)+(imag(ttemp)>=0));
                     end
                otherwise
                    ss(kyindex,kxindex)=((real(ttemp)<0).*(-1)+(real(ttemp)>=0)); 
            end    
    end
end
re=ss;
end