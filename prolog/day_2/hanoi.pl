/* https://www.cpp.edu/~jrfisher/www/prolog_tutorial/2_3.html */
/* 하노이의 탑을 구현한 코드. 그것은 어떻게 동작하는가? */

move(1,X,Y,_) :-
	write('Move top disk from '),
	write(X),
	write(' to '),
	write(Y),
	nl.

move(N,X,Y,Z) :-
	N>1,
	M is N-1,
	move(M,X,Z,Y),
	move(1,X,Y,_),
	move(M,Z,Y,X).
