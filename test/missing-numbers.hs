import Control.Monad (replicateM)
import Data.List ((\\))
import qualified Data.Set as Set

-- https://stackoverflow.com/questions/27635765/difference-between-getline-and-readln
-- <$>
-- https://stackoverflow.com/questions/37286376/what-does-mean-in-haskell/37286470
-- https://stackoverflow.com/questions/940382/what-is-the-difference-between-dot-and-dollar-sign/940424
-- https://www.reddit.com/r/haskell/comments/2jdgyz/question_about_using_read_and_map/
sortAndRemoveDup x = Set.toList $ Set.fromList x

main = do
  getLine
  line <- getLine
  let a = map read $ words line :: [Int]
  getLine
  line <- getLine
  let b = map read $ words line :: [Int]
  putStrLn . unwords . map show . sortAndRemoveDup $ (b \\ a)