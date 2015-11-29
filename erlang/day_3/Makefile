all: translate translate_service roulette

translate:
	erl -compile translate.erl
	erl -noshell -s translate main -s init stop

translate_service:
	erl -compile translate_service.erl
	erl -noshell -s translate_service main -s init stop

roulette:
	erl -compile roulette.erl
	erl -noshell -s roulette main -s init stop

translate_service_monitor:
	erl -compile translate_service_monitor.erl
	erl -noshell -s translate_service_monitor main -s init stop

clean:
	rm -rf *.beam
