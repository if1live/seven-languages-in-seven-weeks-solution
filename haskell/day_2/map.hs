-- :load map.hs
-- squareAll [1, 2, 3]

module Main where

squareAll list = map square list
                 where square x = x * x
