parseInts :: String -> [Int]
parseInts str = map read (words str)

nck :: Int -> Int -> Int
nck = loop 1 1
  where
    loop rn rd _ 0 = rn `div` rd
    loop _ _ 0 _ = 0
    loop rn rd n k = loop (rn * n) (rd * k) (n -1) (k -1)

solve 0 = return ()
solve t = do
  nums <- fmap parseInts getLine
  let n = last (reverse nums)
  let k = last nums
  let ans = nck n k
  print ans
  solve (t -1)

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n -1)

choose :: Integer -> Integer -> Integer
n `choose` k
  | k < 0 = 0
  | k > n = 0
  | otherwise = factorial n `div` (factorial k * factorial (n - k))

bob str = (words) str

bob2 str = map read (words str)

getNck :: [Char] -> Integer
getNck str = n `choose` k
  where
    [n, k] = map read (words str)

parseTestcase :: String -> [String]
parseTestcase = tail . lines

main :: IO ()
main = getContents >>= putStrLn . unlines . map (show . (`mod` (10 ^ 8 + 7)) . getNck) . parseTestcase