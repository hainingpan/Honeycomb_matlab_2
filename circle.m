function circle(x,y,r)
ang=0:0.01:2*pi; 
xp=r*cos(ang);
yp=r*sin(ang);
hold on;
plot(x+xp,y+yp,'black');
end