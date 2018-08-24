t1Vdata=zeros(10,3);
filename='t1data_BK30HC13d3.csv';
d=parameters.d;
for index=1:10
    fprintf('%d',index);
    if (index==2||index==4)
    t1Vdata(index,1)=t1V(index,sqrt(3)*d,d,2*sqrt(3)*d,d,parameters);
    t1Vdata(index,2)=t1V(index,sqrt(3)*d,d,sqrt(3)*d+sqrt(3)*d/2,2*d+d/2,parameters);
    t1Vdata(index,3)=t1V(index,sqrt(3)*d,d,0+sqrt(3)*d/2,2*d+d/2,parameters);
    t1Vdata(index,4)=t1V(index,sqrt(3)*d,d,-sqrt(3)*d/2+sqrt(3)*d/2,d/2+d/2,parameters);
    t1Vdata(index,5)=t1V(index,sqrt(3)*d,d,0+sqrt(3)*d/2,-d+d/2,parameters);
    t1Vdata(index,6)=t1V(index,sqrt(3)*d,d,sqrt(3)*d+sqrt(3)*d/2,-d+d/2,parameters);
    else
    t1Vdata(index,1)=t1V(index,sqrt(3)*d/2,d/2,3*sqrt(3)*d/2,d/2,parameters);
    t1Vdata(index,2)=t1V(index,sqrt(3)*d/2,d/2,sqrt(3)*d,2*d,parameters);
    t1Vdata(index,3)=t1V(index,sqrt(3)*d/2,d/2,0,2*d,parameters);
    t1Vdata(index,4)=t1V(index,sqrt(3)*d/2,d/2,-sqrt(3)*d/2,d/2,parameters);
    t1Vdata(index,5)=t1V(index,sqrt(3)*d/2,d/2,0,-d,parameters);
    t1Vdata(index,6)=t1V(index,sqrt(3)*d/2,d/2,sqrt(3)*d,-d,parameters);
    end
    xlswrite(filename,t1Vdata);
end

