function eqm = erro(x, y, y_imp)
colunas = size(x,2);
n = 0;
for i = 2:colunas
    n = n + x(1,i) * (y(1,i) - y_imp(1,i))^2;
end
eqm = 1 / n;
end