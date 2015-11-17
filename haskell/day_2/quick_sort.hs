-- 리스트를 받아들여 정렬된 리스트를 리턴하는 코드를 작성하라.
-- :load quick_sort.hs
-- quickSort [3, 1, 5, 2]

module Main where

quickSort [] = []
quickSort (pivot:t) =
  quickSort [x | x <- t, x < pivot]
  ++ [pivot] ++
  quickSort [x | x <- t, x > pivot]
