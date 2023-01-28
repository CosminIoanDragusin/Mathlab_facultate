clc
clear 
close all

A = [8 1 6; 3 5 7; 4 9 2];
A(1,3);
x=1:10;
for n=1:8
    x(n)=2*n;
end

figure()
title('lucru')
xlabel('semnificatie x')
ylabel('semnificatie y')
plot([1,3],[5,7])
