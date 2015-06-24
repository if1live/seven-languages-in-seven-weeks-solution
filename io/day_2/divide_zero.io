# 만약 나누는 값이 0이면 0을 리턴하도록 연산자 /의 구현을 바꾸어보라.
# how to avoide recursive call?
OperatorTable addOperator("divide", 3)
Number divide := method(divider, if(divider == 0, 0, self / divider))
(3 divide(2)) println
(3 divide(0)) println
