I=imread('texture.jpg');
I=rgb2gray(I);
[Ix, Iy]=imgradientxy(I);
Ix=imgaussfilt(Ix,2);
Iy=imgaussfilt(Iy,2);
Ix=imgaussfilt(Ix,2);
Iy=imgaussfilt(Iy,2);
Ix=imgaussfilt(Ix,2);
Iy=imgaussfilt(Iy,2);
Ix=imgaussfilt(Ix,2);
Iy=imgaussfilt(Iy,2);
Ix=imgaussfilt(Ix,2);
Iy=imgaussfilt(Iy,2);
Ix=imgaussfilt(Ix,2);
Iy=imgaussfilt(Iy,2);
Ix=imgaussfilt(Ix,2);
Iy=imgaussfilt(Iy,2);
Ix=imgaussfilt(Ix,2);
Iy=imgaussfilt(Iy,2);
Iy=imgaussfilt(Iy,2);

T=zeros(2,2,256,231);
for i=1:256
    for j=1:231
T(:,:,i,j)=[   Ix(i,j);Iy(i,j)]*[Ix(i,j) Iy(i,j)];
    end
end
thi=ones(256,231);
%inside 
for p=1:100
    thi(10+p:200-p,10+p)=-p*ones(191-p*2,1);
    thi(200-p,10+p:200-p)=-p*ones(1,191-p*2);
    thi(10+p,10+p:200-p)=-p*ones(1,191-p*2);
    thi(10+p:200-p,200-p)=-p*ones(191-p*2,1);
end
%outside
for i=1:9
    for j=1:9
thi(i,j)=sqrt((i-10)*(i-10)+(j-10)*(j-10));
    end
end
for i=201:256
    for j=201:231
thi(i,j)=sqrt((i-200)*(i-200)+(j-200)*(j-200));
    end
end
for i=201:256
    for j=1:9
thi(i,j)=sqrt((i-200)*(i-200)+(j-10)*(j-10));
    end
end
for i=1:9
    for j=201:231
thi(i,j)=sqrt((i-10)*(i-10)+(j-200)*(j-200));
    end
end
for k=1:9
thi(k,10:200)=(10-k)*ones(1,191);
thi(10:200,k)=(10-k)*ones(191,1);
end
for k=201:256
    thi(k,10:200)=(k-200)*ones(1,191);
end
for k=201:231
    thi(10:200,k)=(k-200)*ones(191,1);
end

thi(10:200,10)=zeros(191,1);
thi(200,10:200)=zeros(1,191);
thi(10,10:200)=zeros(1,191);
thi(10:200,200)=zeros(191,1);
 con=zeros(256,231);


%compute thi_XX thi__YY thi_Y thi_X
% there is 20steps
for step=1:5
k=kappa(thi);
alpha=3;
delta_t=3;
[in_row,in_col]=find(thi>=0);
[out_row,out_col]=find(thi<0);
T1=mean(I,in_row,in_col);
T2=mean(I,out_row,out_col);

for i=1:256
    for j=1:231
thi(i,j)=(alpha*k(i,j)-distance(T(:,:,i,j),T1)+distance(T(:,:,i,j),T2))*delta_t+thi(i,j);
    end
end
MAX=max(max(thi));
%imshow((thi/MAX(1))*255);
% %imshow(thi);
% 
% %image((thi/MAX(1))*255);
for i=1:256
    for j=1:231
        if (thi(i,j)<0)
            con(i,j)=200;
           
        end
    end
end
%con=interp2(con,5);
figure,imshow(I);hold on
imshow(con);
% 
 pause(0.5);
 end