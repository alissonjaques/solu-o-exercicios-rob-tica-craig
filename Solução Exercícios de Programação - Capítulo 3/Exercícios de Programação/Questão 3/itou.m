% A funão itou recebe como argumento uma matriz 3x3,
% que representa a posição e orientação, e converte da forma 
% interna para a forma do usuário.

function uform = itou(iform) % declara a função

	graus = 180/pi;   % Conveção para radianos

	cossenoTheta = iform(1,1); % Obtenção do cosseno
	senoTheta = iform(2,1);    % Obtenção do seno

% Computamos o ângulo e as coordenadas utilizando a funçao atan2 para
% o ângulo e o conteúdo do vetor informe para as coordenadas.
theta = atan2(senoTheta,cossenoTheta);     
x = iform(1,3);                     
y = iform(2,3);                    

uform = [x y theta*graus]';   % retornamos o vetor procurado, com o ângulo em graus
