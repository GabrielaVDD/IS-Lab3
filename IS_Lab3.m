%% IS LD3
% Atliko: DISfm-21 gr. stud. Gabriela Vdoviak

clc;
clear all;
close all;
%% Tinklo mokymo etapas
% Duomenų paruošimas
x = 0:1/22:1;
d = ((1 + 0.6*sin(2*pi*x/0.7)) + (0.3*sin(2*pi*x)))/2;
figure(1);
plot(x,d,'b');
grid on;
hold on;

% Parenkami r, c parametrai
c1 = 0.2;
c2 = 0.9;
r1 = 0.15;
r2 = 0.15;

% Antro sluoksnio ryšių svoriai
w1 = rand(1);
w2 = rand(1);
b = rand(1);
n = 0.1;
N = 5000;

% Tinklo mokymas
for k = 1:N
    for i = 1:length(x)     
    f1 = exp(-(((x(i)-c1)^2)/(2*r1^2)));
    f2 = exp(-(((x(i)-c2)^2)/(2*r2^2)));
    y = f1*w1 + f2*w2 + b;
    e = d(i) - y;
    % Svorių atnaujinimas
    w1 = w1 + n*e*f1;
    w2 = w2 + n*e*f2;
    b = b + n*e;
    end
end

%% Testavimo etapas
a = 0:1/18:1;
z = zeros(1,length(a));

for j = 1:length(a)
    f1 = exp(-(((a(j)-c1)^2)/(2*r1^2)));
    f2 = exp(-(((a(j)-c2)^2)/(2*r2^2)));
    y = f1*w1 + f2*w2 + b;
    z(j) = y;
end

% Mokymo rezultato grafikas
plot(a,z,'r*');

%% Papildoma užduotis
