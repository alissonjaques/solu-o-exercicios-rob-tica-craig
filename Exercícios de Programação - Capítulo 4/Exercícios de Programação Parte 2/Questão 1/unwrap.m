% A função intervalo recebe como argumento um ângulo
% e o retona no intervalo +/- pi
% Autores: Alisson Jaques, Matheus Nogueira e Sillas Francisco

function angulo = unwrap(angulo)

while (angulo > pi)
    angulo = angulo-2*pi;
end;

while (angulo < -pi)
    angulo = angulo+2*pi;
end;