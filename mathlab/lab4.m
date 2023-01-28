%% exercitiul 1 
% U0=0;
% A=4/pi;
% fi_0=0;
% T=0.01;
% F=100;
% durata=0.04;
% Fs=10000;
% k=1;
% 
% % Fk=k*F;
% t=0:1/Fs:durata;
% rez=A*sin((2*pi*F*t)+fi_0);
% 
% figure(1);
% hold on
% title('Aplicatia 1');
% xlabel('Timp[s]');
% ylabel('Amplitudine');
% plot(t,rez);
% hold off

%% exercitiul 2 ordin 3

% U0=0;
% A=1;
% k1=1;
% k3=3;
% k5=5;
% Sk1=(4*A)/(k1*pi);
% Sk3=(4*A)/(k3*pi);
% Sk5=(4*A)/(k5*pi);
% fi_0=0;
% T=0.01;
% F=100;
% durata=0.04;
% Fs=20000;
% Fk1=k1*F;
% Fk3=k3*F;
% Fk5=k5*F;
% 
% t=0:1/Fs:durata;
% rez1=U0+(Sk1*sin((2*pi*Fk1*t)+fi_0));
% rez3=U0+(Sk3*sin((2*pi*Fk3*t)+fi_0));
% rez5=U0+(Sk5*sin((2*pi*Fk5*t)+fi_0));
% rez_suma=rez1+rez3+rez5;
% 
% figure(1);
% hold on
% 
% subplot(4,1,1)
% title('Aplicatia ordin 1');
% xlabel('Timp[s]');
% ylabel('Amplitudine');
% plot(t,rez1);
% 
% subplot(4,1,2)
% title('Aplicatia ordin 3');
% xlabel('Timp[s]');
% ylabel('Amplitudine');
% plot(t,rez3);
% 
% subplot(4,1,3)
% title('Aplicatia ordin 5');
% xlabel('Timp[s]');
% ylabel('Amplitudine');
% plot(t,rez5);
% 
% subplot(4,1,4)
% title('Aplicatia suma ordine');
% xlabel('Timp[s]');
% ylabel('Amplitudine');
% plot(t,rez_suma);
% 
% hold off

%% punctul e
U0=0;
A=1;
fi_0=0;
T=0.005;
F=100;
durata=0.04;
Fs=10000;
rez_suma=0;

t=0:1/Fs:durata;
figure(3);
for k=1:2:500

Sk=(4*A)/(k*pi);

Fk=k*F;
rez=Sk*sin((2*pi*Fk*t)+fi_0);
rez_suma=rez_suma+rez;

title('Aplicatia 1');
xlabel('Timp[s]');
ylabel('Amplitudine');
plot(t,rez_suma);
pause(0.2);
end