tVdata=zeros(10,3);
filename='tVdata.xlsx';
d=parameters.d;
for index=1:10
    fprintf('%d',index);
    if (index==2||index==4)
        tVdata(index,1)=tV(index,0,d,0,2*d,parameters);
        tVdata(index,2)=tV(index,0,d,sqrt(3)/2*d,d/2,parameters);
        tVdata(index,3)=tV(index,0,d,-sqrt(3)/2*d,d/2,parameters);
    else
        tVdata(index,1)=tV(index,0,2*d,0,d,parameters);
        tVdata(index,2)=tV(index,sqrt(3)/2*d,d/2,0,d,parameters);
        tVdata(index,3)=tV(index,-sqrt(3)/2*d,d/2,0,d,parameters);
    end
    xlswrite(filename,tVdata);
end