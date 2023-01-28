%%exercitiu 1 a) si b) lab 6
A=1;
fi_0=0;
Fs=10000;
durata=2;
F=200;

T=1/200;%T=1/F;
T5=5/200;%a 5 perioada!!!!

t=0:1/Fs:durata;
S=A*sin(2*pi*F*t +fi_0);

figure(1)

subplot(2,1,1)
plot(t,S)
xlim([0,T5]);%pentru limita de 5 perioade
title('exercitiu 1 subpunct a)');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(2,1,2)
sprectru=fftshift(abs(fft(S)));%fast fourier transform
axaFFt=linspace(-Fs/2,Fs/2,length(S));%linespace imparte axa in 4 segmente egale
plot(axaFFt,sprectru)
title('exercitiu 1 subpunct b)');
xlabel('frecventa [Hz]');

%% aplicatia 2
A=1;
fi_0=0;
Fs=10000;
durata=1;
F1=500;
F2=1000;

t=0:1/Fs:durata;
S1=A*sin(2*pi*F1*t+fi_0);
S2=A*sin(2*pi*F2*t+fi_0);
S_insumat=S1+S2;

figure(2)

subplot(3,2,1)
plot(t,S1)
xlim([0,0.01]);
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
xlim([0,0.01]);
title('sinusioda 2');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,4)
sprectru2=fftshift(abs(fft(S2)));%fast fourier transform
axaFFt2=linspace(-Fs/2,Fs/2,length(S2));%linespace imparte axa in 4 segmente egale
plot(axaFFt2,sprectru2)
title('exercitiu 2 sprectru 2');
xlabel('frecventa [Hz]');

subplot(3,2,5)
plot(t,S_insumat)
xlim([0,0.01]);
title('sinusioda insumata');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,6)
sprectru_insumat=fftshift(abs(fft(S_insumat)));%fast fourier transform
axaFFt_insumat=linspace(-Fs/2,Fs/2,length(S_insumat));%linespace imparte axa in 4 segmente egale
plot(axaFFt_insumat,sprectru_insumat)
title('exercitiu 2 sprectru insumat');
xlabel('frecventa [Hz]');

%% aplicatia 3

A=1;
fi_0=0;
Fs=10000;
durata=2;
F1=100;

 t=0:1/Fs:durata;
figure(3);
% for k=1:2:500
%     Sk=(4*A)/(k*pi);
% 
% Fk=k*F;
% rez=Sk*sin((2*pi*Fk*t)+fi_0);
% rez_suma=rez_suma+rez;
% 
% end
rez=A*square((2*pi*F1*t)+fi_0);
subplot(2,1,1)
plot(t,rez);
xlim([0,0.04]);
title('Aplicatia 3');
xlabel('Timp[s]');
ylabel('Amplitudine');


subplot(2,1,2)
sprectru=fftshift(abs(fft(rez)));%fast fourier transform
axaFFt=linspace(-Fs/2,Fs/2,length(rez));%linespace imparte axa in 4 segmente egale
plot(axaFFt,sprectru)
title('sprectru exercitiu 3');
xlabel('frecventa [Hz]');

%% aplicatia 4

A=1;
fi_0=0;
Fs=10000;
durata=2;
F_square=100;
F_sin=200;

t=0:1/Fs:durata;
S1=A*sin((2*pi*F_sin*t)+fi_0);
S2=A*square((2*pi*F_square*t)+fi_0);
S_suma_semnale=S1+S2;

figure(4);

subplot(3,2,1)
plot(t,S1);
xlim([0,0.02]);
title('Aplicatia 4 sinusoida');
xlabel('Timp[s]');
ylabel('Amplitudine');

subplot(3,2,2)
sprectru=fftshift(abs(fft(S1)));%fast fourier transform
axaFFt=linspace(-Fs/2,Fs/2,length(S1));%linespace imparte axa in 4 segmente egale
plot(axaFFt,sprectru)
title('sprectru exercitiu sinusoida');
xlabel('frecventa [Hz]');

subplot(3,2,3)
plot(t,S2);
xlim([0,0.02]);
title('Aplicatia 4 square');
xlabel('Timp[s]');
ylabel('Amplitudine');

subplot(3,2,4)
sprectru=fftshift(abs(fft(S2)));%fast fourier transform
axaFFt=linspace(-Fs/2,Fs/2,length(S2));%linespace imparte axa in 4 segmente egale
plot(axaFFt,sprectru)
title('sprectru square');
xlabel('frecventa [Hz]');

subplot(3,2,5)
plot(t,S_suma_semnale);
xlim([0,0.02]);
title('Aplicatia 4 sume semanale');
xlabel('Timp[s]');
ylabel('Amplitudine');

subplot(3,2,6)
sprectru=fftshift(abs(fft(S_suma_semnale)));%fast fourier transform
axaFFt=linspace(-Fs/2,Fs/2,length(S_suma_semnale));%linespace imparte axa in 4 segmente egale
plot(axaFFt,sprectru)
title('sprectru suma semnale');
xlabel('frecventa [Hz]');