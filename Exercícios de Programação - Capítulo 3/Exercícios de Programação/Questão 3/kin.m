% A função KIN recebe como argumento um vetor de ângulos de junta (3x1 e em
% radianos) e retorna o sistema de referência do punho com relação ao sistema
% de referência da base (WrelB). Essa função resolve a situação problema 1 dos 
% Exercícios de Programação Parte 3 do livro Robótica do Craig.
% Autores: Alisson Jaques, Matheus Nogueira Silva e Sillas Francisco

function WrelB = kin(theta) % declara a função

	% declaramos variáveis auxiliares que receberão
	% os valores dos dados do manipulador (em metros).
	L1 = 0.5;   
	L2 = 0.5;   
	
	% calculamos alguns resultados trigonométricos que serão utilizados na atribuíção
	% da matriz de WrelB
	cosseno1 = cos(theta(1));
	seno1 = sin(theta(1));
	cosseno12 = cos(theta(1)+theta(2));
	seno12 = sin(theta(1)+theta(2));
	cosseno123 = cos(theta(1)+theta(2)+theta(3));
	seno123 = sin(theta(1)+theta(2)+theta(3));

% retornamos o sistema de referência procurado
WrelB = [cosseno123  -seno123   L1*cosseno1+L2*cosseno12;
         seno123   cosseno123   L1*seno1+L2*seno12;
           0      0         1];