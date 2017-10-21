function erro_quadratico = erro(y_treino, y_validado, w)
[qtd_linhas, ~] = size(y_validado);
eqm = 0;
for i = 1:qtd_linhas
    n = 1 / (w(1)*y_validado(i,1) + w(2)*y_validado(i,2) + w(3)*y_validado(i,3) + w(4)*y_validado(i,4));
    eqm = eqm + n * (y_validado(i, 5) - y_treino(i, 5));
end
erro_quadratico = eqm;
end