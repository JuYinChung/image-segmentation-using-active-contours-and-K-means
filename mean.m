function mean=mean(I,row1,col1)
[Ix, Iy]=imgradientxy(I);
A=0;
B=0;
%build structure tensor using gaussian
end1=size(row1);


for i=1:end1(1)
    u=zeros(2,2);
 u=imgaussfilt([   Ix(row1(i),col1(i));Iy(row1(i),col1(i))]*[Ix(row1(i),col1(i)) Iy(row1(i),col1(i))])+0.1*[1 0;0 1];
A=A+u;
 B=B+inv(u);
end


mean=sqrtm(inv(B))*sqrtm(sqrtm(B)*A*sqrtm(B))*sqrtm(inv(B));

end