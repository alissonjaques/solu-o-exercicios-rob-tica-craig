% Procedure TINVERT (VAR brela, arelb: frame);
% A função TINVERT recebe como argumento uma matriz
% que representa uma rotação do sistema de coordenadas
% {B} em {A} e retorna uma matriz que representa uma rotação
% do sistema de coordenadas {A} em {B} (processo inverso)
% Essa função resolve a situação problema 4 dos Exercícios de 
% Programação Parte 2 livro Robótica do Craig.
% Autores: Alisson Jaques, Matheus Nogueira Silva e Sillas Francisco

function arelb = TINVERT(brela) % declara a função

	aRotacionadoEmb = brela'; % obtemos a matriz transposta de B rotacionado em A

	% um for aninhado para o cálculo do processo inverso
	for i = 1:2,
        
		aRotacionadoEmb(i,3) = 0.0; % última coluna da matriz transposta recebe 0.0
		for j = 1:2;
			
			aRotacionadoEmb(i,3) = aRotacionadoEmb(i,3) - brela(j,i)*brela(j,3); % preenchemos o restante da matriz
		                                                                         % levando em consideração o processo inverso
		
		end

	end

arelb = aRotacionadoEmb; % retornamos a matriz que retrocede o processo de transformação
