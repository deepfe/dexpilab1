clear all
close all 
clc

load('VDeXpiLab1_2022413_2321.mat')  %40cm 50g 2cm steel
fs=2048;    %sampling frequency
X=fft(Out.Acc(1,:));
n=length(Out.Time);
f=linspace(0,fs/2,round(n/2));


X=abs(2*(X(1:round(n/2)))/n);
X(1)=X(1)/2;

figure
plot(f,X)
title('FFT: added mass comaprison')
xlabel('frequency(Hz)')
ylabel('amplitude')
hold on

load('VDeXpiLab1_2022413_2325.mat')  %40cm 100g 2cm steel
fs=2048;    %sampling frequency
X=fft(Out.Acc(1,:));
n=length(Out.Time);
f=linspace(0,fs/2,round(n/2));


X=abs(2*(X(1:round(n/2)))/n);
X(1)=X(1)/2;

plot(f,X)
title('FFT: added mass comaprison')
xlabel('frequency(Hz)')
ylabel('amplitude')
hold on

load('VDeXpiLab1_2022413_2320.mat')  %40cm 200g 2cm steel
X=fft(Out.Acc(1,:));
n=length(Out.Time);
f=linspace(0,fs/2,round(n/2));


X=abs(2*(X(1:round(n/2)))/n);
X(1)=X(1)/2;

plot(f,X)
title('FFT: added mass comaprison')
xlabel('frequency(Hz)')
ylabel('amplitude')
legend('50g','100g','200g')
hold on
