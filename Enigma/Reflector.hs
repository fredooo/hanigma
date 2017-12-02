module Enigma.Reflector
    ( Reflector
    , buildReflector
    , buildThinReflector
    , refOutput
    ) where

import Enigma.Data

data Reflector = Reflector
    { refName :: String
    , refWiring :: Wiring
    } deriving (Show)

refOutput :: Reflector -> Integer -> Integer
refOutput r n = (refWiring r) !! (fromIntegral n)

buildReflector :: Int -> Reflector
buildReflector i = genRef reflectorNameList reflectorWiringList i

buildThinReflector :: Int -> Reflector
buildThinReflector i = genRef thinReflectorNameList thinReflectorWiringList i

genRef :: [String] -> [[Integer]] -> Int -> Reflector
genRef ns ws i
    | i < 0 || i > length ns = error $ e
    | otherwise = Reflector (ns !! i) (ws !! i)
        where
          e = "Can't build reflector with number " ++ show i ++ "!"
