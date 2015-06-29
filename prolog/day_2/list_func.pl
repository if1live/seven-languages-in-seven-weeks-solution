/* 리스트에 있는 요소의 순서를 바꾸어보라 */
find([Head|Tail], 0, Output, BeforeList, AfterList) :-
	Output = Head,
	BeforeList = [],
	AfterList = Tail.

find([Head|Tail], Counter, Output, BeforeList, AfterList) :-
	Counter > 0,
	NextCounter is Counter - 1,
	append([Head], NextBeforeList, BeforeList),
	find(Tail, NextCounter, Output, NextBeforeList, AfterList).

swap(List, IndexA, IndexA, List).

swap(List, IndexA, IndexB, Output) :-
	IndexA > IndexB,
	swap(List, IndexB, IndexA, Output).

swap(List, IndexA, IndexB, Output) :-
	IndexA < IndexB,
	find(List, IndexA, ElemA, ListA, ListBC),
	find(ListBC, IndexB - IndexA - 1, ElemB, ListB, ListC),

	append(ListA, [ElemB], TmpListA),
	append(TmpListA, ListB, TmpListB),
	append(TmpListB, [ElemA], TmpListC),
	append(TmpListC, ListC, Output).


/* 리스트에 있는 요소 중 값이 가장 작은 것을 찾으라. */
min([], 999999).

min([Head|Tail], Head) :-
	min(Tail, TailMin),
	Head < TailMin.

min([Head|Tail], TailMin) :-
	min(Tail, TailMin),
	Head > TailMin.

/* 리스트의 요소들의 크기를 순서로 정렬하라. */
final_and_rest([A], A, []).
final_and_rest([A, Final], Final, [A]).
final_and_rest([Head|Tail], Final, Rest) :-
	final_and_rest(Tail, SubFinal, SubRest),
	Final = SubFinal,
	append([Head], SubRest, Rest).


bubble_sort_iter_core([], []).
bubble_sort_iter_core([A], [A]).
bubble_sort_iter_core([Head1, Head2|Tail], Solution) :-
	Head1 > Head2,
	bubble_sort_iter_core([Head2|Tail], SubSolution),
	append([Head1], SubSolution, Solution).

bubble_sort_iter_core([Head1, Head2|Tail], Solution) :-
	Head1 =< Head2,
	bubble_sort_iter_core([Head1|Tail], SubSolution),
	append([Head2], SubSolution, Solution).


bubble_sort_iter(List, Head, Tail) :-
	bubble_sort_iter_core(List, TmpList),
	final_and_rest(TmpList, Head, Tail).

my_bubble_sort([], []).
my_bubble_sort([A], [A]) :- A.
my_bubble_sort([A, B], [A, B]) :- A < B.
my_bubble_sort([A, B], [B, A]) :- A > B.

my_bubble_sort(List, Solution) :-
	bubble_sort_iter(List, Head, Tail),
	my_bubble_sort(Tail, TailSolution),
	append([Head], TailSolution, Solution).

/* bubble_sort([7, 6, 5, 3, 9, 4, 1, 2, 10, 13, 12, 11, 8, 14], Sol). */

/* http://kti.ms.mff.cuni.cz/~bartak/prolog/sorting.html */
bubble_sort(List,Sorted) :-
	b_sort(List,[],Sorted).
b_sort([],Acc,Acc).
b_sort([H|T],Acc,Sorted) :-
	bubble(H,T,NT,Max),
	b_sort(NT,[Max|Acc],Sorted).

bubble(X,[],[],X).
bubble(X,[Y|T],[Y|NT],Max) :-
	X > Y,
	bubble(X,T,NT,Max).
bubble(X,[Y|T],[X|NT],Max) :-
	X =< Y,
	bubble(Y,T,NT,Max).
