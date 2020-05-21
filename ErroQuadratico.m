function [Eq] = ErroQuadratico(X,u,y,t)
% Esta função determina o erro quadrático
% entre a saída real e a saída do modelo.
% u - entrada real
% y - saída real
% t - tempo real
% X = [Km pm];

Km = X(1);
pm = X(2);

%%% Modelo

Gp = tf(Km,[1 pm]); %% Criei o modelo

%%% Saida do modelo

ym = lsim(Gp,u,t); %% simulei o modelo

%%% Erro quadrático

Eq = sum((y - ym).^2); %% cálculo do erro

% plot(t,y,t,ym,"linewidth", 2)

end

