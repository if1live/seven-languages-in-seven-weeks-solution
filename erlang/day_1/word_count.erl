% 문자열에서 어느 단어가 나타나는 횟수를 리턴하는 재귀 함수를 작성하라.

-module(word_count).
-export([main/0]).

main() ->
	Text = "foo bar spam, and foo",
	io:format("text: ~s~n", [Text]),
	io:format("foo: ~B~n", [word_count(Text, "foo")]),
	io:format("spam: ~B~n", [word_count(Text, "spam")]),
	io:format("o: ~B~n", [word_count(Text, "o")]).

word_count(Text, Word) ->
	word_count_r(Text, Word, Word).

word_count_r([], _, _) -> 0;

word_count_r(Text, [], Target) ->
	1 + word_count_r(Text, Target, Target);

word_count_r([FirstChar|TextTail], [FirstChar|WordTail], Target) ->
	word_count_r(TextTail, WordTail, Target);

word_count_r([_|TextTail], Word, Target) ->
	word_count_r(TextTail, Word, Target).
