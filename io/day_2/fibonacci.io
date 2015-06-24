# 피보나치 수열은 1에서 시작한다.
# 수열의 다음 수는 언제나 앞에 존재하는 두 수의 합이다.
# 1, 1, 2, 3, 5, 8, 13, 21, 등등 이런 식이다.
# n번째 피보나치 수를 찾는 프로그램을 작성하라.
# 예를 들어 fib(1)은 1이고 fib(4)는 3이다.
# 보너스 점수를 받고 싶다면, 이 문제를 각각 재귀와 순차적 루프를 이용해서 풀어보라.

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
