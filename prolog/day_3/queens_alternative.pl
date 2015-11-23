/*
퀸의 목록을 입력으로 받아 8 퀸 문제를 해결하라.
 튜플을 이용하지 말고 1에서 8 사이의 수를 이용해서 각 퀸을 나타내라.
리스트 안에서의 위치에 따라서 퀸의 행을 판단하고 리스트 안에서의 값을 이용해서 열을 판단하라.
*/

/*
['queens_alternative'].
eight_queens(Board).
*/

valid_col(Col) :-
	Range = [1, 2, 3, 4, 5, 6, 7, 8],
	member(Col, Range).

valid_cols([]).
valid_cols([Head|Tail]) :-
	valid_col(Head), valid_cols(Tail).

diags1([], []).
diags1([Col|ColTail], [Diagonal|DiagonalTail]) :-
	length([Col|ColTail], Length),
	Row is 8 - Length + 1,
	Diagonal is Row + Col,
	diags1(ColTail, DiagonalTail).

diags2([], []).
diags2([Col|ColTail], [Diagonal|DiagonalTail]) :-
	length([Col|ColTail], Length),
	Row is 8 - Length + 1,
	Diagonal is Row - Col,
	diags2(ColTail, DiagonalTail).


eight_queens(Cols) :-
	Cols = [C1, C2, C3, C4, C5, C6, C7, C8],
	valid_cols(Cols),

	diags1(Cols, Diags1),
	diags2(Cols, Diags2),

	fd_all_different(Diags1),
	fd_all_different(Diags2),
	fd_all_different(Cols).
