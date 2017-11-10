% Gera dados para classificação de dados com a base de dados BCW

close all;
clear;
clc;

% Carrega a base de dados
load 'breast_cancer_wisconsin_data.txt' -ASCII;

% Separa padrões em vetores X e Y
X = breast_cancer_wisconsin_data(:,1:10); % padrões
Y = breast_cancer_wisconsin_data(:,11); % rótulos das classes

% Troca rótulos 2 e 4 por 1 e 2
for (i = 1 : size(Y,1))
    if (Y(i) == 2)
        Y(i) = 1;
    end
    if (Y(i) == 4)
        Y(i) = 2;
    end
end

nc1 = 458; % número de padrões da classe 1
nc2 = 241; % número de padrões da classe 2
nc = nc1 + nc2;

idc = randperm(nc); % índices permutados aleatoriamente
X = X(idc,:); % dados de entrada distribuidos randomicamente
Y = Y(idc); % dados de saída distribuidos randomicamente

% Dados de treinamento
Xt = [X(idc(1:round(0.8*end)),:) Y(idc(1:round(0.8*end)))];
% Dados de validação
Xv = [X(idc(round(0.8*end)+1:end),:) Y(idc(round(0.8*end)+1:end))];
