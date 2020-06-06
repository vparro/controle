function [ ] = BodeAnalise(Gma)
% Analisa o diagrama de bode separando a função

%%%%% Análise de polos e zeros

N = cell2mat(Gma.numerator);
D = cell2mat(Gma.denominator);

polos = roots(D);
zeros = roots(N);

%%%%%

G1 = tf(1,[1 -polos(1)])
G2 = tf(1,[1 -polos(2)])

[MAG1,PHASE1,W1] = bode(G1);
[MAG2,PHASE2,W2] = bode(G2);
[MAG,PHASE,W] = bode(Gma);

%%%%% Visualizando o bode

semilogx(W, 20*log10(squeeze(MAG)), 'k', 'LineWidth',3);
grid;
title('Ganho')
xlabel('Frequência  - \omega')
ylabel('Módulo em dB')

hold;

semilogx(W1, 20*log10(squeeze(MAG1)), 'r-.', 'LineWidth',3);
grid;
title('Ganho')
xlabel('Frequência  - \omega')
ylabel('Módulo em dB')

semilogx(W2, 20*log10(squeeze(MAG2)), 'b-.', 'LineWidth',3);
grid;
title('Ganho')
xlabel('Frequência  - \omega')
ylabel('Módulo em dB')

end

