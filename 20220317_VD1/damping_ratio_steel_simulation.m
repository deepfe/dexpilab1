%%Estimation of the damping ratio using logarithmic decrement method
%%SIMULATION
clc
close all
clear all

load('VDeXpiLab1_202249_1545.mat')

[peaks,position]=findpeaks(Out.Acc(1,:),'MinPeakDistance',2048*0.04,'MinPeakHeight',0);

k=find(position>2048*0.1&position<2048*1.3);  %sample from 0.1 second to 1

a=peaks(k);

t=[1:numel(a)];
ln_a=log(a);    %natual logarithm of experimental dataset
b=polyfit(t,ln_a,1);   %least squares regession
x=linspace(1,numel(a));
y=polyval(b,x);

figure 
set(gca,'yscale','log')
scatter(t,ln_a);
ylabel('ln(x)');
xlabel('j');
hold on
plot(x,y);
legend('Experimental data','Least squares regression');
title('SIMULATION STEEL BEAM');
hold on

delta=-b(1);
zeta=delta/sqrt(((2*pi)^2+delta^2))    %damping ratio

t_n=position(k)./2048;  %time of each peak
T=(t_n(end)-t_n(1))./(numel(t_n)-1);    %damped period
omega_d=2*pi/T; %damped frequency
omega_n=omega_d/sqrt(1-zeta^2) %natural frequency