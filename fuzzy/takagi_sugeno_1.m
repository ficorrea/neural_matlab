function [ z ] = takagi_sugeno_1(x)
% _____________________________ takagi_sugeno_1 _______________________________
% Implementação do sistema de inferência fuzzy tipo Takagi-Sugeno para 1 entrada
% (baseado no exemplo 4.3 do livro Neuro-fuzzy and Soft Computing)
%
% (c) Prof. Maurílio J. Inácio 2017
% Eng. de Computação / FACIT
%
% [ z ] = takagi_sugeno_1(x)
%
% z = saida do sistema
% x = variável de entrada
%
% Implementado em MATLAB ver. R2016a
%
% Parametros das funcoes de pertinencia dos antecedentes
A1 = [1.5085 0.2690]; % pequeno
A2 = [1.2700 3.9867]; % medio
A3 = [0.5790 7.2410]; % grande
% Fuzzyficacao
pA1 = gaussmf(x, A1); % pertinencia na funcao A1
pA2 = gaussmf(x, A2); % pertinencia na funcao A2
pA3 = gaussmf(x, A3); % pertinencia na funcao A3
% Calculo das regras fuzzy (operador produto)
% regra 1: Se X eh pequeno entao Z eh z1
w1 = pA1; % forca de disparo da regra 1
z1 = 0.1*x + 6.4; % funcao linear do consequente 1
% regra 2: Se X eh medio entao Z eh z2
w2 = pA2; % forca de disparo da regra 2
z2 = -0.5*x + 4; % funcao linear do consequente 2
% regra 3: Se X eh grande entao Z eh z3
w3 = pA3; % forca de disparo da regra 3
z3 = x - 2; % funcao linear do consequente 3
% Defuzzyficacao
z = (w1*z1 + w2*z2 + w3*z3) / (w1 + w2 + w3); % saida

