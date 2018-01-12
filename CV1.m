%there are 2000 kinds of theta
theta=0:pi/1000:2*pi;
R=10;
x=0.8*R*cos(theta);
y=R*sin(theta);
numberofpoint=length(x);
plot(x,y)
axis([-1*R,R,-1*R,R])
pause(1)
hold on

for i=1:numberofpoint
    x1=x(i+1:numberofpoint);
    y1=y(i+1:numberofpoint);
    d=abs(x1-x(i)) + abs(y1-y(i));
    t=(d>2);
    dt=find(t==1);
    x=[x(1:i),x(i+min(dt):numberofpoint)];
    y=[y(1:i),y(i+min(dt):numberofpoint)];
    numberofpoint=length(x);
    if (i>numberofpoint-1)
        break;
    end
end
x=[x,x(1)];
y=[y,y(1)];
%start the iteration
for i=1:12
numberofpoint=length(x);
x1=[x(2:numberofpoint),x(2)];
y1=[y(2:numberofpoint),y(2)];
x2=[x(numberofpoint-1),x(1:numberofpoint-2),x(numberofpoint-1)];
y2=[y(numberofpoint-1),y(1:numberofpoint-2),y(numberofpoint-1)];
%compute dx and dy
for j=1:numberofpoint
dt1(j)=sqrt((x1(j)-x(j))^2+(y1(j)-y(j))^2);
dt2(j)=sqrt((x2(j)-x(j))^2+(y2(j)-y(j))^2);
dx(j)=1/2*(x1(j)-x(j))/dt1(j)+1/2*(x(j)-x2(j))/dt2(j);
dy(j)=1/2*(y1(j)-y(j))/dt1(j)+1/2*(y(j)-y2(j))/dt2(j);
end
dx1=[dx(2:numberofpoint),dx(2)];
dy1=[dy(2:numberofpoint),dy(2)];
dx2=[dx(numberofpoint-1),dx(1:numberofpoint-2),dx(numberofpoint-1)];
dy2=[dy(numberofpoint-1),dy(1:numberofpoint-2),dy(numberofpoint-1)];
%compute ddx and ddy
for j=1:numberofpoint
ddx(j)=1/2*(dx1(j)-dx(j))/dt1(j)+1/2*(dx(j)-dx2(j))/dt2(j);
ddy(j)=1/2*(dy1(j)-dy(j))/dt1(j)+1/2*(dy(j)-dy2(j))/dt2(j);
n1(j)=dx(j)/sqrt(dx(j)^2+dy(j)^2);
n2(j)=dy(j)/sqrt(dx(j)^2+dy(j)^2);
k1(j)=1/2*sqrt((dx1(j)-dx(j))^2+(dy1(j)-dy(j))^2)/dt1(j)+1/2*sqrt((dx2(j)-dx(j))^2+(dy2(j)-dy(j))^2)/dt2(j);
k(j)=abs(dx(j)*ddy(j)-dy(j)*ddx(j))/(dx(j)^2+dy(j)^2)^1.5;
end
t=2;
x=x-t*k.*n2;
y=y+t*k.*n1;
plot(x,y)
pause(0.5)
end


        