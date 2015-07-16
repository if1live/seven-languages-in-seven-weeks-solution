all: word_count recursive_number_count input_checker

word_count:
	erl -compile word_count.erl &&\
	erl -noshell -s word_count main -s init stop

recursive_number_count:
	erl -compile recursive_number_count.erl &&\
	erl -noshell -s recursive_number_count main -s init stop

input_checker:
	erl -compile input_checker.erl &&\
	erl -noshell -s input_checker main -s init stop
