%% aplicatia 1
A=1;
F1=100;
F2=500;
Fs=8000;
durata=1;
fi_0=0;

t=0:1/Fs:durata;
S1=A*sin(2*pi*F1*t+fi_0);
S2=A*sin(2*pi*F2*t+fi_0);
S_insumat=S1+S2;

N1=101;
n1=((-N1-1)/2):1:((N1-1)/2);

N2=1001;
n2=(-N2-1)/2:1:(N2-1)/2;


%  valoare_calcul_n;
%  for i=0:N1/2
%     valoare_calcul_n=(-(N-1)/2)+i;
%      N(i)=valoare_calcul_n;
% end

Ft=300;

hn1=((2*Ft)/Fs)*sinc(2*n1*(Ft/Fs));%pi e inclus in formula de sinc
y1=conv(S_insumat,hn1,'same');

hn2=((2*Ft)/Fs)*sinc(2*n2*(Ft/Fs));%pi e inclus in formula de sinc
y2=conv(S_insumat,hn2,'same');

figure(1)

subplot(3,2,1)
plot(t,S_insumat)
xlim([0,0.1]);
title('aplicatia 1 sinusoida');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,2)
sprectru1=fftshift(abs(fft(S_insumat)));%fast fourier transform
axaFFt1=linspace(-Fs/2,Fs/2,length(S_insumat));%linespace imparte axa in 4 segmente egale
plot(axaFFt1,sprectru1)
title('aplicatia 1 sprectru');
xlabel('frecventa [Hz]');

subplot(3,2,3)
plot(n2,hn2)
title('Coeficeint Ftj1');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,4)
sprectru2=fftshift(abs(fft(hn2)));%fast fourier transform
axaFFt2=linspace(-Fs/2,Fs/2,length(hn2));%linespace imparte axa in 4 segmente egale
plot(axaFFt2,sprectru2)
ylim([0,1.5]);
title('Coeficeint Ftj1 sprectru');
xlabel('frecventa [Hz]');

subplot(3,2,5)
plot(t,y2)
xlim([0.1,0.2]);
title('Coeficeint Ftj2');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,6)
sprectru3=fftshift(abs(fft(y2)));%fast fourier transform
axaFFt3=linspace(-Fs/2,Fs/2,length(y2));%linespace imparte axa in 4 segmente egale
plot(axaFFt3,sprectru3)
title('Coeficeint Ftj2 sprectru');
xlabel('frecventa [Hz]');

%%aplicatia 2 trece jos

A=1;
F1=300;
F2=400;
F3=500;
Fs=10000;
durata=1;
fi_0=0;

t=0:1/Fs:durata;
S1=A*sin(2*pi*F1*t+fi_0);
S2=A*sin(2*pi*F2*t+fi_0);
S3=A*sin(2*pi*F3*t+fi_0);
S_insumat=S1+S2+S3;

N1=1001;
n1=(-N1-1)/2:1:(N1-1)/2;

Ft=330;

hn1=((2*Ft)/Fs)*sinc(2*n1*(Ft/Fs));%pi e inclus in formula de sinc
y1=conv(S_insumat,hn1,'same');
figure(2)

subplot(3,2,1)
plot(t,S_insumat)
xlim([0,0.1]);
title('aplicatia 1 sinusoida');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,2)
sprectru1=fftshift(abs(fft(S_insumat)));%fast fourier transform
axaFFt1=linspace(-Fs/2,Fs/2,length(S_insumat));%linespace imparte axa in 4 segmente egale
plot(axaFFt1,sprectru1)
title('aplicatia 1 sprectru');
xlabel('frecventa [Hz]');

subplot(3,2,3)
plot(n1,hn1)
title('Coeficienti Ftj, N=1001');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,4)
sprectru2=fftshift(abs(fft(hn1)));%fast fourier transform
axaFFt2=linspace(-Fs/2,Fs/2,length(hn1));%linespace imparte axa in 4 segmente egale
plot(axaFFt2,sprectru2)
ylim([0,1.5]);
title('Caracteristica reala Ftj , N=1001');
xlabel('frecventa [Hz]');

subplot(3,2,5)
plot(t,y1)
xlim([0.1,0.2]);
title('Semnal filtrat');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,6)
sprectru3=fftshift(abs(fft(y1)));%fast fourier transform
axaFFt3=linspace(-Fs/2,Fs/2,length(y1));%linespace imparte axa in 4 segmente egale
plot(axaFFt3,sprectru3)
title('Sprectrul semnalului filtrat');
xlabel('frecventa [Hz]');

%% aplicatia 2 filtru trece banda
A=1;
F1=300;
F2=400;
F3=500;
Fs=10000;
durata=1;
fi_0=0;

