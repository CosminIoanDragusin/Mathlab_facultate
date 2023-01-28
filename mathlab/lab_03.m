% A=1;
% fi_0=0;
% T=1;
% F=9;
% durata=1;
% Fs=90;
% Fs1=8;
% t=0:1/Fs:durata;
% t1=0:1/Fs1:durata;
% rez1=A*sin((2*pi*F*t)+fi_0)
% rez2=A*sin((2*pi*F*t1)+fi_0)
% 
% figure(1);
% subplot(2,1,1);
% hold on
% title('F=9Hz Fs=90Hz');
% xlabel('Timp[s]');
% ylabel('Amplitudine');
% plot(t,rez1);
% hold off
% 
% subplot(2,1,2);
% title('F=9Hz Fs=8Hz');
% xlabel('Timp[s]');
% ylabel('Amplitudine');
% hold on
% plot(t1,rez2);
% stem(t1,rez2,'-');
% hold off

figure(1);
A=1;
fi_0=-pi/2;
durata=0.1;
F=100;
for Fs=F:10:20*F
t=0:1/Fs:durata;
rez=A*sin((2*pi*F*t)+fi_0);
title('F=9Hz Fs=90Hz');
 xlabel('Timp[s]');
 ylabel('Amplitudine');
 plot(t,rez);
 pause(0.5)
end

 
