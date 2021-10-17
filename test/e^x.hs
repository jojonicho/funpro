{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE UndecidableInstances #-}

module Main where

import Control.Monad
import Data.Bits
import Data.List
import Debug.Trace
import System.Environment
import System.IO
import System.IO.Unsafe

series_exp :: Double -> Int -> Int -> Double
series_exp x nterms i
  | i == nterms = 1.0
  | i /= nterms =
    1.0 + x / (fromIntegral i)
      * (series_exp x nterms (i + 1))

main :: IO ()
main = do
  n <- readLn :: IO Int

  forM_ [1 .. n] $ \n_itr -> do
    x <- readLn :: IO Double
    print $ series_exp x 10 1