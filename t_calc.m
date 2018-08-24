tdata=zeros(10,3);
filename='tdata.xlsx';
d=parameters.d;
for index=1:10
    fprintf('%d',index);
    if (index==2||index==4)
        tdata(index,1)=t(index,0,d,0,2*d,parameters);
        tdata(index,2)=t(index,0,d,sqrt(3)/2*d,d/2,parameters);
        tdata(index,3)=t(index,0,d,-sqrt(3)/2*d,d/2,parameters);
    else
        tdata(index,1)=t(index,0,2*d,0,d,parameters);
        tdata(index,2)=t(index,sqrt(3)/2*d,d/2,0,d,parameters);
        tdata(index,3)=t(index,-sqrt(3)/2*d,d/2,0,d,parameters);
    end
    xlswrite(filename,t);
end