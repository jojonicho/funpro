data Temp = Celcius Float | Fahrenheit Float | Kelvin Float
 deriving (Show, Eq)

toKelvin (Celcius c) = Kelvin (c + 273.15)
toKelvin (Fahrenheit f) = Kelvin ((f - 32) * 5/9 + 273.15)
-- try to comment out the below line and see what happens
toKelvin (Kelvin k) = Kelvin k

data Shape = Circle Float | Rectangle Float Float
 deriving (Show, Eq)

area :: Shape -> Float
area (Circle r) = pi * r ^ 2
area (Rectangle a b) = a * b

panjang :: [a] -> Int
panjang [] = 0
panjang (x:xs) = 1 + panjang xs

generatePair :: a -> a -> (a, a)
generatePair x y = (x, y)

concat2 :: [[a]] -> [a]
concat2 xss = [x | xs <- xss, x <- xs]

main :: IO ()
main = do
print $ toKelvin (Celcius 100)
print $ (Celcius 100)
print $ toKelvin (Kelvin 372)
print $ area (Circle 10)
print $ area (Rectangle 10 20)
print $ panjang (1:[2, 3])
print $ (1:[2, 3])
print $ ([1] ++ [2, 3])
print $ [x ^ 2 | x <- [1..10]]
print $ [x ^ 2 | x <- [1..10], x `mod` 2 == 0]
print $ generatePair 1 2
print $ concat2 [[1, 2, 3], [4, 5, 6]]
