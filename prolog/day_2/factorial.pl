factorial(1, 1).
factorial(Factorial, Num) :-
	PrevIndex is Num - 1,
	factorial(PrevFactorial, PrevIndex),
	Factorial is Num * PrevFactorial.

