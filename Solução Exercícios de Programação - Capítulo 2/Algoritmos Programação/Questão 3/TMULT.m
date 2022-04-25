% Procedure TMULT (VAR brela, crelb, crela: frame);
% A função TMUL recebe como argumento duas matriz rotacionais,
% brela, B rotacionado em A, e crelb, C rotacionado em B, e retorna
% o produto das mesmas.Essa função resolve a situação problema 3 dos Exercícios
% de Programação Parte 2 do livro Robótica do Craig.
% Autores: Alisson Jaques, Matheus Nogueira Silva e Sillas Francisco
function crela = TMULT(brela,crelb) // % declara a função

% retornamos um matriz contendo a multiplicação de duas transformações:
crela = brela*crelb;