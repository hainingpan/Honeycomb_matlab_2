%variance of localization
function re=omega(wf,parameters)
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
nor2=sum(sum(conj(wf).*wf));
r2=sum(sum(conj(wf).*(XX.^2+YY.^2).*wf))/nor2;
rx=sum(sum(conj(wf).*XX.*wf))/nor2;
ry=sum(sum(conj(wf).*YY.*wf))/nor2;
absr2=rx^2+ry^2;
re=r2-absr2;
end

