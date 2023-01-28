%% aplicatia 1
clc
clear
A=1;
F=200;
faza=0;
durata=2;
Fs=10000;
T=1/F;
t=0:1/Fs:durata;
S=A*sin(2*pi*F*t+faza);

figure(1)
subplot(2,1,1)
plot(t,S)
title('Semnal Sinusoidal')
xlabel('Timp[s]')
ylabel('Amplitudine')
xlim([0,5*T])

subplot(2,1,2)
sprectruSin=fftshift(abs(fft(S)));
axaFFTSin=linspace(-Fs/2,Fs/2,length(S));
plot(axaFFTSin,sprectruSin)
title('Sprectru semnal sinusoida')
xlabel('Frecventa[Hz]')

%%aplicatia 2
A=1;
F1=500;
F2=1000;
durata=1;
faza=0;
Fs=10000;
t=0:1/Fs:durata;
S1=A*sin(2*pi*F1*t+faza);
S2=A*sin(2*pi*F2*t+faza);
S_Suma=S1+S2;

figure(2)
subplot(3,2,1)
plot(t,S1)
title('sinusoida 1')
xlabel('timp[s]')
ylabel('amplitudinea')
xlim([0,0.01]);

subplot(3,2,2)
sprectru1=fftshift(abs(fft(S1)));
axaSprectru1=linspace(-Fs/2,Fs/2,length(S1));
plot(axaSprectru1,sprectru1)
title('Sprectru semnal sinusoida')
xlabel('Frecventa[Hz]')

subplot(3,2,3)
plot(t,S2)
title('sinusoida 2')
xlabel('timp[s]')
ylabel('amplitudinea')
xlim([0,0.01]);

subplot(3,2,4)
sprectru2=fftshift(abs(fft(S2)));
axaSprectru2=linspace(-Fs/2,Fs/2,length(S2));
plot(axaSprectru2,sprectru2)
title('Sprectru semnal sinusoida')
xlabel('Frecventa[Hz]')

subplot(3,2,5)
plot(t,S_Suma)
title('sinusoida suma')
xlabel('timp[s]')
ylabel('amplitudinea')
xlim([0,0.01]);

subplot(3,2,6)
sprectru_suma=fftshift(abs(fft(S_Suma)));
axaSprectru_suma=linspace(-Fs/2,Fs/2,length(S_Suma));
plot(axaSprectru_suma,sprectru_suma)
title('Sprectru semnal sinusoida')
xlabel('Frecventa[Hz]')

%% aplicatia 3
A=1;
faza=0;
F=100;
Fs=10000;
durata=2;
t=0:1/Fs:durata;
semnal=A*square(2*pi*F*t+faza);

figure(3)
subplot(2,1,1)
plot(t,semnal)
title('semnal dreptunghiular')
xlabel('timp')
ylabel('amplitudinea')
xlim([0,0.04])

subplot(2,1,2)
sprectru=fftshift(abs(fft(semnal)));
axaSprectru=linspace(-Fs/2,Fs/2,length(semnal))
plot(axaSprectru,sprectru)
title('Sprectru semnal sinusoida')
xlabel('Frecventa[Hz]')

%%aplicatia 2 lab 7
F1=2;
F2=50;
A=1;
faza=0;
Fs=1000;
durata=1;
t=0:1/Fs:durata;
S1=A*sin(2*pi*F1*t+faza);
S2=A*sin(2*pi*F2*t+faza);
S_Suma=S1+S2;

figure(4)
subplot(3,2,1)
plot(t,S1)
title('sinusoida 1')
xlabel('timp[s]')
ylabel('amplitudinea')

subplot(3,2,2)
sprectru1=fftshift(abs(fft(S1)));
axaSprectru1=linspace(-Fs/2,Fs/2,length(S1));
plot(axaSprectru1,sprectru1)
title('Sprectru semnal sinusoida')
xlabel('Frecventa[Hz]')

subplot(3,2,3)
plot(t,S2)
title('sinusoida 2')
xlabel('timp[s]')
ylabel('amplitudinea')

subplot(3,2,4)
sprectru2=fftshift(abs(fft(S2)));
axaSprectru2=linspace(-Fs/2,Fs/2,length(S2));
plot(axaSprectru2,sprectru2)
title('Sprectru semnal sinusoida')
xlabel('Frecventa[Hz]')

subplot(3,2,5)
plot(t,S_Suma)
title('sinusoida suma')
xlabel('timp[s]')
ylabel('amplitudinea')

subplot(3,2,6)
sprectru_suma=fftshift(abs(fft(S_Suma)));
axaSprectru_suma=linspace(-Fs/2,Fs/2,length(S_Suma));
plot(axaSprectru_suma,sprectru_suma)
title('Sprectru semnal sinusoida')
xlabel('Frecventa[Hz]')

%% aplicatia 2 partea 2
A=1;
F1=2;
F2=50;
Fs=1000;
durata=1;
fi_0=0;

t=0:1/Fs:durata;
S1=A*sin(2*pi*F1*t+fi_0);
S2=A*sin(2*pi*F2*t+fi_0);
S_insumat=S1+S2;

h=ones(1,20)*(1/20);
y=conv(S_insumat,h,"same");

figure(5)

subplot(2,1,1)
plot(t,y)
title('sinusioda');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(2,1,2)
sprectru1=fftshift(abs(fft(y)));%fast fourier transform
axaFFt1=linspace(-Fs/2,Fs/2,length(y));%linespace imparte axa in 4 segmente egale
plot(axaFFt1,sprectru1)
title('exercitiu 3 sprectru');
xlabel('frecventa [Hz]');

%% aplicatia 3 lab 7
A=10;
durata=1;
Fs=300;
F=3;
faza=0;
t=0:1/Fs:durata;
u=A*sin(2*pi*F*t+faza);

figure(6)

subplot(4,2,1)
plot(t,u)
title('sinusioda');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(4,2,2)
sprectru1=fftshift(abs(fft(u)));%fast fourier transform
axaFFt1=linspace(-Fs/2,Fs/2,length(u));%linespace imparte axa in 4 segmente egale
plot(axaFFt1,sprectru1)
title('exercitiu 3 sprectru');
xlabel('frecventa [Hz]');

zg=-2+4.*rand(1,length(u));
subplot(4,2,3)
plot(t,zg)
title('sinusioda');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(4,2,4)
sprectru1=fftshift(abs(fft(zg)));%fast fourier transform
axaFFt1=linspace(-Fs/2,Fs/2,length(zg));%linespace imparte axa in 4 segmente egale
plot(axaFFt1,sprectru1)
title('exercitiu 3 sprectru');
xlabel('frecventa [Hz]');

suma=u+zg;
subplot(4,2,5)
plot(t,suma)
title('sinusioda');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(4,2,6)
sprectru1=fftshift(abs(fft(suma)));%fast fourier transform
axaFFt1=linspace(-Fs/2,Fs/2,length(suma));%linespace imparte axa in 4 segmente egale
plot(axaFFt1,sprectru1)
title('exercitiu 3 sprectru');
xlabel('frecventa [Hz]');

h=ones(1,20)/20;
y=conv(suma,h,"same");
subplot(4,2,7)
plot(t,y)
title('sinusioda');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(4,2,8)
sprectru1=fftshift(abs(fft(y)));%fast fourier transform
axaFFt1=linspace(-Fs/2,Fs/2,length(y));%linespace imparte axa in 4 segmente egale
plot(axaFFt1,sprectru1)
title('exercitiu 3 sprectru');
xlabel('frecventa [Hz]');

