-- 앞에서 보았던 지도 색칠하기 문제를 하스켈을 이용해 풇어보라.

module Main where

generateColorTuples :: [String] -> [(String, String, String, String, String)]
generateColorTuples [] = []
generateColorTuples colors =
  [(a, b, c, d, e) | a <- colors, b <- colors, c <- colors, d <- colors, e <- colors]

isValidMapColor :: (String, String, String, String, String) -> Bool
isValidMapColor (alabama, mississippi, georgia, tennessee, florida)
  | mississippi == tennessee = False
  | mississippi == alabama = False
  | alabama == tennessee = False
  | alabama == mississippi = False
  | alabama == georgia = False
  | alabama == florida = False
  | georgia == florida = False
  | georgia == tennessee = False
  | otherwise = True

filterMapColor tuples = [tuple | tuple <- tuples, isValidMapColor tuple]


generateMessage (alabama, mississippi, georgia, tennessee, florida) =
  "Alabama: " ++ alabama ++ ", "
  ++ "Mississippi: " ++ mississippi ++ ", "
  ++ "Georgia: " ++ georgia ++ ", "
  ++ "Tennessee: " ++ tennessee ++ ", "
  ++ "Florida: " ++ florida

run = do
  let colors = ["red", "green", "blue"]
  map (\x -> generateMessage x) (filterMapColor (generateColorTuples colors))
