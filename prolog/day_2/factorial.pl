factorial(1, 1).

factorial(Factorial, Num) :-
	Num < 1,
	Factorial = 0.

factorial(Factorial, Num) :-
	Num > 1,
	PrevIndex is Num - 1,
	factorial(PrevFactorial, PrevIndex),
	Factorial is Num * PrevFactorial.

