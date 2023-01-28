%punctul a
A=1;
fi_0=0;
durata=0.05;
F=100;
Fs=40000;
t=0:1/Fs:durata;
rez1=A*sin((2*pi*F*t)+fi_0);

figure(1)
hold on
plot(t,rez1)
hold off

%%
%punctul b
A1=1;
U0=0;

fi1=0;
fi3=3*fi1;
fi5=5*fi1;

durata=0.05;

F1=100;
F3=3*F1;
F5=5*F1;

Fs=40000;
t=0:1/Fs:durata;

S1=(4*A)/(1*pi);
S3=(4*A)/(3*pi);
S5=(4*A)/(5*pi);

rez1=U0+(S1*sin((2*pi*F1*t)+fi1));
rez3=U0+(S3*sin((2*pi*F3*t)+fi3));
rez5=U0+(S5*sin((2*pi*F5*t)+fi5));

figure(2)
hold on
subplot(3,1,1)
plot(t,rez1)
title('subpunctul b ordin 1');
xlabel('amplitudine');
ylabel('timp');
subplot(3,1,2)
plot(t,rez3)
title('subpunctul b ordin 3');
xlabel('amplitudine');
ylabel('timp');
subplot(3,1,3)
plot(t,rez5)
title('subpunctul b ordin 5');
xlabel('amplitudine');
ylabel('timp');
hold off

%%
%pucntul c
A1=1;
U0=0;
rez_suma=0;
rez_suma2=0;

fi1=0;
fi3=3*fi1;
fi5=5*fi1;

durata=0.05;

F1=100;
F3=3*F1;
F5=5*F1;

Fs=40000;
t=0:1/Fs:durata;

S1=(4*A)/(1*pi);
S3=(4*A)/(3*pi);
S5=(4*A)/(5*pi);

rez1=U0+(S1*sin((2*pi*F1*t)+fi1));
rez3=U0+(S3*sin((2*pi*F3*t)+fi3));
rez5=U0+(S5*sin((2*pi*F5*t)+fi5));
rez_suma=rez1+rez3+rez5;

for k=1:2:500
fik=fi1*k;
Fk=k*F1;
Sk=(4*A)/(k*pi);
rez=U0+(Sk*sin((2*pi*Fk*t)+fik));
rez_suma2=rez_suma2+rez;
end

figure(3)
hold on

plot(t,rez_suma)
plot(t,rez_suma2)
title('subpunctul b ordin 1,3,5,si k');
xlabel('amplitudine');
ylabel('timp');

hold off