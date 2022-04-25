% A função principal recebe um vetor de sistemas de referência meta 
% e imprime os ângulos de juntas correspondentes aos mesmos.
% Autores: Alisson Jaques, Matheus Nogueira e Sillas Francisco

function juntas = principal(sistemasDeReferencia); % declara a função

	n = size(sistemasDeReferencia); % para controle do laço
	% dados fornecidos pelo problema:
	ferramenta = [0.1 0.2 30]; 
	estacao = [-0.1 0.3 0];
	current = [0 0 0];
	
	SrelB = utoi(estacao);
	TrelW = utoi(ferramenta);
	
	% com um for imprimos os valores dos ângulos de juntas correspondentes
	% ao sistemas de referência meta
	for i = 1:n(1),
		objetivo = sistemasDeReferencia(i,1:3);
		TrelS = utoi(objetivo);
		[sol near far] = solve(TrelS, TrelW, SrelB, current);
		current = near
	
	if sol == 0,
	
		i = n;
	
	end

end 