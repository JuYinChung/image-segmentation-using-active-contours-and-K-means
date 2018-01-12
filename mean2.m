function mean=mean2(thi,T,row1,col1)
end1=size(row1);
TH=zeros(2,2);
H=0;
for x=1:end1(1);

TH=TH+T(:,:,row1(x),col1(x))*heaviside(thi(row1(x),col1(x)));
H=H+heaviside(thi(row1(x),col1(x)));

end
mean=TH./H;
