# 대괄호를 사용하는 리스트 문법을 만들어보라.

squareBrackets := method(
    l := List clone
    call message arguments foreach(arg, l append(arg))
    l
)
data := [1, 2, 3]
data println
