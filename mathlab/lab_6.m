%%
% aplicatia 1

x=[0,3,3,3,6,6,6,9,9,9,0];%conventia 0 padding
h=[1,-1];
y=conv(x,h,'same');

%%
%aplicatia 2
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

figure(1)

subplot(3,2,1)
plot(t,S1)
title('sinusioda 1');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,2)
sprectru1=fftshift(abs(fft(S1)));%fast fourier transform
axaFFt1=linspace(-Fs/2,Fs/2,length(S1));%linespace imparte axa in 4 segmente egale
plot(axaFFt1,sprectru1)
title('exercitiu 2 sprectru 1');
xlabel('frecventa [Hz]');

subplot(3,2,3)
plot(t,S2)
title('sinusioda 2');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,4)
sprectru2=fftshift(abs(fft(S2)));%fast fourier transform
axaFFt1=linspace(-Fs/2,Fs/2,length(S2));%linespace imparte axa in 4 segmente egale
plot(axaFFt1,sprectru2)
title('exercitiu 2 sprectru 2');
xlabel('frecventa [Hz]');

subplot(3,2,5)
plot(t,S_insumat)
title('sinusoide insumate');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,6)
sprectru3=fftshift(abs(fft(S_insumat)));%fast fourier transform
axaFFt3=linspace(-Fs/2,Fs/2,length(S_insumat));%linespace imparte axa in 4 segmente egale
plot(axaFFt3,sprectru3)
title('exercitiu 2 sprectru insumat');
xlabel('frecventa [Hz]');

%%
%aplicatia 3

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

h2=[1,-1];
y=conv(S_insumat,h2,'same');

figure(2)

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

%%
%aplicatia 4

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

h3=ones(1,20)/20;
y=conv(S_insumat,h3,'same');

figure(3)

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

%%
%aplicatia 5

A=10;
F=3;
Fs=300;
durata=1;
fi_0=0;

t=0:1/Fs:durata;
u=A*sin(2*pi*F*t+fi_0);
a=-2;
b=2;
zg= a + (b-a).*rand(1,length(u));

sin_zgomot=u+zg;

h4=ones(1,20);
u_zg=conv(sin_zgomot,h4,'same');

figure(4)

subplot(4,2,1)
plot(t,u)
title('sinusioda');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(4,2,2)
sprectru1=fftshift(abs(fft(u)));%fast fourier transform
axaFFt1=linspace(-Fs/2,Fs/2,length(u));%linespace imparte axa in 4 segmente egale
plot(axaFFt1,sprectru1)
title(' sprectru');
xlabel('frecventa [Hz]');

subplot(4,2,3)
plot(t,zg)
title('zgomot');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(4,2,4)
sprectru2=fftshift(abs(fft(zg)));%fast fourier transform
axaFFt2=linspace(-Fs/2,Fs/2,length(zg));%linespace imparte axa in 4 segmente egale
plot(axaFFt2,sprectru2)
title(' sprectru zgomot');
xlabel('frecventa [Hz]');


subplot(4,2,5)
plot(t,sin_zgomot)
title('sinusoida+zgomot');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(4,2,6)
sprectru2=fftshift(abs(fft(sin_zgomot)));%fast fourier transform
axaFFt2=linspace(-Fs/2,Fs/2,length(sin_zgomot));%linespace imparte axa in 4 segmente egale
plot(axaFFt2,sprectru2)
title(' sprectru sinusoida+zgomot');
xlabel('frecventa [Hz]');

subplot(4,2,7)
plot(t,u_zg)
title('zgomot filtrat');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(4,2,8)
sprectru2=fftshift(abs(fft(u_zg)));%fast fourier transform
axaFFt2=linspace(-Fs/2,Fs/2,length(u_zg));%linespace imparte axa in 4 segmente egale
plot(axaFFt2,sprectru2)
title(' sprectru filtrat');
xlabel('frecventa [Hz]');