fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(1, 2).

/*
Index의 범위를 제한하지 않으면 모든 값을 얻으려고할때
무한반복이 발생한다
*/
fibonacci(Fibonacci, Index) :-
	Index >= 2,
	IndexPrev1 is Index - 1,
	IndexPrev2 is Index - 2,
	fibonacci(Prev1, IndexPrev1),
	fibonacci(Prev2, IndexPrev2),
	Fibonacci is Prev1 + Prev2.


