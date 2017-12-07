function [ y ] = mandani_1(x)
% ______________________________ mandani_1 _______________________________
% Implementação do sistema de inferencia fuzzy tipo Mandani para 1 entrada
%(baseado no exemplo 4.1 do livro Neuro-fuzzy and Soft Computing)
%
% (c) Prof. Maurílio J. Inácio 2017
% Eng. de Computação / FACIT
%
% [ y ] = mandani_1(x)
%
% y = saida do sistema
% x = variável de entrada
%
% % Implementado em MATLAB ver. 2016a
%
% Parametros das funcoes de pertinencia dos antecedentes
A1 = [1.4400 0.0251]; % pequeno
A2 = [0.9634 4.0700]; % medio
A3 = [0.9880 5.9003]; % grande
% Parametros das funcoes de pertinencia dos consequentes
B1 = [0.0799 -0.1610]; % pequeno
B2 = [0.0334 0.2745]; % medio
B3 = [0.0260 0.9942]; % grande
% Geracao das funcoes de pertinencia dos consequentes
y = 1 : 0.1 : 10;
for i = 1 : size(y,2);
fp_B1(i) = gaussmf(y(i), B1);
fp_B2(i) = gaussmf(y(i), B2);
fp_B3(i) = gaussmf(y(i), B3);
end
% Fuzzyficacao
pA1 = gaussmf(x, A1); % pertinencia na funcao A1
pA2 = gaussmf(x, A2); % pertinencia na funcao A2
pA3 = gaussmf(x, A3); % pertinencia na funcao A3
% Calculo das regras fuzzy (composicao max-min)
% regra 1: Se X eh pequeno entao Y e pequeno
w1 = pA1; % forca de disparo da regra 1
fp_B11 = min(w1, fp_B1); % funcao de pertinencia B1 qualificada
% regra 2: Se X eh medio entao Y e medio
w2 = pA2; % forca de disparo da regra 2
fp_B22 = min(w2, fp_B2); % funcao de pertinencia B1 qualificada
% regra 3: Se X eh grande entao Y e grande
w3 = pA3; % forca de disparo da regra 3
fp_B33 = min(w3, fp_B3); % funcao de pertinencia B1 qualificada
% agregacao das regras
fp_y = max([fp_B11; fp_B22; fp_B33]); % funcao de pertinencia de saida
% Defuzzyficacao
y = defuzz(y, fp_y, 'centroid'); % saida