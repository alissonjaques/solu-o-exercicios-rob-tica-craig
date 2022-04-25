% A função vetorDeAngulosParaMatrizRotacional recebe um único argumento (um vetor
% contendo os ângulos Z-Y-Z de Euler e retorna a matriz
% rotacional do sistema de referência. Essa função resolve
% a situação problema a) dos Exercícios para MATLAB 2A do
% livro Robótica do Craig.
% Autores: Alisson Jaques, Matheus Nogueira Silva e Sillas Francisco
 
function R = vetorDeAngulosParaMatrizRotacional(e) % declara a função e seu tipo de retorno

	radianos = pi/180; 			% conversão para radianos

	% Declaramos variáveis auxiliares que receberam valores trigonométricos (seno e cosseno)
	% para melhor desempenho e simplicidade (para construção da matriz rotacional)
	cossenoAlfa = cos(e(1)*radianos);
	senoAlfa = sin(e(1)*radianos);
	cossenoBeta = cos(e(2)*radianos);
	senoBeta = sin(e(2)*radianos);
	cossenoGama = cos(e(3)*radianos);
	senoGama = sin(e(3)*radianos);

% Declaramos uma variável auxiliar que recebe a matriz rotacional que procuramos,
% sendo retornada pela função vetorDeAngulosParaMatrizRotacional.
R = [cossenoAlfa*cossenoBeta*cossenoGama-senoAlfa*senoGama -cossenoAlfa*cossenoBeta*senoGama-senoAlfa*cossenoGama cossenoAlfa*senoBeta;
senoAlfa*cossenoBeta*cossenoGama+cossenoAlfa*senoGama -senoAlfa*cossenoBeta*senoGama+cossenoAlfa*cossenoGama senoAlfa*senoBeta;
-senoBeta*cossenoGama senoBeta*senoGama cossenoBeta];
