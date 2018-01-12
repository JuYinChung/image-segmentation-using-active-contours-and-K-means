function mean=CV3mean(set)
length=size(set);
sum=zeros(2,2);
for k=1:length(3)
sum=set(:,:,k)+sum;
end
mean=sum./length(3);