%% sprectrograma
%aplicatie 1


% clc
% clear
% [x, Fs] = audioread("semnalPentruSpectrograma.wav");
% %sound(x,Fs)
% durata = (length(x)-1)/Fs;
% t = 0:1/Fs:durata;
% 
% % reprezentare in timp
% figure(1)
% subplot(2,1,1)
% plot(t,x)
% title("Semnal audio")
% xlabel("timp [s]")
% ylabel("amplitudine")
% 
% % spectru
% X = fftshift(abs(fft(x)));
% axaFFT = linspace(-Fs/2, Fs/2, length(x));
% subplot(2,1,2)
% plot(axaFFT, X)
% xlim([-1000, 1000])
% title("Spectru semnal audio")
% xlabel("frecventa [Hz]")
% ylabel("magnitudine")
% 
% % spectrograma
% w = Fs/4;
% figure(2)
% spectrogram(x, w, round(w/2), w, Fs, 'yaxis')
% title("Spectrograma")
% ylim([0,1])
% 
% % filtrare FTS
% N = 10001;
% n = -(N-1)/2:(N-1)/2;
% Ft = 225;
% h = sinc(n) - 2*Ft/Fs * sinc(2*n*Ft/Fs);
% filt = conv(x,h, 'same');
% %sound(filt,Fs)
% 
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
% 
% % comparatie spectrograme
% figure(4)
% subplot(2,1,1)
% spectrogram(x, w, round(w/2), w, Fs, 'yaxis')
% title("Spectrograma semnal initial")
% ylim([0,1])
% subplot(2,1,2)
% spectrogram(filt, w, round(w/2), w, Fs, 'yaxis')
% title("Spectrograma semnal filtrat")
% ylim([0,1])

%% aplicatia 2

[x,Fs]=audioread('SemnalDistorsionat.wav');
durata=(length(x)-1)/Fs;
t=0:1/Fs:durata;
sprectru=fftshift(abs(fft(x)));
axaFFt=linspace(-Fs/2,Fs/2,length(x));

%filtrare

Ft1 = 1140; 
Ft2 = 1160;
Ft3 = 4040;
Ft4 = 4060;
n = -(N-1)/2:(N-1)/2;
h1 = sinc(n)-2*Ft2/Fs*sinc(2*n*Ft2/Fs)+2*Ft1/Fs*sinc(2*n*Ft1/Fs);
h2 = sinc(n)-2*Ft4/Fs*sinc(2*n*Ft4/Fs)+2*Ft3/Fs*sinc(2*n*Ft3/Fs);
y=conv(x,h1,'same');
z=conv(y,h2,'same');

%sprectru 2
sprectru2=fftshift(abs(fft(z)));
axaFFt2=linspace(-Fs/2,Fs/2,length(z));

%sprectrograme
w=Fs/4;

%afisare sprectre + spectrograme
figure(1)
subplot(2,2,1)
plot(axaFFt,sprectru)
subplot(2,2,2)
plot(axaFFt2,sprectru2)
subplot(2,2,3)
spectrogram(x,w,round(w/2),w,Fs,'yaxis');

subplot(2,2,4)
spectrogram(z,w,round(w/2),w,Fs,'yaxis');
