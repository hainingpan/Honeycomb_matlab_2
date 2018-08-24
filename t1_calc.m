t1data=zeros(10,3);
filename='t1data_BK30HC13d3.csv';
d=parameters.d;
for index=1:10
    fprintf('%d',index);
    if (index==2||index==4)
    t1data(index,1)=t1(index,sqrt(3)*d,d,2*sqrt(3)*d,d,parameters);
    t1data(index,2)=t1(index,sqrt(3)*d,d,sqrt(3)*d+sqrt(3)*d/2,2*d+d/2,parameters);
    t1data(index,3)=t1(index,sqrt(3)*d,d,0+sqrt(3)*d/2,2*d+d/2,parameters);
    t1data(index,4)=t1(index,sqrt(3)*d,d,-sqrt(3)*d/2+sqrt(3)*d/2,d/2+d/2,parameters);
    t1data(index,5)=t1(index,sqrt(3)*d,d,0+sqrt(3)*d/2,-d+d/2,parameters);
    t1data(index,6)=t1(index,sqrt(3)*d,d,sqrt(3)*d+sqrt(3)*d/2,-d+d/2,parameters);
    else
    t1data(index,1)=t1(index,sqrt(3)*d/2,d/2,3*sqrt(3)*d/2,d/2,parameters);
    t1data(index,2)=t1(index,sqrt(3)*d/2,d/2,sqrt(3)*d,2*d,parameters);
    t1data(index,3)=t1(index,sqrt(3)*d/2,d/2,0,2*d,parameters);
    t1data(index,4)=t1(index,sqrt(3)*d/2,d/2,-sqrt(3)*d/2,d/2,parameters);
    t1data(index,5)=t1(index,sqrt(3)*d/2,d/2,0,-d,parameters);
    t1data(index,6)=t1(index,sqrt(3)*d/2,d/2,sqrt(3)*d,-d,parameters);
    end
    xlswrite(filename,t1data);
end

