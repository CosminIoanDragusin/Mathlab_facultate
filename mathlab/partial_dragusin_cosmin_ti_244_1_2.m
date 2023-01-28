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
faze0=0;
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
