I=imread('texture.jpg');
I=rgb2gray(I);
[Ix, Iy]=imgradientxy(I);
T=zeros(2,2,256,231);
for i=1:256
    for j=1:231
T(:,:,i,j)=imgaussfilt([   Ix(i,j);Iy(i,j)]*[Ix(i,j) Iy(i,j)]);
    end
end
label1=zeros(2,2);
label1=T(:,:,1,1);
label2=zeros(2,2);
label2=T(:,:,256,1);

for step=1:1
set1=zeros(2,2,1);
set2=zeros(2,2,1);
show1=zeros(2,1);
show2=zeros(2,1);
num1=1;
num2=1;
for i=1:256
    for j =1:231
      
        if( distance2(T(:,:,i,j),label1)<distance2(T(:,:,i,j),label2))
            set1(:,:,num1)=T(:,:,i,j);num1=num1+1;
            show1(:,num1)=[i;j];

          elseif ( distance2(T(:,:,i,j),label1)>distance2(T(:,:,i,j),label2))
            set2(:,:,num2)=T(:,:,i,j);num2=num2+1;
            show2(:,num2)=[i;j];
        end
    end
end 

mean1=CV3mean(set1);
mean2=CV3mean(set2);

mini1=0;mini2=0;
for i=1:256
    for j=1:231
      if(mini1>distance2(  mean1,T(:,:,i,j)))
          label1=T(:,:,i,j);
          display(label1);
      end
     if(mini2>distance2(  mean2,T(:,:,i,j)))
         label2=T(:,:,i,j);
         display(label2);
     end
    mini1=distance2(mean1,T(:,:,i,j));
    mini2=distance2(mean2,T(:,:,i,j));
    
    end
end

figure,
scatter(show1(1,1:num1),show1(2,1:num1),2,'r');
hold on
scatter(show2(1,1:num2),show2(2,1:num2),2,'b');
end