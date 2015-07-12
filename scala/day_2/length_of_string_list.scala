// foldLeft를 이용하려 문자열 리스트의 전체 크기를 계산하라.
val words = List("Hello", "World", "foo", "bar", "spam")

// syntax 1
val retval = (0 /: words) {(sum, word) => sum + word.length}
println(retval)

// syntax 2
val retval_2 = words.foldLeft(0)((sum, word) => sum + word.length)
println(retval_2)
