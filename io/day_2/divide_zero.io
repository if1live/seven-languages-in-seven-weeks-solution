# 만약 나누는 값이 0이면 0을 리턴하도록 연산자 /의 구현을 바꾸어보라.

# backup original divide method
OperatorTable addOperator("divide", 3)
Number divide := Number getSlot("/")
Number / := method(divider, if(divider == 0, 0, self divide(divider)))

(3 / 2) println
(3 / 0) println
