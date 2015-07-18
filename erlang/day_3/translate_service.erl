-module(translate_service).
-export([loop/0, translate/2, main/0]).

loop() ->
	receive
		{From, "casa"} ->
			From ! "house",
			loop();
		{From, "blanca"} ->
			From ! "white",
			loop();
		{From, _} ->
			From ! "I don't understand.",
			loop()
	end.

translate(To, Word) ->
	To ! {self(), Word},
	receive
		Translation ->
			Translation
	end.

main() ->
	Translator = spawn(fun loop/0),
	io:format("~s~n", [translate(Translator, "blanca")]),
	io:format("~s~n", [translate(Translator, "casa")]),
	io:format("~s~n", [translate(Translator, "foo")]).
