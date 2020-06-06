function [polos, zeros, MG , MF , Wcg,Wcp] = SistemasControle(Gma)
% Faz uma análise completa do sistema dinâmico determinando:
% polos
% zeros
% MF
% MG
% wmf
% wmg

%%%%% Análise de polos e zeros

N = cell2mat(Gma.numerator);
D = cell2mat(Gma.denominator);

polos = roots(D);
zeros = roots(N);

%%%%% Análise de Bode

[MG,MF,Wcg,Wcp] = margin(Gma);


end

