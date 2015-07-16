% 10까지 세기 위해 재귀를 사용하는 함수를 작성하라.

-module(recursive_number_count).
-export([main/0]).

main() -> number_count(1).

number_count(10) -> io:format("~B~n", [10]);
number_count(N) ->
	io:format("~B~n", [N]),
	number_count(N + 1).
