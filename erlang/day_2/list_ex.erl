-module(list_ex).
-export([main/0, main_ex1/0, main_ex2/0]).

% [{erlang, "a functional language"}, {ruby, "an OO language"}]
% 처럼 키워드와 값으로 이루어진 튜플을 담은 리스트를 생각해보라.
% 이러한 리스트와 하나의 키워드를 인수로 받아들인 다음
% 해당 키워드와 묶여있는 값을 리턴하는 함수를 작성하라
main_ex1() ->
	Data = [{erlang, "a functional language"},
			{ruby, "an OO language"}],
	Keyword = dummy,
	ex1_func(Data, Keyword).

ex1_func(LanguageList, Keyword) ->
	[{Name, Desc, Keyword} || {Name, Desc} <- LanguageList].

main_ex2() ->
	Cart = [{pencil, 4, 0.25},
			{pen, 1, 1.20},
			{paper, 2, 0.20}],
	product_price(Cart).

product_price(Cart) ->
	[{Item, Quantity * Price} || {Item, Quantity, Price} <- Cart].

main() ->
	main_ex1(),
	main_ex2().
