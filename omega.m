%variance of localization
function re=omega(wf,rx,ry,parameters)
cellnumber=parameters.cellnumber;
d=parameters.d;
NN=parameters.NN;
pp=[3/4*sqrt(3*cellnumber)*d 3*sqrt(cellnumber)*d/4];
np=[-sqrt(3*cellnumber)*d/4 3*sqrt(cellnumber)*d/4];
nn=[-3/4*sqrt(3*cellnumber)*d -3/4*sqrt(cellnumber)*d];
pn=[sqrt(3*cellnumber)*d/4 -3*d/4*sqrt(cellnumber)];
x=linspace(nn(1),pp(1),NN);
y=linspace(nn(2),pp(2),NN);
[XX,YY]=meshgrid(x,y);
XX=XX-rx;
YY=YY-ry;
r2=sum(sum(wf'.*(XX.^2+YY.^2).*wf))/((pp(1)-nn(1))*(pp(2)-nn(2)));
rx=sum(sum(wf'.*XX.*wf))/((pp(1)-nn(1))*(pp(2)-nn(2)));
ry=sum(sum(wf'.*YY.*wf))/((pp(1)-nn(1))*(pp(2)-nn(2)));
absr2=rx^2+ry^2;
re=r2-absr2;
end

