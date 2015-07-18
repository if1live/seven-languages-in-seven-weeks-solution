-module(roulette).
-export([loop/0, main/0]).

% send a number, 1-6
loop() ->
	receive
		3 ->
			io:format("bang.~n"),
			exit({roulette, dit, at, erlang:time()});
		_ ->
			io:format("click~n"),
			loop()
	end.

main() ->
	Gun = spawn(fun loop/0),
	Gun ! 1,
	io:format("~s~n", [erlang:is_process_alive(Gun)]),
	Gun ! 3,
	io:format("~s~n", [erlang:is_process_alive(Gun)]),
	Gun ! 4,
	io:format("~s~n", [erlang:is_process_alive(Gun)]),
	Gun ! 1.
