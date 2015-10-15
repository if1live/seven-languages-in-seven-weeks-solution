-- 검정색, 흰색, 파란색, 노란색, 빨간색 중에서 두 개를 뽑아서 만들 수 있는
-- 모든 가능한 조합을 담는 2차 튜플을 만드는 함수를 작성하라.
-- 이때 (검정색, 파란색)과 (파란색, 검정색) 중 하나만 포함하도록 만들어야 함에 유의하라

module Main where

generateColorTuples :: [String] -> [(String, String)]
generateColorTuples [] = []
generateColorTuples colors = [(a, b) | a <- colors, b <- colors, a < b && a /= b]

run = do
  let colors = ["black", "white", "blue", "yellow", "red"]
  generateColorTuples colors
