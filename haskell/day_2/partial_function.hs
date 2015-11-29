-- 주어진 수를 2로 나누는 부분함수와 임의의 문자열 끝에 \n를 덧붙이는 부분함수를 작성하라.

module Main where

divide n x = x / n
divide_2 = divide 2

attach_string after before = before ++ after
attach_newline = attach_string "\n"

run = do
  print(divide_2 10)
  print(attach_newline "hello")
