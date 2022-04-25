% Script para solução do exercício de programação (PARTE 2)
% do capítulo 2 do livro de Robótica do Craig.
% Autores: Alisson Jaques, Matheus Nogueira e Sillas Francisco
%
% IFORM = utoi (UFORM) é uma função que recebe um vetor = [x,y,theta] (onde x e y 
% são as coordenadas definidas pelo usuário e theta é o ângulo de orientação) e
% retorna o sistema de coordenadas referente a esse vetor
%
function iform = utoi(uform) % declaração da função 

	radianos = pi/180; % RAD recebe o valor do ângulo convertido em radianos
	x = uform(1); % Obtemos o valor correspondente à coordenada x
	y = uform(2); % Obtemos o valor correspondente à coordenada y

	theta = uform(3)*radianos; 				% theta recebe o valor do ângulo em graus.
	
iform = [cos(theta) -sin(theta) x;  % Matriz que representa o sistema de coordenadas
		sin(theta) cos(theta) y;	% ela é equivalente ao vetor passado pelo usuário
		0 0 1]; 							