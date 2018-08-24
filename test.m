index=1;
d=parameters.d;
for i=1:5
tic
set=[50];
% set=[50,100,200,300,400];
    fprintf('%d',i);
    parameters.NN=set(i);
	rs(i)=tV(index,0,2*d,0,d,parameters)
rt(i)=toc
end



