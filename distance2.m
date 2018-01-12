function distance = distance2(T1,T2)

distance=0;
for i=1:4
  
distance=((T1(i)-T2(i))*(T1(i)-T2(i)))+distance;
end
distance=sqrt(distance);
end
