module Enigma.Plugboard
    ( Plug
    , Plugboard
    , isPlugged
    , addPlug
    , removePlug
    , swap
    ) where

import Enigma.Util (findPos)

type Plug = (Integer, Integer)

type Plugboard = [Plug]

isPlugged :: Plugboard -> Integer -> Bool
isPlugged pb n = not . null $ getPlug pb n

getPlug :: Plugboard -> Integer -> [Plug]
getPlug pb n = filter (\e -> fst e == n || snd e == n) pb

addPlug :: Plugboard -> Plug -> Plugboard
addPlug pb p = p : pb

removePlug :: Plugboard -> Plug -> Plugboard
removePlug pb (i,j) = filter (\e -> e == (i,j) || e /= (j,i)) pb

swap :: Plugboard -> Integer -> Integer
swap pb n
    | not $ isPlugged pb n = n
    | i == n = j
    | otherwise = i
    where
        ((i,j):ps) = getPlug pb n
