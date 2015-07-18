-module(translate).
-export([loop/0, main/0]).

loop() ->
	receive
		"casa" ->
			io:format("house~n"),
			loop();
		"blanca" ->
			io:format("white~n"),
			loop();
		_ ->
			io:format("I don't understand. ~n"),
			loop()
	end.

main() ->
	Pid = spawn(fun loop/0),
	Pid ! "casa",
	Pid ! "blanca",
	Pid ! "loca".
