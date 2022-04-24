clc ;
clf;
clear all;

while(1)
mprintf("Enter 1 for the First order time response.\n Enter 2 for Second order time response.\n Entere 0 to exit.\n")
v=input("Enter your choice=")
clf
c=zeros(1,1000)
select v
case 0 then
disp("Exiting.")
break;
case 1 then
mprintf("Enter 1 for unit step input.\n Enter 2 for unit Ramp input.\nEnter 3 for unit impulse input.\n")
z=input("Enter your choice=")
t=0:0.01:20
T=input("Enter the value of T=")
if z==2 then
c=t-T+T*exp(-t/T)
plot(t,t)
xtitle("Plot b/w c(t) v/s t for Unit Ramp Function for T="+string(T),"t--->","c(t)--->")
else if z==1 then
c=1-exp(-t/T)
p=ones(1,length(t))
plot(t,p)
xtitle("Plot b/w c(t) v/s t for Unit Step Function for T="+string(T),"t--->","c(t)--->")
else if z==3 then
c=(1/T)*exp(-t/T)
plot2d3(0,1)
xtitle("Plot b/w c(t) v/s t for Unit Impulse Function for T="+string(T),"t--->","c(t)--->")
else
disp("Wrong Choice.")
end
end
end
plot(t,c,'r')
h=legend(["Input";"Ouput"])
case 2 then
mprintf("Enter 1 for unit step input.\n Enter 2 for unit Ramp input.\n Enter 3 for unit impulse input.\n")
z=input("Enter your choice=")
t=0:0.001:1
n=input("Enter the value of damping factor=")
w=input("Enter the value of Natural frequency=")
l=sqrt(1-(n*n))
phi=atan(l/n)
if z==2 then
plot(t,t)
xtitle("Plot b/w c(t) v/s t for Unit Ramp Function for n="+string(n)+" & w="+string(w)+"Hz","t--->","c(t)--->")
for i=1:1:length(t)
c(i)=t(i)-(2*n/w)+(((exp(-w*n*t(i)))*sin(w*l*t(i) + 2*phi))/(w*l))
end
else if z==1 then
for i=1:1:length(t)
if n == 1 then
c(i)=1-((exp(-w*t(i)))*(1+w*t(i)))
else
c(i)=1-((exp(-n*w*t(i))*sin(w*l*t(i) + phi))/l)
end
end
p=ones(1,length(t))
plot(t,p)
xtitle("Plot b/w c(t) v/s t for Unit Step Function for n="+string(n)+" & w="+string(w)+"Hz","t--->","c(t)--->")
else if z==3 then
for i=1:1:length(t)
if n==1 then
c(i)=t(i)*w*w*(exp(-w*t(i)))
else if n>1 then
c(i)=(w/(2*sqrt(n*n-1)))*((exp(-(-n-sqrt(n*n-1))*w*t(i)))-(exp(-(-n+sqrt(n*n-1))*w*t(i))))
else
c(i)=(w*(exp(-w*n*t(i)))*sin(w*t(i)))/l
end
end
end
plot2d3(0,1)
xtitle("Plot b/w c(t) v/s t for Unit Impulse Function for n="+string(n)+" & w="+string(w)+"Hz","t--->","c(t)--->")
else
disp("Wrong Choice.")
end
end
end
plot(t',c,'r')
h=legend(["Input","Ouput"])
else
disp("Wrong choice.")
end
end
