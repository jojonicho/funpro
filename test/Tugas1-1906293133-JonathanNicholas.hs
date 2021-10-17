-- 1.
circleArea :: Double -> Double
circleArea r =
    let pi = 3.14
    in pi * r ^ 2

-- 2.
isTriangle :: Integer -> Integer -> Integer -> Bool
isTriangle a b c = a + b > c && a + c > b && b + c > a

-- 3.
listSum :: [Integer] -> Integer
listSum [] = 0
listSum (x:xs) = x + listSum xs

-- 4.
listSumArea :: [Double] -> Double
listSumArea [] = 0
listSumArea (x:xs) = x + listSumArea xs

-- 5.
reverseList :: [Integer] -> [Integer]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

-- 6.
quicksort :: [Integer] -> [Integer]
quicksort [] = []
quicksort (x:xs) = quicksort [y | y <- xs, y < x] ++ [x] ++ [y | y <- xs, y >= x]

main :: IO ()
main = do
    print $ circleArea 69
    print $ isTriangle 2 3 4
    print $ listSum [2, 3, 4]
    print $ listSumArea [circleArea 2, circleArea 3, circleArea 4]
    print $ reverseList [1, 2, 3, 4]
    print $ quicksort [4,1,5,6,1,3]