t=0:1/Fs:durata;
S1=A*sin(2*pi*F1*t+fi_0);
S2=A*sin(2*pi*F2*t+fi_0);
S3=A*sin(2*pi*F3*t+fi_0);
S_insumat=S1+S2+S3;

N1=1001;
n1=(-N1-1)/2:1:(N1-1)/2;

Ft1=350;
Ft2=450;

hn1=(((2*Ft2)/Fs)*sinc(2*n1*(Ft2/Fs)))-(((2*Ft1)/Fs)*sinc(2*n1*(Ft1/Fs)));%pi e inclus in formula de sinc
y1=conv(S_insumat,hn1,'same');

figure(3)

subplot(3,2,1)
plot(t,S_insumat)
xlim([0,0.1]);
title('aplicatia 1 sinusoida');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,2)
sprectru1=fftshift(abs(fft(S_insumat)));%fast fourier transform
axaFFt1=linspace(-Fs/2,Fs/2,length(S_insumat));%linespace imparte axa in 4 segmente egale
plot(axaFFt1,sprectru1)
title('aplicatia 1 sprectru');
xlabel('frecventa [Hz]');

subplot(3,2,3)
plot(n1,hn1)
title('Coeficienti Ftbanda, N=1001');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,4)
sprectru2=fftshift(abs(fft(hn1)));%fast fourier transform
axaFFt2=linspace(-Fs/2,Fs/2,length(hn1));%linespace imparte axa in 4 segmente egale
plot(axaFFt2,sprectru2)
title('Caracteristica reala Ftbanda , N=1001');
xlabel('frecventa [Hz]');

subplot(3,2,5)
plot(t,y1)
xlim([0.1,0.2]);
title('Semnal filtrat');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,6)
sprectru3=fftshift(abs(fft(y1)));%fast fourier transform
axaFFt3=linspace(-Fs/2,Fs/2,length(y1));%linespace imparte axa in 4 segmente egale
plot(axaFFt3,sprectru3)
title('Sprectrul semnalului filtrat');
xlabel('frecventa [Hz]');

%% aplicatia 2 filtru trece sus
A=1;
F1=300;
F2=400;
F3=500;
Fs=10000;
durata=1;
fi_0=0;

t=0:1/Fs:durata;
S1=A*sin(2*pi*F1*t+fi_0);
S2=A*sin(2*pi*F2*t+fi_0);
S3=A*sin(2*pi*F3*t+fi_0);
S_insumat=S1+S2+S3;

N1=1001;
n1=(-N1-1)/2:1:(N1-1)/2;

Ft_SUS=450;


hn1=sinc(n1)-(2*Ft_SUS/Fs)*sinc(2*n1*Ft_SUS/Fs);%pi e inclus in formula de sinc
y1=conv(S_insumat,hn1,'same');

figure(4)

subplot(3,2,1)
plot(t,S_insumat)
xlim([0,0.1]);
title('aplicatia 1 sinusoida');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,2)
sprectru1=fftshift(abs(fft(S_insumat)));%fast fourier transform
axaFFt1=linspace(-Fs/2,Fs/2,length(S_insumat));%linespace imparte axa in 4 segmente egale
plot(axaFFt1,sprectru1)
title('aplicatia 1 sprectru');
xlabel('frecventa [Hz]');

subplot(3,2,3)
plot(n1,hn1)
title('Coeficienti Fts, N=1001');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,4)
sprectru2=fftshift(abs(fft(hn1)));%fast fourier transform
axaFFt2=linspace(-Fs/2,Fs/2,length(hn1));%linespace imparte axa in 4 segmente egale
plot(axaFFt2,sprectru2)
title('Caracteristica reala Fts , N=1001');
xlabel('frecventa [Hz]');

subplot(3,2,5)
plot(t,y1)
xlim([0.1,0.2]);
title('Semnal filtrat');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,6)
sprectru3=fftshift(abs(fft(y1)));%fast fourier transform
axaFFt3=linspace(-Fs/2,Fs/2,length(y1));%linespace imparte axa in 4 segmente egale
plot(axaFFt3,sprectru3)
title('Sprectrul semnalului filtrat');
xlabel('frecventa [Hz]');

%%Filtru Fob
A=1;
F1=300;
F2=400;
F3=500;
Fs=10000;
durata=1;
fi_0=0;

t=0:1/Fs:durata;
S1=A*sin(2*pi*F1*t+fi_0);
S2=A*sin(2*pi*F2*t+fi_0);
S3=A*sin(2*pi*F3*t+fi_0);
S_insumat=S1+S2+S3;

N1=1001;
n1=(-N1-1)/2:1:(N1-1)/2;

Ft1=350;
Ft2=450;

hn1=sinc(n1)-(2*Ft2/Fs)*sinc(2*n1*(Ft2/Fs))+(2*Ft1/Fs)*sinc(2*n1*(Ft1/Fs));%pi e inclus in formula de sinc
y1=conv(S_insumat,hn1,'same');

