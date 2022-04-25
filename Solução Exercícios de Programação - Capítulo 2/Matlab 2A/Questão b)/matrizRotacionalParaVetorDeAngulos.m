% A função matrizRotacionalParaVetorDeAngulos recebe como argumento
% uma matriz rotacional 3x3 e retorna dois vetores de ângulos Z-Y-Z
% de Euler. Essa função resolve a situação problema b) dos Exercícios
% para MATLAB 2A do livro Robótica do Craig.
% Autores: Alisson Jaques, Matheus Nogueira Silva e Sillas Francisco
 
function [e1,e2] = matrizRotacionalParaVetorDeAngulos(R) % declara a função

	graus = 180/pi; % Conversão para graus
	% Encontramos a primeira solução (usando o sinal positivo na raiz quadrada)
	beta1 = atan2(sqrt(R(3,1)^2+R(3,2)^2),R(3,3)); % Obtenção de beta
	senoBetaSign = sign(sin(beta1)); % Obtenção do sinal de seno(beta)
	alfa1 = atan2(R(2,3)*senoBetaSign,R(1,3)*senoBetaSign); % Obtenção de alfa
	gama1 = atan2(R(3,2)*senoBetaSign,-R(3,1)*senoBetaSign);% Obtenção de gama
	
	% Encontramos a segunda solução (usando o sinal negativo na raiz quadrada)
	beta2 = atan2(-sqrt(R(3,1)^2+R(3,2)^2),R(3,3)); % Obtenção de beta
	senoBetaSign = sign(sin(beta2)); % Obtenção do sinal de seno(beta)
	alfa2 = atan2(R(2,3)*senoBetaSign,R(1,3)*senoBetaSign); % Obtenção de alfa
	gama2 = atan2(R(3,2)*senoBetaSign,-R(3,1)*senoBetaSign);% Obtenção de gama

%retornos da função (ângulos Z-Y-Z contidos nos indices dos vetores e1 e e2):
e1 = [a1 b1 g1]*graus;
e2 = [a2 b2 g2]*graus;