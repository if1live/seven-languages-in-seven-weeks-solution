# 2차원 배열에 담긴 수의 값을 모두 더하는 프로그램을 작성해보라.

data := list(list(1,2,3), list(4,5,6,7))

sum := method(data,
    retval := 0
    for(i, 0, (data size)-1, retval = retval + data at(i) sum)
)
sum(data) println

"EOF"
