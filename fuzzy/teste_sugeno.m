
for i = 1 : size(x,2)
    [ y_sugeno_imp(i) ] = takagi_sugeno_1(x(i));
end
plot(x,y_sugeno_imp)
xlabel('X'); ylabel('Z');
title('Saida do Sistema Fuzzy tipo Takagi-Sugeno');

eqm = erro(x, y, y_sugeno_imp);
fprintf('EQM Sugeno Implementado:'); disp(eqm)

eqm = erro(x, y, y_sugeno_tool);
fprintf('EQM Sugeno Toolbox:'); disp(eqm)