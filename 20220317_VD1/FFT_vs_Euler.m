clear all
close all 
clc

load('VDeXpiLab1_null_mass.mat')

I=(Data.Section(1)*Data.Section(2)^3)/12;   %moment of inertia section
k=(Data.Section(1)*(Data.Section(2)^3)*Data.ElasticMod)/(4*Data.L^3);  %flexural stiffness
mu=Data.Density*Data.Section(1)*Data.Section(2);
beta=[1.875, 4.694, 7.855]./Data.L;     %constant for 3 modes
w=sqrt((beta.^4)*Data.ElasticMod*I./mu);


fs=2048;    %sampling frequency
X=fft(Out.Acc(1,:));
n=length(Out.Time);
f=linspace(0,fs/2,round(n/2));


X=abs(2*(X(1:round(n/2)))/n);
X(1)=X(1)/2;

figure
plot(f,X)
hold on
for i=1:length(w)
xline(w(i)/(2*pi),'r');
end
title('FFT no mass')
xlabel('frequency(Hz)')
ylabel('amplitude')
legend('experimental data','theoretical frequencies')
hold on

w_err=abs(100*(w-(2*pi*[27.8, 167, 415.6]))./(2*pi*[27.8, 167, 415.6]));   %error percentage