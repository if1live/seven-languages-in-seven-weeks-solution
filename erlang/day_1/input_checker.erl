% 패턴 매칭을 이용해 입력이 {error, Message}인지 success인지에 따라서 화면에 "success" 혹은
% "error: message"를 출력하는 함수를 작성하라.

-module(input_checker).
-export([main/0]).

main() ->
	input_checker(success),
	input_checker({error, message}).

input_checker(success) ->
	io:fwrite("success\n");
input_checker({error, Message}) ->
	io:format("error: ~s\n", [Message]),
	io:fwrite("\n").
