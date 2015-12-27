-- 하스켈을 이용해 미로를 표현하라.
-- Maze 자료형과 Node 자료형이 필요할 것이다.
-- 주어진 좌표에 따라 하나의 노드를 리턴하는 함수도 필요하다.
-- 그렇게 리턴된 노드는 다른 노드로 넘어갈 수 있는 출구의 리스트를 담고 있어야한다.

-- 미로를 해결하기 위해 리스트 모나드를 사용하라.

module Main where

data Maze t = Maze [[t]] deriving (Show)
data Node p g = Node p p g deriving (Show, Eq)

nodeGetX (Node x y g) = x
nodeGetY (Node x y g) = y

mazeHeight (Maze grid) = length grid
mazeWidth (Maze grid) = length (head (take 1 grid))

mazeStartNode maze =
  let (node, succ) = head (filter (\(node, s) -> s) (mazeFindSpeialType maze gridTypeStart))
  in node

mazeFinishNode maze =
  let (node, succ) = head (filter (\(node, s) -> s) (mazeFindSpeialType maze gridTypeFinish))
  in node

mazeFindSpeialType maze gridType =
  do x <- [0..(mazeWidth maze)-1]; y <- [0..(mazeHeight maze)-1];
     let { node = getNode maze x y; (Node px py g) = node };
     if g == gridType
       then return (node, True)
       else return (node, False)


gridTypePath = 'x'
gridTypeWall = '.'
gridTypeStart = 'S'
gridTypeFinish = 'G'

accessGridType grid x y =
  let line = head (take 1 (drop y grid))
  in head (take 1 (drop x line))

gridType grid x y
  | x < 0 = gridTypeWall
  | x >= mazeWidth (Maze grid) = gridTypeWall
  | y < 0 = gridTypeWall
  | y >= mazeHeight (Maze grid) = gridTypeWall
  | otherwise = accessGridType grid x y

getNextNodes (Maze grid) x y =
  let up = Node x (y + 1) (gridType grid x (y + 1))
      right = Node (x + 1) y (gridType grid (x + 1) y)
      down = Node x (y - 1) (gridType grid x (y - 1))
      left = Node (x - 1) y (gridType grid (x - 1) y)
      allNodes = [up, right, down, left]
  in
    filter (\(Node x y g) -> g /= gridTypeWall) allNodes

getNode (Maze grid) x y = Node x y (gridType grid x y)

nodeExistInList [] node = False
nodeExistInList (h:t) node = (h == node) || (nodeExistInList t node)

calcVisitablNextNodes maze [] visitedList = []
calcVisitablNextNodes maze (h:t) visitedList
  | nodeExistInList visitedList h = calcVisitablNextNodes maze t visitedList
  | otherwise = [h] ++ calcVisitablNextNodes maze t visitedList

solveMaze_r :: Maze Char -> Node Int Char -> [Node Int Char] -> [Node Int Char] -> [Node Int Char]
solveMaze_r maze node [] visitedList =
  if node ==  (mazeFinishNode maze)
  then visitedList ++ [node]
  else []

solveMaze_r maze node (h:t) visitedList =
  let nextVisitedList = visitedList ++ [node]
  in if node == (mazeFinishNode maze)
     then nextVisitedList
     else
       (solveMaze_r maze h
        (calcVisitablNextNodes maze
         (getNextNodes maze (nodeGetX h) (nodeGetY h))
         nextVisitedList)
        nextVisitedList)
       ++
       (solveMaze_r maze node t visitedList)

solveMaze maze =
  let start = mazeStartNode maze
      node = start
      nextNodes = getNextNodes maze (nodeGetX node) (nodeGetY node)
      availNextNodes = calcVisitablNextNodes maze nextNodes []
  in solveMaze_r maze node availNextNodes []

representMaze = do
  print ("width: " ++ show (mazeWidth sampleMaze))
  print ("height: " ++ show (mazeHeight sampleMaze))
  print ("start node: " ++ show (mazeStartNode sampleMaze))
  print ("finish node: " ++ show (mazeFinishNode sampleMaze))

  print (getNextNodes sampleMaze 1 1)
  print (getNode sampleMaze 1 0)

run =
  solveMaze sampleMaze

-- example
exampleGrid =
 [
   ".S.xx",
   "xxxx.",
   "x..xG",
   "xxxx."
 ]

-- 어쩃든 굴러가는거. 방향을 맞춰둔거

sampleGrid =
  [
    "Sx.",
    ".x.",
    ".xG"
  ]

errorGrid =
  [
    "Sx.",
    ".x.",
    "Gxx"
  ]


--sampleMaze = Maze sampleGrid
--sampleMaze = Maze errorGrid
sampleMaze = Maze exampleGrid
