module Enigma.EnigmaM4
    ( EnigmaM4
    , buildEnigmaM4
    , buildDefaultEnigmaM4
    ) where

import Enigma.EnigmaM3
import Enigma.Plugboard
import Enigma.Reflector
import Enigma.Rotor

data EnigmaM4 = EnigmaM4
    { core :: EnigmaM3
    , greekRotor :: Rotor
    } deriving (Show)

instance Enigma EnigmaM4 where
    cipher = cipherM4

cipherM4 :: EnigmaM4 -> Integer -> (Integer, EnigmaM4)
cipherM4 e i = (translateM4 n i, n)
  where
    n = actuateM4 e

translateM4 :: EnigmaM4 -> Integer -> Integer
translateM4 e@(EnigmaM4 c _) n = outwardM4 e $ reversal c $ inwardM4 e n

inwardM4 :: EnigmaM4 -> Integer -> Integer
inwardM4 (EnigmaM4 c g) n = inwardOutput g $ inwardM3 c n

outwardM4 :: EnigmaM4 -> Integer -> Integer
outwardM4 (EnigmaM4 c g) n = outwardM3 c $ outwardOutput g n

actuateM4 :: EnigmaM4 -> EnigmaM4
actuateM4 e = e { core = actuateM3 $ core e }

buildEnigmaM4 :: Plugboard -> Int -> Int -> Int -> Int -> Int -> EnigmaM4
buildEnigmaM4 p nt ng nl nm nr = EnigmaM4 c g
  where
    t = buildThinReflector nt
    c = buildM4Core p t nl nm nr
    g = buildGreekRotor ng

buildDefaultEnigmaM4 :: EnigmaM4
buildDefaultEnigmaM4 = buildEnigmaM4 [] 0 0 0 1 2
