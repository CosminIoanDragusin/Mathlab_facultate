%%
% A=1;
% F=100;
% Fs=10000;
% durata=0.02;
% fi_0=0;
% t=0:1/Fs:durata;
% rez=A*sin((2*pi*t*F)+fi_0);
% figure(1)
% hold on
% plot(t,rez,'b+--')
% stem(t,rez,'r-')
% hold off
%%

% A=2;
% fi_0=0;
% F=3;
% durata=1;
% Fs=1000;
% t=0:1/Fs:durata;
% dutycicle1=20;
% dutycicle2=40;
% dutycicle3=60;
% dutycicle4=80;
% rez1=A*square((2*pi*F*t)+fi_0,dutycicle1);
% rez2=A*square((2*pi*F*t)+fi_0,dutycicle2);
% rez3=A*square((2*pi*F*t)+fi_0,dutycicle3);
% rez4=A*square((2*pi*F*t)+fi_0,dutycicle4);
% figure(1)
% hold on
% subplot(2,2,1)
% plot(t,rez1)
% title(['dutycicle=',num2str(dutycicle1)]);
% xlabel('amplitudine');
% ylabel('durata timp');
% ylim([-A-0.5,A+0.5]);
% subplot(2,2,2)
% plot(t,rez2)
% title(["dutycicle=",num2str(dutycicle2)])
% xlabel('amplitudine');
% ylabel('durata timp')
% 
% subplot(2,2,3)
% plot(t,rez3)
% title(["dutycicle=",num2str(dutycicle3)])
% xlabel('amplitudine');
% ylabel('durata timp')
% 
% subplot(2,2,4)
% plot(t,rez4)
% title(["dutycicle=",num2str(dutycicle4)])
% xlabel('amplitudine');
% ylabel('durata timp')
% %stem(t,rez,'r-')
% hold off
%%
% A=2;
% fi_0=0;
% F=5;
% durata=0.5;
% for Fs=F:5:20*F
% t=0:1/Fs:durata;
% rez=A*sin((2*pi*t*F)+fi_0)+5;
% plot(t,rez)
% pause(0.1)
% %stem(t,rez,'r-')
% end

%%
% A=1;
% F0=100;
% fi_0=0;
% durata=0.04;
% Fs=10000;
% U0=0;
% k1=1;
% k3=3;
% k5=5;
% F1=1*F0;
% F3=3*F0;
% F5=5*F0;
% t=0:1/Fs:durata;
% Sk1=(4*A)/(k1*pi);
% Sk3=(4*A)/(k3*pi);
% Sk5=(4*A)/(k5*pi);
% rez1=U0+(Sk1*sin(2*pi*F1*t+fi_0));
% rez3=U0+(Sk3*sin(2*pi*F3*t+fi_0));
% rez5=U0+(Sk5*sin(2*pi*F5*t+fi_0));
% rez_suma=rez1+rez3+rez5;
% 
% figure(1)
% hold on
% subplot(4,1,1)
% plot(t,rez1)
% title('Aplicatia suma ordine');
% xlabel('Timp[s]');
% ylabel('Amplitudine');
% subplot(4,1,2)
% plot(t,rez3)
% title('Aplicatia suma ordine');
% xlabel('Timp[s]');
% ylabel('Amplitudine');
% subplot(4,1,3)
% plot(t,rez5)
% title('Aplicatia suma ordine');
% xlabel('Timp[s]');
% ylabel('Amplitudine');
% subplot(4,1,4)
% plot(t,rez_suma)
% title('Aplicatia suma ordine');
% xlabel('Timp[s]');
% ylabel('Amplitudine');
% hold off

%%
% A=1;
% F0=100;
% fi_0=0;
% durata=0.04;
% Fs=10000;
% U0=0;
% rez_suma=0;
% t=0:1/Fs:durata;
% for k=1:2:500
% Sk=(4*A)/(k*pi);
% F=k*F0;
% fi_k=k*fi_0;
% rez=U0+(Sk*sin(2*pi*F*t+fi_k));
% rez_suma=rez_suma+rez;
% plot(t,rez_suma)
% title('Aplicatia suma ordine');
% xlabel('Timp[s]');
% ylabel('Amplitudine');
% 
% end

%%
% A=10;
% F0=50;
% fi_0=0;
% durata=0.05;
% Fs=10000;
% U0=20;
% rez_suma=0;
% t=0:1/Fs:durata;
% for k=1:2:1000
% Sk=(4*A)/(k*pi);
% F=k*F0;
% fi_k=k*fi_0;
% rez=(U0+(Sk*sin(2*pi*F*t+fi_k)));
% rez_suma=rez_suma+rez;
% plot(t,rez_suma)
% title('Aplicatia suma ordine');
% xlabel('Timp[s]');
% ylabel('Amplitudine');
% 
% end

%%
A=1;
F0=2;
fi_0=0;
durata=1;
Fs=10000;
U0=20;
rez_suma=0;
t=0:1/Fs:durata;
for k=1:2:1000
Sk=(4*A)/(k*pi);
F=k*F0;
fi_k=k*fi_0;
rez=(U0+(Sk*sin(2*pi*F*t+fi_k)));
rez_suma=rez_suma+rez;
plot(t,rez_suma)
title('Aplicatia suma ordine');
xlabel('Timp[s]');
ylabel('Amplitudine');

end

