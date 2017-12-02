module Enigma.Util
    ( toChar
    , toInt
    , findPos
    ) where

import Data.Char

findPos :: Eq a => [a] -> a -> [Integer]
findPos l e = [index | (index, d) <- zip [0..] l, d == e]

toChar :: Integer -> Char
toChar i
    | i >= 0 && i <= 25 = chr $ (+ 65) $ fromIntegral i
    | otherwise = error "Invalid Int in toChar!"

toInt :: Char -> Integer
toInt c
    | c >= 'A' && c <= 'Z' = toInteger $ ord c - 65
    | c >= 'a' && c <= 'z' = toInteger $ ord c - 97
    | otherwise = error "Invalid Char in toInt!"
