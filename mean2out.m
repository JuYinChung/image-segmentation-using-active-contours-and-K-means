function mean=mean2out(thi,T,row2,col2)
end2=size(row2);
TH=zeros(2,2);
H=0;
for x=1:end2(1);

TH=TH+T(:,:,row2(x),col2(x))*heaviside(1-thi(row2(x),col2(x)));
H=H+heaviside(1-thi(row2(x),col2(x)));

end
mean=TH./H;
