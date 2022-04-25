% Este algorimo resolve completamente o problema de cinemática inversa de postura
% do robô 3R 3-DOF.
% Autores: Alisson Jaques, Matheus Nogueira e Sillas Francisco
clc;clear all;

%% cinemática inversa do manipulador Planar 3R
% ferramentaPlano = [1 0 0 9; 0 1 0 0; 0 0 1 0; 0 0 0 1]
% ferramentaPlano = [0.5 -0.866 0 7.5373; 0.866 0.6 0 3.9266; 0 0 1 0; 0 0 0 1]
% ferramentaPlano = [0 1 0 -3; -1 0 0 2; 0 0 1 0; 0 0 0 1]
 ferramentaPlano = [0.866 0.5 0 -3.1245; -0.5 0.866 0 9.1674; 0 0 1 0; 0 0 0 1]


l1=4; l2=3; l3=2;
punhoPlanoTransformada = [1 0 0 l3; 0 1 0 0; 0 0 1 0; 0 0 0 1];
punhoPlano = ferramentaPlano/punhoPlanoTransformada
c_phi = punhoPlano(1,1);
s_phi = punhoPlano(2,1);
x = punhoPlano(1,4);
y = punhoPlano(2,4);
c2 = (x^2 + y^2 - l1^2 - l2^2)/(2*l1*l2);

tol = 4*eps;
if (abs(c2)-1) < tol % se objetivo dentro do alcance
    
	% Para encontrar os ângulos theta1, theta2 e theta3 utilizamos as expressões definidas no livro
	s2 = sqrt(1-c2^2);
    theta2 = [atan2(s2, c2) atan2(-s2, c2)]; % obtenção de theta2 
    
    k1 = l1 + l2*c2; % obtenção de k1
    k2 = l2*s2;      % obtenção de k2
    theta1 = [(atan2(y,x) - atan2(k2,k1)) (atan2(y,x) - atan2(-k2,k1))]; % obtenção de theta1
    
    phi = atan2(s_phi, c_phi);
    theta3 = phi - theta1 - theta2; % obtenção de theta3
	
    % impressão dos ângulos theta1, theta2 e theta3 encontrados:
    fprintf('Theta1 = %3.3f, \t%3.3f\n', rad2deg(theta1));
    fprintf('Theta2 = %3.3f, \t%3.3f\n', rad2deg(theta2));
    fprintf('Theta3 = %3.3f, \t%3.3f\n', rad2deg(theta3));
else % senão 
    fprintf('O objetivo esta fora de alcance (fora da area de trabalho alcancavel) - nao existe solucao\n');
    return;
end