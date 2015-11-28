-module(two_doctor).
-export([loop/1, create_doctors/0]).

create_doctors() ->
	DoctorA = spawn(two_doctor, loop, [doctor_a]),
	DoctorB = spawn(two_doctor, loop, [doctor_b]),
	DoctorA ! {monitor, DoctorB},
	DoctorB ! {monitor, DoctorA},
	register(doctor_a, DoctorA),
	register(doctor_b, DoctorB),
	{DoctorA, DoctorB}.

loop(Name) ->
	process_flag(trap_exit, true),
	receive
		die ->
			io:format("suicide ~p ~p.~n", [Name, self()]),
			exit({Name, die, at, erlang:time()});

		{monitor, Process} ->
			link(Process),
			io:format("Monitoring doctor=~p.~n", [Process]),
			loop(Name);

		{'EXIT', _From, Reason} ->
			{Who, _Die, _At, _Time} = Reason,
			io:format("~p ~p catch ~p's death~n", [Name, self(), Who]),
			io:format("Restarting ~p. ~n", [Who]),
			Doctor = spawn(two_doctor, loop, [Who]),
			self() ! {monitor, Doctor},
			register(Who, Doctor),
			loop(Name)
	end.

% execute
% c(two_doctor).
% {A, B} = two_doctor:create_doctors().
% doctor_a ! die.
% doctor_b ! die.
