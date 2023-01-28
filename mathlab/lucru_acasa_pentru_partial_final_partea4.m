%%filtre notch
clc
clear
% citire semnal audio
[y, Fs] = audioread("MetallicaCuZgomot.wav");

% spectru
Y = fftshift(abs(fft(y)));
axaFFT = linspace(-Fs/2, Fs/2, length(Y));
figure(1)
plot(axaFFT, Y)
title('Spectru semnal initial')
xlabel('Frecventa[Hz]')
ylabel('Magnitudinea')


% spectrograma
w = Fs * 0.25;
figure(2)
spectrogram(y, w, round(w/2), w, Fs, 'yaxis')
title('Spectrograma semnal initial')
ylim([0,5])

% filtrare
F=700;
teta=2*pi*(F/Fs);
r=0.99;
A=[1,-2*r*cos(teta),r*r];
B=[1,-2*cos(teta),1];
rez=filter(B,A,y);
% caracteristica de frecventa
axaF = linspace(-Fs/2, Fs/2, length(y));
H = freqz(B, A, axaF, Fs);
figure(3)
plot(axaF, abs(H))
xlim([-4000, 4000])
title('Caracteristica de frecventa')
xlabel('Frecventa[Hz]')
ylabel('Magnitudine')

% comparatie spectre
figure(4)
subplot(2,1,1)
plot(axaFFT, Y)
title('Spectru semnal initial')
xlabel('Frecventa[Hz]')
ylabel('Magnitudine')
subplot(2,1,2)
Rez = fftshift(abs(fft(rez)));
plot(axaFFT, Rez)
title('Spectru semnal filtrat')
xlabel('Frecventa[Hz]')
ylabel('Magnitudine')

% spectrograma semnal filtrat
figure(5)
spectrogram(rez, w, round(w/2), w, Fs, 'yaxis')
title('Spectrograma semnal filtrat')
ylim([0,5])
