import Enigma.EnigmaM3
import Enigma.EnigmaM4

import Control.Monad.State

main :: IO ()
main = do
    putStrLn . show $ buildDefaultEnigmaM3

charTest :: (Enigma e) => Char -> Char -> State e (Char, Char)
charTest c1 c2 = do
    sCipher c1
    sCipher c2
    a <- sCipher c1
    b <- sCipher c2
    return (a, b)

stringTest :: (Enigma e) => String -> State e String
stringTest [] = return []
stringTest (x:xs) = do
    r <- sCipher x
    rs <- stringTest xs
    return (r:rs)

stringTest' :: (Enigma e) => String -> State e String
stringTest' [] = return []
stringTest' (x:xs) = sCipher x >>= (\r -> stringTest' xs >>= (\rs -> return (r:rs)))

sCipher :: (Enigma e) => Char -> State e Char
sCipher c = state $ \e -> cipherChar e c

e = buildDefaultEnigmaM3
