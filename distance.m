function distance = distance(T1,T2)
A=zeros(2,2);
B=zeros(2,2);
T1=T1+0.1*[1 0;0 1];
T2=T2+0.1*[1 0;0 1];
A=inv(T1).*T2;
B=inv(T2).*T1;
distance=0.5*(A(1)+A(4)+B(1)+B(4))-2;
end
