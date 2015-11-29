% 보너스 문제: 틱택토 보드를 리스트나 혹은 9개의 요스를 갖는 튜플로 받아들이는 프로그램을 작성하라.
% 승자가 결정되면 승자(x 또는 o)를 리턴하고, 무승부면 cat를 리턴하고,
% 게임이 계속 진행될 수 있지만 아직 승자가 결정되지 않은 상태라면 no_winner를 리턴하라.
-module(ttt).
-export([main/0,
		 lines/1]).

board_check({A1, A2, A3, B1, B2, B3, C1, C2, C3}) ->
	Map = [A1, A2, A3, B1, B2, B3, C1, C2, C3],
	EmptyExist = lists:any(fun(X) -> X == e end, Map),

	Lines = lines({A1, A2, A3, B1, B2, B3, C1, C2, C3}),

	CheckWinnerO = fun(Line) -> Line == [o,o,o] end,
	CheckWinnerX = fun(Line) -> Line == [x,x,x] end,

	WinnerX = lists:any(CheckWinnerX, Lines),
	WinnerO = lists:any(CheckWinnerO, Lines),

	if
		WinnerO == true ->
			winner_o;
		WinnerX == true ->
			winner_x;
		EmptyExist == true ->
			no_winner;
		true -> cat
	end.

lines({A1, A2, A3, B1, B2, B3, C1, C2, C3}) ->
	Row1 = [A1, A2, A3],
	Row2 = [B1, B2, B3],
	Row3 = [C1, C2, C3],
	Col1 = [A1, B1, C1],
	Col2 = [A2, B2, C2],
	Col3 = [A3, B3, C3],
	Cross1 = [A1, B2, C3],
	Cross2 = [A3, B2, C1],
	[Row1, Row2, Row3,
	 Col1, Col2, Col3,
	 Cross1, Cross2].


main() ->
	io:format("~s~n", [(board_check({e, e, e,
									 e, e, e,
									 e, e, e}))]),

	io:format("~s~n", [board_check({o, o, o,
									x, x, e,
									e, e, e})]),

	io:format("~s~n", [board_check({o, o, e,
									x, x, x,
									e, e, e})]),

	io:format("~s~n", [board_check({o, o, x,
									x, x, o,
									o, o, x})]).
