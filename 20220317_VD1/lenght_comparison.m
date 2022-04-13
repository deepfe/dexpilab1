clear all
close all 
clc

load('VDeXpiLab1_2022413_233.mat')  %30cm 100g 2cm steel
fs=2048;    %sampling frequency
X=fft(Out.Acc(1,:));
n=length(Out.Time);
f=linspace(0,fs/2,round(n/2));


X=abs(2*(X(1:round(n/2)))/n);
X(1)=X(1)/2;

figure
plot(f,X)
title('FFT')
xlabel('frequency(Hz)')
ylabel('amplitude')
hold on

load('VDeXpiLab1_2022413_235.mat')  %45cm 100g 2cm steel
X=fft(Out.Acc(1,:));
n=length(Out.Time);
f=linspace(0,fs/2,round(n/2));


X=abs(2*(X(1:round(n/2)))/n);
X(1)=X(1)/2;

plot(f,X)
title('FFT')
xlabel('frequency(Hz)')
ylabel('amplitude')
hold on

load('VDeXpiLab1_2022413_237.mat')  %60cm 100g 2cm steel
X=fft(Out.Acc(1,:));
n=length(Out.Time);
f=linspace(0,fs/2,round(n/2));


X=abs(2*(X(1:round(n/2)))/n);
X(1)=X(1)/2;

plot(f,X)
title('FFT: lenght comparison')
xlabel('frequency(Hz)')
ylabel('amplitude')
legend('30cm','45cm','60cm')
hold on