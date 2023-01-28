%s(t)=A*sin(Wt+fi)
%A=amplitudinea
% W=pulsatia[rad/s]
% t=timp[s]
% fi=faza initiala[rad]
% W=2piF
% F=frecventa [f]=HZ
% A=1;
% F=1/t;
% T=0.01;%secunde
% F=100;%Hz

%10 esantionae in o,01 secunde
%Fs ...... 1s
% Fs=10/0.01=1000 %Hz
% t=0:1/Fs:0.02 %durata
% fi0=0;

A=1;
F=100;
Fs=5000;
t=0.02;
T=0:1/Fs:t;
fi_zero=0;
S=A*(sin(2*pi*F*T)+fi_zero);

figure(1)
hold on
plot(T,S,'b+--')
stem(T,S,'r-')
hold off
figure(2)