%%aplicatia 1 lab tftdi
F1=100;
F2=500;
Fs=8000;
A=1;
f0=0;
durata=1;
t=0:1/Fs:durata;
sem1=A*sin(2*pi*F1*t+f0);
sem2=A*sin(2*pi*F2*t+f0);
sum=sem1+sem2;
figure(1)
subplot(3,2,1)
plot(t,sum)
title("suma sinusoide")
xlabel("timp[S]")
ylabel("Amplitudinea")
xlim([0,0.1]);

%sprectru semnal
S=fftshift(abs(fft(sum)));
axaFFT=linspace(-Fs/2,Fs/2,length(sum));
subplot(3,2,2)
plot(axaFFT,S)
title("Sprectru Semnal")
xlabel("Frecventa[Hz]")

%coeficienti filtru tftdi
N=1001;
n=-(N-1)/2:(N-1)/2;
Ft=300;
h=2*Ft/Fs*sinc(2*n*Ft/Fs);
subplot(3,2,3)
plot(n,h)
title("Coeficienti FTJ")

%caracteristica reala de amplitudine a Ftj
H = fftshift(abs(fft(h)));
axaFFT = linspace(-Fs/2, Fs/2, length(H));
subplot(3,2,4)
plot(axaFFT, H)
title("Caracteristica reala de amplitudine")
xlabel("frecventa [Hz]")
ylim([0, 1.5])

%semnal filtrat
subplot(3,2,5)
y=conv(sum,h,'same');
plot(t,y)
title("semnal filtrat")
title("Sprectru Semnal")
xlabel("Frecventa[Hz]")
xlim([0.1,0.2])

%sprectru semnal filtrat
Y = fftshift(abs(fft(y)));
axaFFT = linspace(-Fs/2, Fs/2, length(Y));
subplot(3,2,6)
plot(axaFFT, Y)
title("Caracteristica reala de amplitudine")
xlabel("frecventa [Hz]")

%% aplicatia 2 trei sinusoide
A=1;
faza0=0;
Fs=10000;
F1=300;
F2=400;
F3=500;
durata=1;
t=0:1/Fs:durata;
sem1=A*sin(2*pi*t*F1+faza0);
sem2=A*sin(2*pi*t*F2+faza0);
sem3=A*sin(2*pi*t*F3+faza0);
sum=sem1+sem2+sem3;

figure(2)
subplot(3,2,1)
plot(t,sum)
title("suma sinusoide")
xlabel("timp[S]")
ylabel("Amplitudinea")

subplot(3,2,2)
sprectru_sum=fftshift(abs(fft(sum)));
axasprectru=linspace(-Fs/2,Fs/2,length(sum));
plot(axasprectru,sprectru_sum)
title("suma sprectru")
xlabel("frecventa[hz]")

N=1001;
n=-(N-1)/2:(N+1)/2;
Ft1=350;
Ft2=450;
filtrareJos=(2*Ft1/Fs)*sinc(2*n*Ft1/Fs);
filtrareSus=(sinc(n)-(2*Ft2/Fs)*sinc(2*n*Ft2/Fs));
filtrareTreceBanda=((2*Ft2/Fs)*sinc(2*n*Ft2/Fs))-((2*Ft1/Fs)*sinc(2*n*Ft1/Fs));
filtrareOpresteBanda=sinc(n)-((2*Ft2/Fs)*sinc(2*n*Ft2/Fs))+((2*Ft1/Fs)*sinc(2*n*Ft1/Fs));
subplot(3,2,3)
plot(n,filtrareJos)
title("Coeficienti FTJ")
xlabel("timp[S]")
ylabel("Amplitudinea")

y=conv(sum,filtrareJos,"same");

%%
%% Aplicatia 1 - semnal dreptunghiular
F = 50;
A = 1;
f0 = 0;
Fs = 10000;
durata = 2;
t = 0:1/Fs:durata;
d = A * square(2*pi*F*t + f0);

% grafic semnal dreptunghiular
figure(3)
subplot(3,2,1)
plot(t, d)
title("Semnal dreptunghiular")
xlabel("timp [s]")
ylabel("amplitudine")
xlim([0, 0.04])
ylim([-1.2, 1.2])

% spectru semnal dreptunghiular
D = fftshift(abs(fft(d)));
axaFFT = linspace(-Fs/2, Fs/2, length(D));
subplot(3,2,2)
plot(axaFFT, D)
title("Spectru semnal")
xlabel("frecventa [Hz]")

