all:
	make chores
	make factorial
	make movies
	make sizer
	make sizer_link_count

chores: chores.scala
	scala $^

factorial: factorial.scala
	scala $^

kids: kids.scala
	scala $^

movies: movies.scala
	scala $^

sizer: sizer.scala
	scala $^

sizer_link_count: sizer.scala
	scala $^ link_count

sizer_total_page_size: sizer.scala
	scala $^ total_page_size
