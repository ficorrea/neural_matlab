% Gera dados para aproximação da série Box-Jenkins

close all;
clear;
clc;

% Carrega dados da série temporal
ts = load('box_jenkins.txt');

nd = size(ts,1); % número de dados
nc = size(ts,2); % número de coordenadas dos dados

X = ts;
Xt = zeros(200, 3);
Xv = zeros(90, 3);

% Dados para treinamento
start = 1;
Xt(:, 1) = X(start:start+200-1,1); % x(t-4)
start = start + 3;
Xt(:, 2) = X(start:start+200-1,2); % y(t-1)
start = start + 1;
Xt(:, 3) = X(start:start+200-1,2); % y(t)

% Dados para  validação
start = 203;
Xv(:, 1) = X(start:start+90-1,1); % x(t-4)
start = start + 3;
Xv(:, 2) = X(start:start+90-1,2); % y(t-1)
start = start + 1;
Xv(:, 3) = X(start:start+90-1,2); % y(t)

% Exibe dados
subplot(2,1,1);
plot(Xt(:,3));
title('Dados de Treinamento');
subplot(2,1,2);
plot(Xv(:,3),'r');
title('Dados de Validação');
