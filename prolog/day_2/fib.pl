fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(1, 2).

fibonacci(Fibonacci, Index) :-
	IndexPrev1 is Index - 1,
	IndexPrev2 is Index - 2,
	fibonacci(Prev1, IndexPrev1),
	fibonacci(Prev2, IndexPrev2),
	Fibonacci is Prev1 + Prev2.