% c) trece doar armonica fundamentala => FTJ
N = 1001;
n = -(N-1)/2:(N-1)/2;
Ft = 100;
h = 2*Ft/Fs * sinc(2*n*Ft/Fs);
subplot(3,2,3)
plot(n, h)
title("Coeficientii FTJ")

H = fftshift(abs(fft(h)));
axaFFT = linspace(-Fs/2, Fs/2, length(H));
subplot(3,2,4)
plot(axaFFT, H)
title("Caracteristica reala de amplitudine")
xlabel("frecventa [Hz]")
ylim([0, 1.5])

filt = conv(d, h, "same");
subplot(3,2,5)
plot(t, filt)
title("Semnal filtrat")
xlabel("timp [s]")
ylabel("amplitudine")
xlim([0.1, 0.2])

Filt = fftshift(abs(fft(filt)));
axaFFT = linspace(-Fs/2, Fs/2, length(Filt));
subplot(3,2,6)
plot(axaFFT, Filt)
title("Spectru semnal filtrat")
xlabel("frecventa [Hz]")

%% d) armonica fundamentala suprimata - FTS
% semnal dreptunghiular
figure(4)
subplot(3,2,1)
plot(t, d)
title("Semnal dreptunghiular")
xlabel("timp [s]")
ylabel("amplitudine")
xlim([0, 0.04])
ylim([-1.2, 1.2])

% spectru semnal dreptunghiular
D = fftshift(abs(fft(d)));
axaFFT = linspace(-Fs/2, Fs/2, length(D));
subplot(3,2,2)
plot(axaFFT, D)
title("Spectru semnal")
xlabel("frecventa [Hz]")

% Filtare
N = 1001;
n = -(N-1)/2:(N-1)/2;
Ft = 100;
h = sinc(n) - 2*Ft/Fs * sinc(2*n*Ft/Fs);
subplot(3,2,3)
plot(n, h)
title("Coeficientii FTS")

H = fftshift(abs(fft(h)));
axaFFT = linspace(-Fs/2, Fs/2, length(H));
subplot(3,2,4)
plot(axaFFT, H)
title("Caracteristica reala de amplitudine")
xlabel("frecventa [Hz]")
ylim([0, 1.5])

filt = conv(d, h, "same");
subplot(3,2,5)
plot(t, filt)
title("Semnal filtrat")
xlabel("timp [s]")
ylabel("amplitudine")
xlim([0.1, 0.2])

Filt = fftshift(abs(fft(filt)));
axaFFT = linspace(-Fs/2, Fs/2, length(Filt));
subplot(3,2,6)
plot(axaFFT, Filt)
title("Spectru semnal filtrat")
xlabel("frecventa [Hz]")

%%
clc
clear

[x,Fs]=audioread('SemnalDistorsionat.wav');

% Spectru semnal initial
X = fftshift(abs(fft(x)));
axaFrecventeX = linspace(-Fs/2, Fs/2, length(X));
% sound(x,Fs)
% clear sound

% implementare filtru 
N = 20001; % ordin filtru
Ft1 = 1140; 
Ft2 = 1160;
Ft3 = 4040;
Ft4 = 4060;
n = -(N-1)/2:(N-1)/2;
h1 = sinc(n)-2*Ft2/Fs*sinc(2*n*Ft2/Fs)+2*Ft1/Fs*sinc(2*n*Ft1/Fs);
h2 = sinc(n)-2*Ft4/Fs*sinc(2*n*Ft4/Fs)+2*Ft3/Fs*sinc(2*n*Ft3/Fs);
H1 = fftshift(abs(fft(h1)));
H2 = fftshift(abs(fft(h2)));
axaFrecventeH = linspace(-Fs/2, Fs/2, length(H1));

% filtrare semnal
y = conv(x,h1,'same');
y = conv(y,h2,'same');

% spectru semnal filtrat
Y = fftshift(abs(fft(y)));
axaFrecventeY = linspace(-Fs/2, Fs/2, length(Y));

% redare semnal filtrat
sound(y,Fs)

% Grafice
figure(5)
subplot(4,1,1)
    plot(axaFrecventeX, X)
    xlabel('Frecventa[Hz]'), title('Spectrul semnalului suma')
subplot(4,1,2)
    plot(axaFrecventeH, H1)
    xlabel('Frecventa[Hz]'), title('Caracteristica amplitudine FOB1')
subplot(4,1,3)
    plot(axaFrecventeH, H2)
    xlabel('Frecventa[Hz]'), title('Caracteristica amplitudine FOB2')
subplot(4,1,4)
    plot(axaFrecventeY, Y)
    xlabel('Frecventa[Hz]'), title('Spectrul semnalului filtrat')