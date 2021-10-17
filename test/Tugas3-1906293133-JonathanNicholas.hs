-- 1.
myCurry :: ((a, b) -> c) -> a -> b -> c
myCurry f x y = f (x, y)

myUncurry :: (a -> b -> c) -> ((a, b) -> c)
myUncurry f (x, y) = f x y

-- 2.
fibonacci :: Integer -> [Integer]
fibonacci 0 = [0]
fibonacci 1 = [0, 1]
fibonacci n = fibonacci (n -1) ++ [last (fibonacci (n -1)) + last (fibonacci (n -2))]

-- 3.
myMult :: Integer -> Integer -> Integer
myMult x y = if y == 0 then 0 else x + myMult x (y -1)

power :: Integer -> Integer -> Integer
power x 0 = 1
power x exp = myMult x (power x (exp - 1))

-- 4.
sumEven :: [Integer] -> Integer
sumEven [] = 0
sumEven (x : xs) = if even x then x + sumEven xs else sumEven xs

-- 5.
toDouble :: Integer -> Double
toDouble x = fromIntegral x :: Double

invest_ :: Integer -> Double -> Integer -> Double
invest_ nominal percentage 0 = toDouble nominal
invest_ nominal percentage duration = invest_ nominal percentage (duration - 1) * (1 + percentage / 100) + toDouble nominal

invest :: Integer -> Double -> Integer -> Double
invest nominal percentage duration = invest_ nominal percentage duration - toDouble nominal

main :: IO ()
main = do
  print $ myUncurry (+) (2, 3)
  print $ fibonacci 4
  print $ power 3 2
  print $ sumEven [1 .. 6]
  print $ invest 100000 0.3 2