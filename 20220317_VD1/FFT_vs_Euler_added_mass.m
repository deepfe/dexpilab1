clear all
close all 
clc

load('VDeXpiLab1_2022413_143.mat')

I=(Data.Section(1)*Data.Section(2)^3)/12;   %moment of inertia section
k=(Data.Section(1)*(Data.Section(2)^3)*Data.ElasticMod)/(4*Data.L^3);  %flexural stiffness
mu=Data.Density*Data.Section(1)*Data.Section(2);
beam_mass=Data.Section(1)*Data.Section(2)*Data.L*Data.Density;    %mass of the beam in kg
added_mass=0.2;     %added mass on the tip in kg
beta=[1.296, 4.050, 7.147]./Data.L;     %constant for 3 modes CORRECTED FOR THE MASS ON THE TIP
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
title('FFT added mass')
xlabel('frequency(Hz)')
ylabel('amplitude')
legend('experimental data','theoretical frequencies')
hold on

w_err=abs(100*(w-(2*pi*[12.6, 124.4, 367]))./(2*pi*[12.6, 124.4, 367]));   %error percentage