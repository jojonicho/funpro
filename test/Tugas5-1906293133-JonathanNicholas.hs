-- 1
sieve :: Integral a => [a] -> [a]
sieve [] = []
sieve (p : xs) = p : sieve [x | x <- xs, x `mod` p > 0]

-- 2.
segitigaSiku :: [(Integer, Integer, Integer)]
segitigaSiku = [(x, y, z) | z <- [1 ..], y <- [1 .. z], x <- [1 .. z], x ^ 2 + y ^ 2 == z ^ 2, x < y]

-- 3.
jumlahBerlanjut :: [Int] -> [Int]
jumlahBerlanjut [] = []
jumlahBerlanjut arr = 0 : zipWith (+) (jumlahBerlanjut arr) arr -- mirip fibo
-- [1, 2, 3] = [0, 1, 1+2, 1+2+3]
-- [1, 2, 3] = [0, 1, 2, 3]
--            + [0, 0, 1, 2, 3]

-- 4. coret coret hamm, salah ternyata
-- primeFactors :: Int -> [Int]
-- primeFactors 1 = []
-- primeFactors n = p : primeFactors (n `div` p)
--   where
--     p = head [x | x <- [2 ..], n `mod` x == 0]

-- hamm = [x | x <- [1 ..], length (primeFactors x) <= 5]

-- ## itu kyk placeholder buat comparator
-- # itu namanya magic hash, jadi biar ga tabrakan
hamm :: [Integer]
hamm = 1 : map (2 *) hamm ## (map (3 *) hamm ## map (5 *) hamm)
  where
    (x : xs) ## (y : ys) = case compare x y of
      LT -> x : xs ## (y : ys)
      GT -> y : (x : xs) ## ys
      EQ -> x : xs ## ys -- cegah infinite loop dan duplikasi

-- 5.
coeff :: Num a => [a] -> [a]
coeff arr = [1] ++ zipWith (+) arr (tail arr) ++ [1]

-- [1] ++ ([1, 1] + [1]) ++ [1] = [1] ++ [2] ++ [1] = [1, 2, 1]
-- [1] ++ ([1,2,1] + [2, 1]) ++ [1] = [1] ++ [3, 3] ++ [1] = [1, 3, 3, 1]

pascal :: [[Integer]]
pascal = [1] : map coeff pascal

main :: IO ()
main = do
  print $ take 5 (sieve [2 .. 11])
  print $ take 25 segitigaSiku
  print $ take 5 (jumlahBerlanjut [1, 2, 3])
  print $ take 5 pascal
  print $ take 20 hamm