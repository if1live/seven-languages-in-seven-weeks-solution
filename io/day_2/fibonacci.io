# loop
fib := method(n,
    prev := 1
    curr := 1
    if(n <= 2, return 1)
    for(i, 3, n,
        next := curr + prev
        prev = curr
        curr = next
    )
    curr
)
fib(1) println
fib(4) println
fib(7) println

# loop - list
fib := method(n,
    fibList := list(0, 1, 1)
    i := 3
    while(i <= n,
        val := fibList at(i-1) + fibList at(i-2)
        fibList append(val)
        i = i + 1
    )
    fibList at(n)
)

fib(1) println
fib(4) println
fib(7) println

# recursice
fib := method(n, if(n <= 2, 1, fib(n-1) + fib(n-2)))

fib(1) println
fib(4) println
fib(7) println
