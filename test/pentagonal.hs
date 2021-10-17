parseTestcase = tail . lines

solve 1 = 1
solve x = solve (x -1) + 3 * x - 2

main = getContents >>= putStrLn . unlines . map (show . solve . read) . parseTestcase