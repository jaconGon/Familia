% arvore genealogica
% a relaçao alguma_coisa(X,Y) 
% eh lida como:alguma coisa de x é y
% ex: pai(X,Y) -> o pai de x eh y

% terceira geracao -------------------
pai(leonardo,alessandro).
pai(carolina,alessandro).
pai(leandro,alessandro).
pai(yhara,wagner).
pai(fabricio,renato).
pai(silvia,renato).

% segunda geracao ------------------
pai(wagner,otavio).
pai(sandra,otavio).
pai(alessandro,joao).
pai(andrea,joao).

% primeira geracao-----------------
pai(otavio,agenor).
pai(fatima,jose).
pai(joao,joaquim).
pai(antonieta,marcos).

% terceira geracao -------------------
mae(leonardo,sandra).
mae(carolina,sandra).
mae(leandro,sandra).
mae(yhara,deolane).
mae(fabricio,andrea).
mae(silvia,andrea).


% segunda geracao---------------
mae(wagner,antonieta).
mae(sandra,antonieta).
mae(alessandro,fatima).
mae(andrea,fatima).

% primeira geracaoo----------------
mae(otavio,maria).
mae(fatima,amelia).
mae(joao,ana).
mae(antonieta,josilda).

% Regras--------------------------

% acha o filho de X
filho(X,Y):- pai(Y,X) ; mae(Y,X).

% de fine casamento como sendo um casal com mesmo filho
casado(X,Y):- filho(X,A),filho(Y,A),X\=Y,!.

% acha os bisavos paternos e maternos, e une o resultado para consulta
bisavoP(X,Y):- pai(A,Y) , avoP(X,A);  mae(A,Y) , avoP(X,A).
bisavoM(X,Y):- pai(A,Y) , avoM(X,A);  mae(A,Y) , avoM(X,A).
bisavo(X,Y):- bisavoP(X,Y) ; bisavoM(X,Y).

% acha avos paternos e materno e une os resultados para consulta
avoP(X,Y):- pai(X,A),pai(A,Y);pai(X,A),mae(A,Y).
avoM(X,Y):- mae(X,A),pai(A,Y);mae(X,A),mae(A,Y).
avo(X,Y):- avoP(X,Y) ; avoM(X,Y).

% acha os tios de sangue e agregados e une as respostas para consulta
tioS(X,Y):- irmao(Y,A) , pai(X,A) ; irmao(Y,B) , mae(X,B).
tioA(X,Y):- tioS(X,A) , casado(A,Y).
tio(X,Y):- tioA(X,Y) ; tioS(X,Y).

% acha neto de x
neto(X,Y):- avoP(Y,X) ; avoM(Y,X).

% acha primo de x
primo(X,Y):-pai(Y,A),irmao(A,B),pai(X,B) ; pai(Y,A),irmao(A,B),mae(X,B) ; mae(Y,A),irmao(A,B),pai(X,B) ;
mae(Y,A),irmao(A,B),mae(X,B).

% acha irmao de x
irmao(X,Y):- pai(X,A) , pai(Y,A) , mae(X,B) , mae(Y,B),X\=Y.