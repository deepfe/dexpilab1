clear all
close all 
clc

load('VDeXpiLab1_2022413_238.mat')  %40cm 100g 2cm aluminium
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

load('VDeXpiLab1_2022413_2310.mat')  %40cm 100g 2cm steel
X=fft(Out.Acc(1,:));
n=length(Out.Time);
f=linspace(0,fs/2,round(n/2));


X=abs(2*(X(1:round(n/2)))/n);
X(1)=X(1)/2;

plot(f,X)
title('FFT: material comparison')
xlabel('frequency(Hz)')
ylabel('amplitude')
legend('aluminium beam','steel beam')
hold on

