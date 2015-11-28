-module(translate_service_monitor).
-export([doctor_loop/0, translate_loop/0, translate/2]).

translate_loop() ->
	receive
		{From, "casa"} ->
			From ! "house",
			translate_loop();
		{From, "blanca"} ->
			From ! "white",
			translate_loop();
		{From, _} ->
			From ! "I don't understand.",
			exit({translate_service_monitor, die, at, erlang:time()})
	end.

translate(To, Word) ->
	To ! {self(), Word},
	receive
		Translation ->
			Translation
	end.

doctor_loop() ->
	process_flag(trap_exit, true),
	receive
		new ->
			io:format("Creating and monitoring process.~n"),
			register(translator, spawn_link(fun translate_loop/0)),
			doctor_loop();
		{'EXIT', From, Reason} ->
			io:format("The translator ~p died with reason ~p.", [From, Reason]),
			io:format("Restarting. ~n"),
			self() ! new,
			doctor_loop()
	end.

% execute
% c(translate_service_monitor).
% Doctor = spawn(fun translate_service_monitor:doctor_loop/0).
% Doctor ! new.
% Translator = translator.
% translate_service_monitor:translate(Translator, "casa").
% translate_service_monitor:translate(Translator, "foo").
% [translate_service_monitor:translate(Translator, "blanca").
