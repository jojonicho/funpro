import Data.Char

-- 1.
sumOfSquares :: [Integer] -> Integer
sumOfSquares = sum . map (^2)

-- 2.
triangular :: Integer -> Integer
triangular 0 = 0
triangular n = n + triangular (n - 1)

triangular2 :: Integer -> Integer
triangular2 n = n * (n + 1) `div` 2

-- 3.
power :: Integer -> Integer -> Integer
power x 0 = 1
power x exp = x * (power x (exp - 1))

-- 4.
removePunc :: String -> String
removePunc = filter (`notElem` ".,:;! ?\"'")

isPalindrome :: String -> Bool
isPalindrome s = t == reverse t
    where t = removePunc (map toLower s)

main :: IO ()
main = do
    print $ sumOfSquares [1,2,3]
    print $ triangular 5
    print $ power 3 2
    print $ isPalindrome "Madam, I'm Adam"