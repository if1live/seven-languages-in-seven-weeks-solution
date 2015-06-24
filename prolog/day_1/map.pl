different(red, green).
different(red, blue).
different(green, red).
different(green, blue).
different(blue, red).
different(blue, green).

coloring(Alabama, Mississippi, Georgia, Tennessee, Florida) :-
	different(Mississippi, Tennessee),
	different(Mississippi, Alabama),
	different(Alabama, Mississippi),
	different(Alabama, Tennessee),
	different(Alabama, Georgia),
	different(Alabama, Florida),
	different(Georgia, Tennessee),
	different(Georgia, Alabama),
	different(Georgia, Florida),
	different(Tennessee, Mississippi),
	different(Tennessee, Alabama),
	different(Tennessee, Georgia),
	different(Florida, Alabama),
	different(Florida, Georgia).

			 
