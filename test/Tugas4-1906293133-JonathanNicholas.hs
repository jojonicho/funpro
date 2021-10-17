-- 1.
length' :: [a] -> Int
length' = foldr (\_ acc -> 1 + acc) 0

-- 2. diminta filter dulu baru map
greaterZero :: Int -> Bool -- jadi greater zero karena filter dulu baru map
greaterZero n = n > 0

addUp :: [Int] -> [Int]
addUp xs = map (+ 1) (filter greaterZero xs)

-- 3.
sum' :: (Num a) => [a] -> a
sum' = foldr (+) 0

sumOfSquares1 :: Int -> Int
sumOfSquares1 n = sum' (map (^ 2) [1 .. n])

sumOfSquares2 :: Int -> Int
sumOfSquares2 n = sum' [x ^ 2 | x <- [1 .. n]]

-- 4.
multipleOf5 :: [Int] -> Int
multipleOf5 = foldr (\x acc -> if x `mod` 5 == 0 then 1 + acc else acc) 0

-- 5.
total :: (Int -> Int) -> (Int -> Int)
total f x = sum' (map f [0 .. x])

-- 6.
reverse' :: [a] -> [a]
reverse' = foldr (\x acc -> acc ++ [x]) []

-- -- 8.
-- pythaTriple :: [(Integer, Integer, Integer)]
-- pythaTriple = [(x, y, z) | z <- [1 ..], y <- [1 .. z], x <- [1 .. z], x ^ 2 + y ^ 2 == z ^ 2, x < y]

-- 8.
noUpperAndIdent :: String -> String
noUpperAndIdent = foldr (\x acc -> if x >= 'a' && x <= 'z' then x : acc else acc) []

-- 9. tree data structure
data Tree a = Leaf a | Node (Tree a) (Tree a) deriving (Show)

-- 10.
foldTree :: Num p => t -> Tree p -> p
foldTree f (Leaf x) = x
foldTree f (Node l r) = foldTree f l + foldTree f r

main :: IO ()
main = do
  print $ length' [1, 2, 3, 4, 5]

  print $ addUp [0, 1, 2, 3]

  print $ sumOfSquares1 3
  print $ sumOfSquares2 3

  print $ multipleOf5 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  print $ total (+ 1) 3

  print $ reverse' [1, 2, 3, 4, 5]

  print $ noUpperAndIdent "FunPro MOOC"

  print $ foldTree (+) (Node (Leaf 64) (Node (Leaf 2) (Leaf 3)))
