-- 어릴 때 보았던 구구단 테이블을 만드는 리스트 컴프리헨션을 작성하라.
-- 테이블은 3차 튜플을 담고 있는 리스트이어야 한다.
-- 처음 두 개의 수는 1에서 12 사이에 있는 정수고 세번째는 두 수를 곱한 결과다.
-- how to execute
-- :load exam_gugu.hs
-- gugu

module Main where

gugu :: [(Integer, Integer, Integer)]
gugu = [(a, b, a*b) | a <- [1..12], b <- [1..12]]
