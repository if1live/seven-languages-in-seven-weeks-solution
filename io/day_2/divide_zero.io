# how to avoide recursive call?
OperatorTable addOperator("divide", 3)
Number divide := method(divider, if(divider == 0, 0, self / divider))
(3 divide(2)) println
(3 divide(0)) println
