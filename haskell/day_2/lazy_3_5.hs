-- x 라는 인수를 취한 다음, x에서 시작해서 1씩 증가하면서 3번쨰에 해당하는 수만 담는
-- 게으른 시퀀스를 리너하는 함수를 작성하라.
-- 그다음에는 y에서 시작해서 5번째에 해당하는 수만 담는 시퀀스를 리턴하는 함수를 작성하라.
-- x + y에서 시작해서 8번쨰에 해당하는 수만 담는 시퀀스를 리턴하기 위해서
-- 두 시퀀스를 합성하는 함수를 작성하라

module Main where

lazyIncrementSequence x = x:(lazyIncrementSequence (x + 1))
pickNumber x inc = drop (inc) (take (inc + 1) (lazyIncrementSequence x))
lazyThree x = pickNumber x 3
lazyFive x = pickNumber x 5

sumListElement [] [] = []
sumListElement (h1:t1) (h2:t2) = (h1+h2):(sumListElement t1 t2)

lazyThreeAndFive x y = sumListElement (lazyThree x) (lazyFive y)

run = do
  lazyThreeAndFive 1 3
