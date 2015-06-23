minVal := 0
maxVal := 100
maxTryCount := 10

Quiz := Object clone
Quiz initialize := method(
    self solution := Random value(maxVal) roundDown
    self tryCount := 0
    self prevGuess := maxVal * 2
    self success := false
)

Quiz guess := method(num,
    if(num <= minVal, "out of range - min" println return)
    if(num > maxVal, "out of range - max" println return)

    self tryCount = self tryCount + 1
    ("try (" .. self tryCount .. "/" .. maxTryCount .. ")") println

    prevDiff := (self prevGuess - self solution) abs
    currDiff := (self num - self solution) abs
    self prevGuess = num

    if(prevDiff > currDiff, "good guess - " print, "bad guess - " print)

    if(num > self solution,
        "guess is bigger than solution" println
        return
    )

    if(num < self solution,
        "guess is smaller than solution" println
        return
    )

    # success
    self success = true
)

standardIO := File standardInput()
quiz := Quiz clone do (initialize)

while(quiz tryCount < maxTryCount,
    num := standardIO readLine asNumber
    quiz guess(num)
    if(quiz success, break)
)

if(quiz success,
    ("correct - solution is " .. quiz solution) println,
    ("fail - solution is " .. quiz solution) println
)
