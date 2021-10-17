concat_ xss = [x | xs <- xss, x <- xs]

generatePair a b = [(x, y) | x <- [1 .. a], y <- [1 .. b]]

genap1 a = [x | x <- [1 .. a], x `mod` 2 == 0]

genap2 a = [x | x <- [2, 4 .. a]]

genap3 a = [x | x <- [1 .. a / 2]]

faktor a = [x | x <- [1 .. a], a `mod` x == 0]

-- pnya pak ade

simple n a b = n * (a + b)

ff a b c = a + b + c

gg = ff 5

sumList [] = 0
sumList (a : as) = a + sumList as

f1 x y = simple (x + y) x y

f0 x y = simple x y x

adaptor g y x = g x y x

f y = adaptor simple y

f2 x y = f1 (8 + x) y

--f3 = foldr (simple 5) 0 [1,2,3]

f4 x y = (simple x y) . (flip simple x y)

maksimum (a, b) = if a > b then a else b

maksCurry = curry maksimum

maks5 = maksCurry 5

--maks5 b = if 5>b then 5 else b

kurang (a, b) = a - b

kurangCurry = curry kurang

kurang3 = flip kurangCurry 3

tukeran f x y = f y x

kurang5 = tukeran kurangCurry 5

tukeran3 f a b c = f c b a

--f5 = foldr (curry maksimum) 0 [3,4,6,3,4,9,1,2]

-- kita akan pelajari foldr pekan 04 lebih mendalam

addPairwise :: Num a => [a] -> [a] -> [a]
addPairwise xs ys = map (uncurry (+)) (zip xs ys)

f6 = addPairwise [1, 2, 3] [4, 5, 6]

jumlah (a, b) = a + b

-- == map (uncurry (+)) (zip [1,2,3] [4,5,6])
-- == [(uncurry (+)) (1,4), (uncurry (+)) (2,5), (uncurry (+)) (3,6)]
-- == [(+) 1 4, (+) 2 5, (+) 3 6]
-- == [5, 7, 9]

squareArea side = 3.14 * side * side

--totalSquareArea sides    = sumList (map squareArea sides)
--totalSquareArea sides   = (sumList . map squareArea) sides
totalSquareArea = sumList . map squareArea

--

main :: IO ()
main = do
  print $ genap1 5
  print $ faktor 10
  print $ genap2 5