figure(5)

subplot(3,2,1)
plot(t,S_insumat)
xlim([0,0.1]);
title('aplicatia 1 sinusoida');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,2)
sprectru1=fftshift(abs(fft(S_insumat)));%fast fourier transform
axaFFt1=linspace(-Fs/2,Fs/2,length(S_insumat));%linespace imparte axa in 4 segmente egale
plot(axaFFt1,sprectru1)
title('aplicatia 1 sprectru');
xlabel('frecventa [Hz]');

subplot(3,2,3)
plot(n1,hn1)
title('Coeficienti FOB, N=1001');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,4)
sprectru2=fftshift(abs(fft(hn1)));%fast fourier transform
axaFFt2=linspace(-Fs/2,Fs/2,length(hn1));%linespace imparte axa in 4 segmente egale
plot(axaFFt2,sprectru2)
title('Caracteristica reala FOB , N=1001');
xlabel('frecventa [Hz]');

subplot(3,2,5)
plot(t,y1)
xlim([0.1,0.2]);
title('Semnal filtrat');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(3,2,6)
sprectru3=fftshift(abs(fft(y1)));%fast fourier transform
axaFFt3=linspace(-Fs/2,Fs/2,length(y1));%linespace imparte axa in 4 segmente egale
plot(axaFFt3,sprectru3)
title('Sprectrul semnalului filtrat');
xlabel('frecventa [Hz]');

%%aplicatia 1 partea 2
%aici sunt datele pentru semnal dreptunghiulal
A=1;
F1=50;
Fs=10000;
durata=2;
fi_0=0;

% aici sunt datele pentru armonica fundamentala

U0=0;
k1=1;
% k3=3;
% k5=5;
 Sk1=(4*A)/(k1*pi);
% Sk3=(4*A)/(k3*pi);
% Sk5=(4*A)/(k5*pi);
 F=50;
 Fk1=k1*F;
% Fk3=k3*F;
% Fk5=k5*F;

% rez3=U0+(Sk3*sin((2*pi*Fk3*t)+fi_0));
% rez5=U0+(Sk5*sin((2*pi*Fk5*t)+fi_0));
% rez_suma=rez1+rez3+rez5;

t=0:1/Fs:durata;
S_quare1=A*square(2*pi*F1*t+fi_0);
rez1=U0+(Sk1*sin((2*pi*Fk1*t)+fi_0));

Ft=50;
N1=10001;
n1=-(N1-1)/2:1:(N1-1)/2;

hn1=((2*Ft)/Fs)*sinc(2*n1*(Ft/Fs));%pi e inclus in formula de sinc
y1=conv(S_quare1,hn1,'same');

figure(6)

subplot(4,2,1)
plot(t,S_quare1)
xlim([0,0.04]);
title('aplicatia 1 semnal dreptunghiulal');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(4,2,2)
sprectru1=fftshift(abs(fft(S_quare1)));%fast fourier transform
axaFFt1=linspace(-Fs/2,Fs/2,length(S_quare1));%linespace imparte axa in 4 segmente egale
plot(axaFFt1,sprectru1)
title('aplicatia 1 sprectru');
xlabel('frecventa [Hz]');

subplot(4,2,3)
plot(t,rez1)
xlim([0,0.04]);
title('aplicatia 1 armonica fundamentala');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(4,2,4)
sprectru2=fftshift(abs(fft(rez1)));%fast fourier transform
axaFFt2=linspace(-Fs/2,Fs/2,length(rez1));%linespace imparte axa in 4 segmente egale
plot(axaFFt2,sprectru2)
title('aplicatia 1 sprectru armonica fundamentala');
xlabel('frecventa [Hz]');

subplot(4,2,5)
plot(n1,hn1)
title('aplicatia 1 armonica fundamentala');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(4,2,6)
sprectru3=fftshift(abs(fft(hn1)));%fast fourier transform
axaFFt3=linspace(-Fs/2,Fs/2,length(hn1));%linespace imparte axa in 4 segmente egale
plot(axaFFt3,sprectru3)
title('aplicatia 1 sprectru armonica fundamentala');
xlabel('frecventa [Hz]');

subplot(4,2,7)
plot(t,y1)
xlim([0,0.04]);
title('Semnal filtrat');
xlabel('timp secunde');
ylabel('amplitudine');

subplot(4,2,8)
sprectru4=fftshift(abs(fft(y1)));%fast fourier transform
axaFFt4=linspace(-Fs/2,Fs/2,length(y1));%linespace imparte axa in 4 segmente egale
plot(axaFFt4,sprectru4)
title('Sprectrul semnalului filtrat');
xlabel('frecventa [Hz]');