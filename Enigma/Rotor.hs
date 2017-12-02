module Enigma.Rotor
    ( Rotor
    , rotorPosAsChar
    , inwardOutput
    , outwardOutput
    , onNotch
    , step
    , buildRotor
    , buildGreekRotor
    ) where

import Enigma.Data
import Enigma.Util (findPos, toChar)

data Rotor = Rotor
    { rotName :: String
    , rotPosition :: Integer
    , rotOffset :: Integer
    , transferNotches :: [Integer]
    , inwardsWiring :: Wiring
    , outwardsWiring :: Wiring
    } deriving (Show)

rotorPosAsChar :: Rotor -> Char
rotorPosAsChar r = toChar $ rotPosition r

invertWiring :: Wiring -> Wiring
invertWiring xs = concat $ map (findPos xs) [0..l]
  where
    l = toInteger $ length xs - 1

inwardOutput :: Rotor -> Integer -> Integer
inwardOutput r n = output r n $ inwardsWiring r

outwardOutput :: Rotor -> Integer -> Integer
outwardOutput r n = output r n $ outwardsWiring r

output :: Rotor -> Integer -> Wiring -> Integer
output r n w = carry $ (+ (o - p)) $ (!!) w $ fromIntegral $ carry $ p - o + n
  where
    p = rotPosition r
    o = rotOffset r

carry :: Integer -> Integer
carry n
    | n >= 0 && n <= 25 = n
    | n > 25 = mod n 26
    | otherwise = carry $ n + 26

onNotch :: Rotor -> Bool
onNotch r = elem (rotPosition r) (transferNotches r)

step :: Rotor -> Rotor
step r = r { rotPosition = carry $ rotPosition r + 1}

buildRotor :: Int -> Rotor
buildRotor i = genRot rotorNameList rotorNotchList rotorWiringList i

buildGreekRotor :: Int -> Rotor
buildGreekRotor i = genRot greekRotorNameList greekRotorNotchList greekRotorWiringList i

genRot :: [String] -> [[Integer]] -> [[Integer]] -> Int -> Rotor
genRot ns ts ws i
    | i < 0 || i > length ns = error $ e
    | otherwise = Rotor (ns !! i) 0 0 (ts !! i) w $ invertWiring w
        where
          w = ws !! i
          e = "Can't build rotor with number " ++ show i ++ "!"
