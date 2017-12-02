module Enigma.EnigmaM3
    ( Enigma
    , cipher
    , EnigmaM3
    , inwardM3
    , reversal
    , outwardM3
    , actuateM3
    , buildEnigmaM3
    , buildM4Core
    , buildDefaultEnigmaM3
    , cipherChar
    , cipherString
    ) where

import Enigma.Enigma
import Enigma.Plugboard
import Enigma.Reflector
import Enigma.Rotor

data EnigmaM3 = EnigmaM3
    { plugboard :: Plugboard
    , reflector :: Reflector
    , leftRotor :: Rotor
    , middleRotor :: Rotor
    , rightRotor :: Rotor
    } deriving (Show)

-- instance Show EnigmaM3 where
--     show e = '[' : (rotorPosAsChar $ leftRotor e) : ' '
--             : (rotorPosAsChar $ middleRotor e) : ' '
--             :  (rotorPosAsChar $ rightRotor e) : [']']

instance Enigma EnigmaM3 where
    cipher = cipherM3

cipherM3 :: EnigmaM3 -> Integer -> (Integer, EnigmaM3)
cipherM3 e i = (translateM3 n i, n)
    where
    n = actuateM3 e

translateM3 :: EnigmaM3 -> Integer -> Integer
translateM3 e n = outwardM3 e $ reversal e $ inwardM3 e n

inwardM3 :: EnigmaM3 -> Integer -> Integer
inwardM3 e n = inwardOutput l $ inwardOutput m $ inwardOutput r $ swap p n
  where
    p = plugboard e
    r = rightRotor e
    m = middleRotor e
    l = leftRotor e

reversal :: EnigmaM3 -> Integer -> Integer
reversal e = refOutput $ reflector e

outwardM3 :: EnigmaM3 -> Integer -> Integer
outwardM3 e n = swap p $ outwardOutput r $ outwardOutput m $ outwardOutput l n
  where
    l = leftRotor e
    m = middleRotor e
    r = rightRotor e
    p = plugboard e

actuateM3 :: EnigmaM3 -> EnigmaM3
actuateM3 (EnigmaM3 p t l m r)
    | onNotch m && onNotch r = EnigmaM3 p t (step l) (step $ step m) (step r)
    | onNotch m = EnigmaM3 p t (step l) (step m) (step r)
    | onNotch r = EnigmaM3 p t l (step m) (step r)
    | otherwise = EnigmaM3 p t l m (step r)

buildEnigmaM3 :: Plugboard -> Int -> Int -> Int -> Int -> EnigmaM3
buildEnigmaM3 p nt nl nm nr = EnigmaM3 p t l m r
  where
    t = buildReflector nt
    l = buildRotor nl
    m = buildRotor nm
    r = buildRotor nr

buildM4Core :: Plugboard -> Reflector -> Int -> Int -> Int -> EnigmaM3
buildM4Core p t nl nm nr = EnigmaM3 p t l m r
  where
    l = buildRotor nl
    m = buildRotor nm
    r = buildRotor nr

buildDefaultEnigmaM3 :: EnigmaM3
buildDefaultEnigmaM3 = buildEnigmaM3 [] 1 0 1 2
