clear all;

x = 0 : 0.01 : 2*pi;
y = sin(x)./x;
plot(x,y);

sugeno_fis = readfis('mysugeno.fis');
y_sugeno_tool = evalfis(x, sugeno_fis)';

mandani_fis = readfis('mymandani.fis');
y_mandani_tool = evalfis(x, mandani_fis)';