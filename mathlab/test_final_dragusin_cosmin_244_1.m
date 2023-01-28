%% subiectul 1)
%1)raspuns b) suma de 2 sinusoide
%2)fac parte 2 frecvente,frecventele find de F1=200Hz si F2=500Hz;

%% subiectul 2)
%Cele 2 frecvente sunt F1=100Hz, si F2=400Hz

%% subiectul 3)
% partea 1
F0=50;
Fs=10000;
durata=2;
A=1;
faza0=0;
t=0:1/Fs:durata;
U0=0;
semnal_suma=0;
for k=1:2:10000
Fk=k*F0;  
Sk=(4*A)/(k*pi);
semnal=U0+(Sk*sin(2*pi*Fk*t+faza0));  
semnal_suma=semnal_suma+semnal;
end

figure(1)
sprectru_semnal_suma=fftshift(abs(fft(semnal_suma)));
axaFFt=linspace(-Fs/2,Fs/2,length(semnal_suma));
%plot(t,semnal_suma)
plot(axaFFt,sprectru_semnal_suma)
xlabel("Frecventa[Hz]")
title("Sprectru semnal dreptunghiular")

% partea 2
N=1001;
n=(-(N-1)/2):((N-1)/2);
Ft=260;%am ales 260 deoarece frecventele fizibile pe sprectru sunt 50,150,250
filtruTreceJos=(2*Ft/Fs)*sinc(2*n*Ft/Fs);

figure(2)
plot(n,filtruTreceJos)
title("Caracteristica reala a filtrului")
xlabel("coeficienti")
ylabel("amplitudinea filtrului")

%partea 3
y=conv(semnal_suma,filtruTreceJos,"same");
figure(3)
sprectru_semnal_filtrat=fftshift(abs(fft(y)));
axaFFt_filtrat=linspace(-Fs/2,Fs/2,length(y));
plot(axaFFt_filtrat,sprectru_semnal_filtrat)
xlabel("Frecventa[Hz]")
title("Sprectru semnal filtrat")

%% subiectul 4)

%partea 1)
[x,Fs]=audioread('Semnal0.wav');
durata=(length(x)-1)/Fs;
t=0:1/Fs:durata;
sprectru_audio=fftshift(abs(fft(x)));
axaFFt_audio=linspace(-Fs/2,Fs/2,length(x));
figure(4)
plot(axaFFt_audio,sprectru_audio)
xlabel("Frecventa[Hz]")
title("Sprectru semnal audio")

%partea 2)
r=0.99;
Ft=500;
teta=2*pi*(Ft/Fs);
A=[1,-2*r*cos(teta),r*r];
B=[1,-2*cos(teta),1];
axaFFt_caracteristica=linspace(-Fs/2,Fs/2,length(x));
caracteristica=freqz(B,A,axaFFt_caracteristica,Fs);
figure(5)
plot(t,caracteristica)
title("Caracteristica reala a filtrului Notch")
xlabel("timp[s]")
ylabel("amplitudinea filtrului")

%partea 3)
y=filter(B,A,x);
sprectru_audio_filtrat=fftshift(abs(fft(y)));
axaFFt_audio_filtrat=linspace(-Fs/2,Fs/2,length(y));
figure(6)
plot(axaFFt_audio_filtrat,sprectru_audio_filtrat)
xlabel("Frecventa[Hz]")
title("Sprectru semnal audio filtrat")
