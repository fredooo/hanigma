module Enigma.Enigma
    ( Enigma
    , cipher
    , cipherChar
    , cipherString
    ) where

import Enigma.Util (toChar, toInt)

class Enigma e where
    cipher :: e -> Integer -> (Integer, e)

cipherChar :: (Enigma e) => e -> Char -> (Char, e)
cipherChar e c = (toChar i, n)
  where
    (i, n) = cipher e $ toInt c

cipherString :: (Enigma e) => e -> String -> [(Char, e)]
cipherString _ [] = []
cipherString e (x:xs) = t : cipherString n xs
  where
    t@(_, n) = cipherChar e x
