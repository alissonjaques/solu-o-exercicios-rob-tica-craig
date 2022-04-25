% Programa desenvolvido em MATLAB para a solução do
% exercício exercício para MATLAB 4 questão c.
% Autores: Alisson Jaques, Matheus Nogueira e Sillas Francisco

clc; clear;

% constantes 
grau = pi/180;
L1 = 4; L2 = 3; L3 = 2;

% Parametros de Denavit-Hatenberg
alp(1) = 0; a(1) = 0;  d(1) = 0; th(1) = 0; 
alp(2) = 0; a(2) = L1; d(2) = 0; th(2) = 0;
alp(3) = 0; a(3) = L2; d(3) = 0; th(3) = 0;

L{1} = link([alp(1),a(1), th(1),d(1),0], 'mod');  % Articulações R e convenção Craig DH
L{2} = link([alp(2),a(2), th(2),d(2),0], 'mod');
L(3) = link([alp(3),a(3), th(3),d(3),0], 'mod');
 
ThreeR = robot(L, 'Plan3R');      % Criando o robo planar 3R

TH3 = [1 0 0 L3;0 1 0 0;0 0 1 0;0 0 0 1];

TH0_1 = [1 0 0 9;0 1 0 0;0 0 1 0;0 0 0 1];
T30_1 = THO_1 * inv(TH3);
TH0_2 = [0.5 -0.866 0 7.5373;0.866 0.5 0 3.9266;0 0 1 0; 0 0 0 1];
T30_2 = TH0_2 * inv(TH3); 
TH0_3 = [0 1 0 -3;-1 0 0 2;0 0 1 0;0 0 0 1]; 	 
T30_3 = THO_3 * inv(TH3); 
TH0_4 = [0.866 0.50 -3.1245,-0.5 0.866 0 9.1674;0 0 1 0:0 0 0 1]; 
T30_4 = THO_4*inv(TH3);

% Cinematica inversa de postura 
M = [1 1 0 0 0 1];	%Mascara para movimento planar

%Guess1 = [0 0 0] * DR; 				% Para abaixar o ombro do manipulador
Guess1 = [90 -90 90]* DR; 				% Para subir o ombro do manipulador
Q1 = ikine (ThreeR, T30_1,Guess1, M); 
Q1D = Q1/DR

%Guess2 = [0 0 0]*DR;				 	% Para abaixar o ombro do manipulador
Guess 2 = [20 -10 50]*DR;				% Para subir o ombro do manipulador
Q2 = ikine(ThreeR, T30_2, Guess2, M); 
Q2D = Q2/DR

%Guess3 = [70 60 80]*DR;				% Para abaixar o ombro do manipulador
Guess3 = [150 -80 -150]*DR;				% Para subir o ombro do manipulador
Q3 = ikine(ThreeR, T30_3, Guess3, M);
Q3D = Q3/DR


Guess4 = [0 0 0] * DR; 
Q4 = ikine (ThreeR, T30_4, Guess4, M); 
Q4D = Q4/DR
