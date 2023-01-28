A=2;
F=3;
Fs=1000;% 1/F = 0.4
t=1;%durata semnal
T=0:1/Fs:t;
fi_zero=0;
dutycycle1=20;
dutycycle2=40;
dutycycle3=60;
dutycycle4=80;
S1=A*(square(2*pi*F*T+fi_zero,dutycycle1));
S2=A*(square(2*pi*F*T+fi_zero,dutycycle2));
S3=A*(square(2*pi*F*T+fi_zero,dutycycle3));
S4=A*(square(2*pi*F*T+fi_zero,dutycycle4));
figure(2)
hold on
subplot(2,2,1)
plot(T,S1)
ylim([-A-0.5,A+0.5])
xlabel('durata'),ylabel('amplitudine')
title(['dutycycle= ',num2str(dutycycle1)])

subplot(2,2,2)
plot(T,S2)
ylim([-A-0.5,A+0.5])
xlabel('durata'),ylabel('amplitudine')
title('square2')

subplot(2,2,3)
plot(T,S3)
ylim([-A-0.5,A+0.5])
xlabel('durata'),ylabel('amplitudine')
title('square3')

subplot(2,2,4)
plot(T,S4)
ylim([-A-0.5,A+0.5])
xlabel('durata'),ylabel('amplitudine')
title('square4')
hold off
%nu uita de title(),xlabel(),ylabel()

