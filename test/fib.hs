-- import Data.List (scanl1)

fib :: [Integer]
fib = 0 : 1 : zipWith (+) fib (tail fib)

getFib :: String -> Integer
getFib = last . flip take fib . (+ 1) . read

main :: IO ()
-- mindblown
-- Prelude> ((+1) . read) "123"
-- 124

-- Prelude> bob = map ( show . (+1) . read  ) . lines
-- Prelude> bob "1\n2\n3"
-- ["2","3","4"]

-- g.f = g(f(x))
-- tail removes the number of test cases
main = getContents >>= putStrLn . unlines . map (show . (`mod` (10 ^ 8 + 7)) . getFib) . (tail . lines)

-- main = getContents >>= putStrLn . unlines . map (show . (`mod` (10 ^ 8 + 7)) . (last . flip take fib . (+ 1) . read)) . lines

-- main = getContents >>= putStrLn . unlines . map (show) . lines

-- main = getContents >>= putStrLn . unlines . map (show . last . flip take fib . (+ 1) . read) . tail . lines

-- (+ 1) buat dapet bilangan fib ke n+1
-- perhatikan g . f -> g (f x)
-- main = getContents >>= putStrLn . unlines . map (show . last . flip take fib . (+ 2) . read) . tail . lines

-- main = getContents >>= putStrLn . unlines . map (show . last . flip take fib . (+ 1) . read) . tail . lines

-- main = do
--   -- print $ 3 `choose` 2
--   print $ map (take 10) pascals