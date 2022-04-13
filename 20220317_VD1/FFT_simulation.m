clear all
close all 
clc

load('VDeXpiLab1_202249_1545.mat')
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