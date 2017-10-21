function normalizado = normalizacao(tabela, xmax, xmin)
[qtd_linhas, ~] = size(tabela);
for i = 1:qtd_linhas
    for j = 1:4
        tabela(i, j) = 2 * ((tabela(i, j) - xmin) / (xmax - xmin)) - 1;
    end
end
normalizado = tabela;
end