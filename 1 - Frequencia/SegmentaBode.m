function [] = SegmentaBode(Gma,Wmin,Wmax)
% Plota o diagrama de bode, separando o ganho
% polos e zeros

%% Paleta de cores e marcadores

C = {'k','g','c','y','b'}; %
M = {'o','diamond','square','*','+'}; % 
m = 1;

%% Determina o diagrama de Bode da função completa

[mag,phase,w] = bode(Gma,{Wmin,Wmax});
[Gm,Pm,Wcg,Wcp] = margin(Gma);

% Plota a versão completa
%%% Módulo da função de transferência

subplot(2,1,1)
semilogx(w, 20*log10(squeeze(mag)), '-b', 'LineWidth',3);
grid;
title('Ganho')
xlabel('Frequência  - \omega')
ylabel('Módulo em dB')

if isnan(Wcp) == 0
xline(Wcp,'r-.','LineWidth',2);
end

if isnan(Wcp) == 0
xline(Wcp,'r-.','LineWidth',2);
end

yline(0,'r-.','LineWidth',2);

hold;

%%% Fase da função de transferência
% plot(x,x.^ii,'color',C{ii},'marker','o')

subplot(2,1,2)
semilogx(w, squeeze(phase), '-b', 'LineWidth',3);
grid;
title('Ganho');
xlabel('Frequência  - \omega');
ylabel('Fase em graus');

if isnan(Wcp) == 0
xline(Wcp,'r-.','LineWidth',2);
end

yline(-180,'r-.','LineWidth',2);

hold;

% Separa em pólos e zeros

[Z,P,K] = zpkdata(Gma);

% Determina o número de funções

lz = length(Z);
lp = length(P);

% coloca em formato apropriado para manipulação

Z = cell2mat(Z);
P = cell2mat(P);

%%% Plota os pólos da função de transferência

if isempty(P) == 0

% plot(x,x.^ii,'color',C{ii},'marker','o')
 
for n = 1:lp
        
G = tf(1,[1 P(n)]);  
[mag,phase,w] = bode(G,{Wmin,Wmax});

subplot(2,1,1)
semilogx(w, 20*log10(squeeze(mag)), 'color',C{n},'marker',M{n}, 'LineWidth',1);
subplot(2,1,2)
semilogx(w, squeeze(phase), 'color',C{n},'marker',M{n}, 'LineWidth',1);

end

end

%%% Plota os zeros da função de transferência

if isempty(Z) == 0
   
  for m = 1:lz
        
       G = tf([1 Z(m)],1);  
      [mag,phase,w] = bode(G,{Wmin,Wmax});

      subplot(2,1,1)
      semilogx(w, 20*log10(squeeze(mag)), 'color',C{m+lp},'marker',M{m+lp}, 'LineWidth',1);
      subplot(2,1,2)
      semilogx(w, squeeze(phase), 'color',C{m+lp},'marker',M{m+lp}, 'LineWidth',1);

  end  

end

%%% Plota o ganho do sistema

      G = tf(K,1);  
      [mag,phase,w] = bode(G,{Wmin,Wmax});


      subplot(2,1,1)
      semilogx(w, 20*log10(squeeze(mag)), 'color',C{m+lp+lz},'marker',M{m+lp+lz}, 'LineWidth',2);
      subplot(2,1,2)
      semilogx(w, squeeze(phase), 'color',C{m+lp+lz},'marker',M{m+lp+lz}, 'LineWidth',2);
      

end

