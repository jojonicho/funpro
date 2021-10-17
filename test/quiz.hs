import Data.Char

--
-- Write a function rotabc that changes a's to b's, b's to c's and c's to a's in a string. Only lowercase letters are affected.
--
rotatebc :: String -> String
rotatebc [] = []
rotatebc (x : xs)
  | x == 'a' = 'b' : rotatebc xs
  | x == 'b' = 'c' : rotatebc xs
  | x == 'c' = 'a' : rotatebc xs
  | otherwise = x : rotatebc xs

rotabc = map abc
  where
    abc 'a' = 'b'
    abc 'b' = 'c'
    abc 'c' = 'a'
    abc x = x

last' = head . reverse

-- class Monad2 m where
--     return :: a -> m a

--     (>>=) :: m a -> (a -> m b) -> m b

--     (>>) :: m a -> m b -> m b
--     x >> y = x >>= \_ -> y

--     fail :: String -> m a
--     fail msg = error msg

-- instance Monad2 Maybe where
--     return x = Just x
--     Nothing >>= f = Nothing
--     Just x >>= f  = f x
--     fail _ = Nothing

notNumber x = x `notElem` "1234567890"

numberRemoval = filter notNumber

isVowel x = x `elem` "aeiouAIUEO"

countVowel = length . filter isVowel

isThreeOrLessVowels str = countVowel str <= 3

isNotAppearTwice (a : b : xs) | (a == b) = False
isNotAppearTwice (x : xs) = isNotAppearTwice xs
isNotAppearTwice [] = True

-- weirdFilter =

weirdFilter = (filter isThreeOrLessVowels . filter isNotAppearTwice) . map numberRemoval

capitalizeExclude lst str = if str `elem` lst then toUpper str else str

-- max4 a b c d = max(max(max a b) c) d
-- max4 = (.) (.) (.) max max max

main = do
  print $ rotatebc "Bananae"
  print $ rotabc "Bananae"
  print $ last' [1, 2, 3]
  print $ weirdFilter ["aaaaaab", "abcdefhijklmno", "abc3", "banana", "bananae"]

-- print $ capitalizeExclude ["a"] "hello world"
