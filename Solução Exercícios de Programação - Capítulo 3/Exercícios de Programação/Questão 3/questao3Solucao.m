SrelB_u = [-0.1 0.3 0]';    % Referência da estação

% Agora convertemos os valores fornecidos pelo usuário (acima) em valores internos, 
% utilizano a sub-rotina utoi (criada no trabalho 2)
TrelW = utoi(TrelW_u);
SrelB = utoi(SrelB_u);

% Agora pedimos ao usuário que insira os três valores correspondentes aos ângulos de junta:
theta = input('Entre com os valores dos ângulos de juntas ([theta1 theta2 theta3]): ');
theta = theta*radianos;  % Conversão para radianos.

% Agora usamos a função where (criada no exercício 2.2 do trabalho 3)
TrelS = where(theta,TrelW,SrelB); % TrelS recebe o conteúdo da função where, na qual são passados
								  % os valores correspondentes aos ângulos de juntas, deslocamento
								  % da ferramenta e referência da estação

% Convertemos para a forma do usuário e exibimos o resultado no terminal,
% utilizando, novamente, a função itou e passando como argumento para a 
% mesma TrelS
TrelS_u = itou(TrelS)