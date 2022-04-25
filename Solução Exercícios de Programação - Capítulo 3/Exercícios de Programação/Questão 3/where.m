% A função TrelS recebe três argumentos. Um é o vetor de ângulos de juntas,
% os outros são uma matriz que corresponde ao sistema de referência da ferramenta
% (TrelW) e uma matriz que corresponde ao sistema de referência da base do robô (SrelB).
% Essa função retorna a localização da ferramenta em relação ao sistema de referência da
% estação.

function TrelS = where(theta,TrelW,SrelB) % declara a função

WrelB = kin(theta); % Usamos a função kin para obter {W} em relação a {B}.

TrelS = inv(SrelB)*WrelB*TrelW; % retornamos a localização procurada utilizando a equação de transformação.