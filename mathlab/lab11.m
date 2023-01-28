%%aplicatia 1 partea 1
[y,Fs] = audioread('semnalPentruSpectrograma.wav');
t=0:1/Fs:((length(y)-1)/Fs);
w=Fs/4;

N1=10001;
n1=(-N1-1)/2:1:(N1-1)/2;

Ft_SUS=200;

hn1=sinc(n1)-(2*Ft_SUS/Fs)*sinc(2*n1*Ft_SUS/Fs);%pi e inclus in formula de sinc
y1=conv(y,hn1,'same');

figure(1)
subplot(2,1,1)
plot(t,y)
title('aplicatia 1 semnal audio');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(2,1,2)
sprectru1=fftshift(abs(fft(y)));%fast fourier transform
axaFFt1=linspace(-Fs/2,Fs/2,length(y));%linespace imparte axa in 4 segmente egale
plot(axaFFt1,sprectru1)
title('aplicatia 1 sprectru');
xlabel('frecventa [Hz]');
xlim([-1000,1000]);


figure (2)
spectrogram(y,w,w/2,w,Fs,'yaxis')
title('aplicatia 1 sprectru');
ylim([0,1]);


figure(3)

subplot(2,1,1)
sprectru3=fftshift(abs(fft(y)));%fast fourier transform
axaFFt3=linspace(-Fs/2,Fs/2,length(y));%linespace imparte axa in 4 segmente egale
plot(axaFFt3,sprectru3)
title('aplicatia 1 sprectru 3');
xlabel('frecventa [Hz]');
xlim([-1000,1000]);

subplot(2,1,2)
sprectru2=fftshift(abs(fft(y1)));%fast fourier transform
axaFFt2=linspace(-Fs/2,Fs/2,length(y1));%linespace imparte axa in 4 segmente egale
plot(axaFFt2,sprectru2)
title('aplicatia 1 sprectru 3');
xlabel('frecventa [Hz]');
xlim([-1000,1000]);

figure(4)

subplot(2,1,1)
spectrogram(y,w,w/2,w,Fs,'yaxis')
title('aplicatia 1 sprectru');
ylim([0,1]);

subplot(2,1,2)
spectrogram(y1,w,w/2,w,Fs,'yaxis')
title('aplicatia 1 sprectru');
ylim([0,1]);

