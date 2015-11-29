-- 문자열을 수로 변환하는 하스켈 함수를 작성하라.
-- 문자열은 $2,345,678.99과 같은 형태를 가지고 있어야 하며, 첫머리가 0일 수도 있다.

module Main where

pow order
  | order > 0 = 10 * pow(order - 1)
  | order < 0 = pow(order + 1) / 10
  | order == 0 = 1

charToInt ch
  | ch == '0' = 0
  | ch == '1' = 1
  | ch == '2' = 2
  | ch == '3' = 3
  | ch == '4' = 4
  | ch == '5' = 5
  | ch == '6' = 6
  | ch == '7' = 7
  | ch == '8' = 8
  | ch == '9' = 9

-- parseIntCore
-- mode = 1 : xxx.
-- mode = 0 : .xxx

parseIntCore [] curr counter mode = curr

-- 0으로 시작하는 경우
parseIntCore ('0':t) 0 counter 1 = parseIntCore t 0 counter 1

-- 소수점 윗자리
parseIntCore (h:t) curr counter 1
  | h >= '0' && h <= '9' = parseIntCore t (curr * 10 + (charToInt h))
                           (counter + 1) 1
  | h == '.' = parseIntCore t curr 1 0
  | otherwise = parseIntCore t curr counter 1

-- 소수점 아래자리
parseIntCore (h:t) curr counter 0
  | h >= '0' && h <= '9' = parseIntCore t (curr + (pow (-counter)) * (charToInt h))
                           (counter + 1) 0
  | otherwise = parseIntCore t curr counter 0

parseInt str = parseIntCore str 0 0 1

run = do
  print(parseInt "$2,345,678.99")
  print(parseInt "$02,345,678.99")
