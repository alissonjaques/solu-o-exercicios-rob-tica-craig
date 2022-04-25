% A função invkin calcula a cinemática inversa do exercício 1 (Exercícios 
% de Programação Parte 1) do livro de Robótica do autor Craig.
% Esta função recebe como argumentos o sistema de referência do punho espe
% cificado em relação ao sistema de referência da base (wrelb), a posição atual do
% robô (current) que é um vetor de ângulos de juntas, e retorna a varial sol, que 
% representa o número de soluções possíveis, a solução mais próxima (near) e
% a segunda solução (far). Se não existirem soluções sol é rotornada como 0 e near e 
% far serão vetores nulos. Caso haja duas soluções a solução mais próxima da posição 
% atual será retornada como um vetor 3x1 (próximo). A segunda solução, mais distante, 
% é retornada como vetor 3x1 (longe). Caso haja apenas uma solução e sol possuirá o 
% valor 1 e a solução será retornada em "perto" e "longe".
% Autores: Alisson Jaques, Matheus Nogueira e Sillas Francisco

function [sol,near,far] = invkin(WrelB,current) % declara a função

L1 = 0.5;   % Comprimento do elo 1 em metros
L2 = 0.5;   % Comprimento do elo 2 em metros

graus = 180/pi;   % conversão para graus
radianos = pi/180;	% conversão para radianosianos

theta = zeros(3,2); % Armazenamento temporário para as duas soluções

x = WrelB(1,3);     % Obtemos o valor de x da matriz WrelB
y = WrelB(2,3);     % Obtemos o valor de y da matriz WrelB

cossenoTheta2 = (x^2+y^2-L1^2-L2^2)/(2*L1*L2); % obtenção do cos(theta2)

if abs(cossenoTheta2)>1    % verifica a existência da solução, se cos(theta2)
    sol = 0;    % for maior, em magnitude, do que 1, então
    near = [];  % não existe solução. E retornamos sol com 0
    far = [];   % e matrizes nulas para ambas as soluções.
    return;     
end;            

senoTheta2Positivo = sqrt(1-cossenoTheta2^2);     % Calculamos o valor positivo para sen(theta2),
senoTheta2Negativo = -sqrt(1-cossenoTheta2^2);    % Calculamos o valor negativo para sen(theta2).

% Obtenção de ambas as soluções para theta2:
theta(2,1) = atan2(senoTheta2Positivo,cossenoTheta2); 
theta(2,2) = atan2(senoTheta2Negativo,cossenoTheta2);

k(1,1) = L1+L2*cos(theta(2,1)); % Calculamos as duas constantes
k(2,1) = L2*sin(theta(2,1));    % k1 e k2 para ambos os valores
k(1,2) = L1+L2*cos(theta(2,2)); % de theta2.
k(2,2) = L2*sin(theta(2,2));

% Obtenção do dois valores para theta1:
theta(1,1) = unwrap(atan2(y,x)-atan2(k(2,1),k(1,1)));   
theta(1,2) = unwrap(atan2(y,x)-atan2(k(2,2),k(1,2)));   

theta123 = atan2(WrelB(2,1),WrelB(1,1));    % Obtenção de theta123

% Obtenção dos dois valores para theta3:
theta(3,1) = unwrap(theta123-theta(1,1)-theta(2,1));    
theta(3,2) = unwrap(theta123-theta(1,2)-theta(2,2));    

controloadorPositivo = 1;  % Controlador de violação de limite positivo
controloadorNegativo = 1;  % Controlador de violação de limite negativo

% Agora, verificamos os ângulos de junta em relação aos limites de +/- 170 graus.

% Checamos a solução 1.
% Se algum dos ângulos na primeira
% solução estão fora dos limites,
% controloadorPositivo recebe 0 (indicando uma violação
% de limite positivo) e o algorimo passa
% para a segunda solução.
for i = 1:3                        
    if abs(theta(i,1))>170*radianos  
        controloadorPositivo = 0;              
        break;                  
    end;                        
end;                            

% Checamos a solução 2.
% Se algum dos ângulos na segunda
% solução estão fora dos limites,
% controloadorNegativo recebe 0 (indicando uma violação
% de limite negativo) e o algorimo passa
% para a próxima instrução.
for i = 1:3                     
    if abs(theta(i,2))>170*radianos  
        controloadorNegativo = 0;              
        break;                 
    end;                        
end;                          

% Se ambas as soluções estão fora dos limites da junta,
% retornamos sol com 0 e os vetores near e fear como nulos 
if (controloadorPositivo == 0) && (controloadorNegativo == 0)
    sol = 0;                
    near = [];
    far = [];
    return;
end;


% Se ambas as soluções estão dentro dos limites da junta,
% encontramos o deslocamento da junta para a solução 1,
% usando soma de quadradianosos. Fazendo a mesma coisa
% para a solução 2. Assim, desbobrimos qual solução é a 
% mais próxima e atribuímos resultados razoáveis.
if (controloadorPositivo && controloadorNegativo) == 1        
    diff = current-theta(:,1); 
    travel(1) = diff'*diff;     
    diff = current-theta(:,2);  
    travel(2) = diff'*diff;     
    if travel(1)<travel(2)      
        near = theta(:,1);      
        far = theta(:,2);       
    else
        near = theta(:,2);
        far = theta(:,1);
    end;
    sol = 2;                    % Duas soluções
    return;
end;

% Se apenas uma solução estiver dentro dos limites da junta,
% descubrimos qual é, e devolvemos near e far como aquela solução.
if (controloadorPositivo | controloadorNegativo) == 1        
    if controloadorPositivo                    
        near = theta(:,1);      
        far = theta(:,1);
    else
        near = theta(:,2);
        far = theta(:,2);
    end;
    sol = 1;                    % Um solução
    return;
end;