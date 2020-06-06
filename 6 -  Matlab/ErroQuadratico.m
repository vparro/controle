function [Eq] = ErroQuadratico(X,y,t,u)
% Esta função determina o erro quadrático
% entre a saída real e a saída do modelo.
% u - entrada real - Laboratório
% y - saída real - Laboratório
% t - tempo real - Laboratório
% X = [Km pm] - o que eu quero descobrir
% desejo estimar [ Km e pm ] que minimiza o Eq (erro)

Km = X(1);
pm = X(2);

%%% Modelo

G = tf(Km,[1 pm]);      % função de transferência estimada para o Motor

%%% Saida do modelo

ym = lsim(G,u,t);        % y teorico

%%% Erro quadrático - comparar com os dados experimentais

Eq = sum((y - ym).^2);   % cálculo do erro


end

