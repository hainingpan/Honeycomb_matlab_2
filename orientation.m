for i=1:1
    NN=50;
t(i,1)=sumkt(1,sqrt(3)*d/2,d/2,sqrt(3)*d,d)
t(i,2)=sumkt(1,sqrt(3)*d/2,d/2,0,d)
t(i,3)=sumkt(1,sqrt(3)*d/2,d/2,sqrt(3)*d/2,-d/2)

t1(i,1)=sumkt1(1,sqrt(3)*d/2,d/2,3*sqrt(3)*d/2,d/2)
t1(i,2)=sumkt1(1,sqrt(3)*d/2,d/2,sqrt(3)*d,2*d)
t1(i,3)=sumkt1(1,sqrt(3)*d/2,d/2,0,2*d)
t1(i,4)=sumkt1(1,sqrt(3)*d/2,d/2,-sqrt(3)*d/2,d/2)
t1(i,5)=sumkt1(1,sqrt(3)*d/2,d/2,0,-d)
t1(i,6)=sumkt1(1,sqrt(3)*d/2,d/2,sqrt(3)*d,-d)
end