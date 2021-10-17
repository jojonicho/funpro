-- https://stackoverflow.com/questions/3137162/map-versus-mapm-behavior
-- Prelude> take 3 $ drop 1  $ cycle str
-- "bca"
-- Prelude> take 3 $ drop 2  $ cycle str
-- "cab"
-- Prelude> take 3 $ drop 3  $ cycle str
-- "abc"

-- cycle "abc" -> "abcabcabc"
solve str = unwords [take (length str) $ drop x $ cycle str | x <- [1 .. (length str)]]

main = getContents >>= mapM (putStrLn . solve) . (tail . lines)