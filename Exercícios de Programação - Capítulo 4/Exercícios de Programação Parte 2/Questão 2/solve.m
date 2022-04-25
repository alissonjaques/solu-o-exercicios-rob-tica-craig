% A função solve recebe como argumento o sistema de referência {T} especificado 
% em relação a {S} (trels), uma matriz que corresponde ao sistema de referência da ferramenta
% (TrelW), uma matriz que corresponde ao sistema de referência da base do robô (SrelB) e
% a posição atual do robô (current) que é um vetor de ângulos de juntas. Como a função
% invkin, solve calcula a cinemática inversa e seu tipo de retorno é um vetor contendo os valores
% de sol, near e far (esses parâmetros são idênticos aos de invkin).
% Autores: Alisson Jaques, Matheus Nogueira e Sillas Francisco

function [sol,near,far] = solve(TrelS,TrelW,SrelB,current) % declara a função

WrelB = itou(SrelB*TrelS*inv(TrelW)); % Obtemos WrelB utilizando trasnformações

[sol,near,far] = invkin(WrelB,current); % Utilizando a função invkin, passando como argumento Wrelb e current, encontramos
										% as soluções de ângulos de juntas