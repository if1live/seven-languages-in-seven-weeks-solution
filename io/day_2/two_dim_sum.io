data := list(list(1,2,3), list(4,5,6,7))

sum := method(data,
    retval := 0
    for(i, 0, (data size)-1, retval = retval + data at(i) sum)
)
sum(data) println
