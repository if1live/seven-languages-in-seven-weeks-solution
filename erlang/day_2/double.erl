-module(double).
-export([double_all/1, main/0]).

double_all([]) ->
	[];
double_all([First|Rest]) ->
	[First + First | double_all(Rest)].

printList_r([]) -> _ = 1;
printList_r([H]) ->
	io:format("~p", [H]);
printList_r([H|T]) ->
	io:format("~p,", [H]),
	printList_r(T).

printList(List) ->
	io:fwrite("["),
	printList_r(List),
	% lists:map(fun(X) -> io:format("~p,", [X]) end, List),
	io:fwrite("]~n").

main() ->
	Retval = double:double_all([1,2,3]),
	printList(Retval).
