-- {-# OPTIONS_GHC -Wno-missing-methods #-}

-- import Data.List (intercalate)

-- instance Num a => Num [a] where
--   fromInteger n = [fromInteger n]
--   (x : xs) + (y : ys) = (x + y) : (xs + ys)
--   xs + [] = xs
--   [] + ys = ys
--   (x : xs) * (y : ys) = (x * y) : ([x] * ys + xs * (y : ys))
--   _ * _ = []

-- choose :: Int -> Int -> Int
-- choose n k = ([1, 1] ^ n) !! k

-- pascalTriangle n = map ([1, 1] ^) [0 .. n]

-- printfieldName x = unwords (map ((++) "|") x) ++ "|"

-- printElements (x:xs) = putStrLn x >> printElements xs
-- print' :: Show a => a -> IO ()
-- print' x = mapM_ print' x

-- print pascall triangel without list brackets
-- printPascalTriangle :: Int -> IO ()
-- printPascalTriangle n = do
--   let pascalTriangle' = pascalTriangle n
--   let pascalTriangle'' = map (intercalate " ") pascalTriangle'
--   let pascalTriangle''' = map (map show) pascalTriangle''
--   let pascalTriangle'''' = map printfieldName pascalTriangle'''
--   mapM_ putStrLn pascalTriangle''''
-- pascal = iterate ((++ [1]) . (1 :) . (zipWith (+) =<< tail)) [1]

-- main = do
-- print $ take 4 pascal

-- mapM_ print (pascalTriangle 4)
-- printElements (pascalTriangle 4)
-- mapM_ print (pascalTriangle 4)

-- mapM_ putStrLn (pascalTriangle 4)
-- print $ pascalTriangle 4
-- printPascalTriangle 4

-- pascalTriangle =
--     [1] : map nextRow pascalTriangle
--   where
--     nextRow x = [1] ++ (zipWith (+) x (tail x)) ++ [1]

-- f = unwords . map show

-- printPascalTriangle = map f pascalTriangle

-- main = getLine >>= putStrLn . unlines . (flip take printPascalTriangle . read)

nextRow :: Num a => [a] -> [a]
nextRow x = [1] ++ zipWith (+) x (tail x) ++ [1]

pascal :: [[Integer]]
pascal = [1] : map nextRow pascal

listToString :: [Integer] -> String
listToString = unwords . (map show)

printPascal :: [String]
printPascal = map listToString pascal

main :: IO ()
main = getLine >>= putStrLn . unlines . flip take printPascal . read