%% Sistemas de controle - resposta impulsiva - controle em malha fechada%  Referência: https://wiki.octave.org/Control_package%  V.C.Parroclear all;        % Limpa as variáveisclc;              % limpa a telaclose all;        % limpa os gráficospkg load control  %% somente para usuários de Octave%% Definindo o sistema de baseGp = tf(1,[1 -1]);%% Resposta impulsiva do sistemafigure(1)impulse(Gp,[0:0.1:1])title('Resposta impulsiva');xlabel('Tempo em segundos');grid;set(gca, "linewidth", 3, "fontsize", 23)%% Realimentando o sistema com Gc(s)=2Gc = 2;Gmf = feedback(Gc*Gp,1);%% Resposta impulsiva de ambos os sistemasfigure(2)impulse(Gmf,[0:0.1:1]); hold; impulse(Gp,[0:0.1:1])title('Resposta impulsiva');xlabel('Tempo em segundos');grid;set(gca, "linewidth", 3, "fontsize", 23)%% Analisando a resposta ao degrau unitário do sistema relimentadofigure(3)step(Gmf,[0:0.1:5]); title('Resposta ao degrau');xlabel('Tempo em segundos');grid;set(gca, "linewidth", 3, "fontsize", 23)