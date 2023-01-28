%% Aplicatia 1 
clc
clear
[x, Fs] = audioread("MetallicaCuZgomot.wav");
%sound(x,Fs)
durata = (length(x)-1)/Fs;
t = 0:1/Fs:durata;

F=700;
r=0.99;
teta=2*pi*F/Fs;
A=[1,-2*r*cos(teta),r*r];
B=[1,-2*cos(teta),1];
y=filter(B,A,x);

% reprezentare in timp
figure(1)
plot(t,x)
title("Semnal audio")
xlabel("timp [s]")
ylabel("amplitudine")

% spectru
figure(4)
X = fftshift(abs(fft(x)));
axaFFT = linspace(-Fs/2, Fs/2, length(x));
plot(axaFFT, X)
title("Spectru semnal audio")
xlabel("frecventa [Hz]")
ylabel("magnitudine")

% spectrograma
w = Fs/4;
figure(3)
spectrogram(x, w, round(w/2), w, Fs, 'yaxis')
title("Spectrograma")
ylim([0,5])

% % filtrare FTS
% N = 10001;
% n = -(N-1)/2:(N-1)/2;
% Ft = 225;
% h = sinc(n) - 2*Ft/Fs * sinc(2*n*Ft/Fs);
% filt = conv(x,h, 'same');
% %sound(filt,Fs)

% reprezentare in timp a semnalului zgomot filtrat
figure(2)
plot(t,y)
title("Semnal audio")
xlabel("timp [s]")
ylabel("amplitudine")

% spectru a semnalului zgomot filtrat
figure(5)
Y = fftshift(abs(fft(y)));
axaFFT = linspace(-Fs/2, Fs/2, length(y));
plot(axaFFT, Y)
% ylim([0,120])
title("Spectru semnal audio")
xlabel("frecventa [Hz]")
ylabel("magnitudine")

% spectrograma a semnalului zgomot filtrat
w = Fs/4;
figure(6)
spectrogram(y, w, round(w/2), w, Fs, 'yaxis')
title("Spectrograma")
ylim([0,5])

% % comparatie spectre
% Filt = fftshift(abs(fft(filt)));
% figure(3)
% subplot(2,1,1)
% plot(axaFFT, X)
% xlim([-1000, 1000])
% title("Spectru semnal initial")
% subplot(2,1,2)
% plot(axaFFT, Filt)
% xlim([-1000, 1000])
% title("Spectru semnal filtrat")

% comparatie spectrograme
% figure(4)
% subplot(2,1,1)
% spectrogram(x, w, round(w/2), w, Fs, 'yaxis')
% title("Spectrograma semnal initial")
% ylim([0,1])
% subplot(2,1,2)
% spectrogram(filt, w, round(w/2), w, Fs, 'yaxis')
% title("Spectrograma semnal filtrat")
% ylim([0,1])

