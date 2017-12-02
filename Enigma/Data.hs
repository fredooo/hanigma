module Enigma.Data
    ( Wiring
    , reflectorNameList
    , reflectorWiringList
    , thinReflectorNameList
    , thinReflectorWiringList
    , rotorNameList
    , rotorNotchList
    , rotorWiringList
    , greekRotorNameList
    , greekRotorWiringList
    , greekRotorNotchList
    ) where

type Wiring = [Integer]

-- Reflector data

reflectorNameList = ["A", "B", "C"]

reflectorAWiring = [4, 9, 12, 25, 0, 11, 24, 23, 21, 1, 22, 5, 2, 17, 16, 20, 14, 13, 19, 18, 15, 8, 10, 7, 6, 3]
reflectorBWiring = [24, 17, 20, 7, 16, 18, 11, 3, 15, 23, 13, 6, 14, 10, 12, 8, 4, 1, 5, 25, 2, 22, 21, 9, 0, 19]
reflectorCWiring = [5, 21, 15, 9, 8, 0, 14, 24, 4, 3, 17, 25, 23, 22, 6, 2, 19, 10, 20, 16, 18, 1, 13, 12, 7, 11]

reflectorWiringList = [reflectorAWiring, reflectorBWiring, reflectorCWiring]

thinReflectorNameList = ["B", "C"]

thinReflectorBWiring = [4, 13, 10, 16, 0, 20, 24, 22, 9, 8, 2, 14, 15, 1, 11, 12, 3, 23, 25, 21, 5, 19, 7, 17, 6, 18]
thinReflectorCWiring = [17, 3, 14, 1, 9, 13, 19, 10, 21, 4, 7, 12, 11, 5, 2, 22, 25, 0, 23, 6, 24, 8, 15, 18, 20, 16]

thinReflectorWiringList = [thinReflectorBWiring, thinReflectorCWiring]

-- Rotor data

rotorNameList = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII"];

rotor1Notches = [16]
rotor2Notches = [4]
rotor3Notches = [21]
rotor4Notches = [9]
rotor5Notches = [25]
rotor6Notches = [25, 12]
rotor7Notches = [25, 12]
rotor8Notches = [25, 12]

rotorNotchList = [rotor1Notches, rotor2Notches, rotor3Notches, rotor4Notches,
                  rotor5Notches, rotor6Notches, rotor7Notches, rotor8Notches];

rotor1Wiring = [4, 10, 12, 5, 11, 6, 3, 16, 21, 25, 13, 19, 14, 22, 24, 7, 23, 20, 18, 15, 0, 8, 1, 17, 2, 9]
rotor2Wiring = [0, 9, 3, 10, 18, 8, 17, 20, 23, 1, 11, 7, 22, 19, 12, 2, 16, 6, 25, 13, 15, 24, 5, 21, 14, 4]
rotor3Wiring = [1, 3, 5, 7, 9, 11, 2, 15, 17, 19, 23, 21, 25, 13, 24, 4, 8, 22, 6, 0, 10, 12, 20, 18, 16, 14]
rotor4Wiring = [4, 18, 14, 21, 15, 25, 9, 0, 24, 16, 20, 8, 17, 7, 23, 11, 13, 5, 19, 6, 10, 3, 2, 12, 22, 1]
rotor5Wiring = [21, 25, 1, 17, 6, 8, 19, 24, 20, 15, 18, 3, 13, 7, 11, 23, 0, 22, 12, 9, 16, 14, 5, 4, 2, 10]
rotor6Wiring = [9, 15, 6, 21, 14, 20, 12, 5, 24, 16, 1, 4, 13, 7, 25, 17, 3, 10, 0, 18, 23, 11, 8, 2, 19, 22]
rotor7Wiring = [13, 25, 9, 7, 6, 17, 2, 23, 12, 24, 18, 22, 1, 14, 20, 5, 0, 8, 21, 11, 15, 4, 10, 16, 3, 19]
rotor8Wiring = [5, 10, 16, 7, 19, 11, 23, 14, 2, 1, 9, 18, 15, 3, 25, 17, 0, 12, 4, 22, 13, 8, 20, 24, 6, 21]

rotorWiringList = [rotor1Wiring, rotor2Wiring, rotor3Wiring, rotor4Wiring,
                   rotor5Wiring, rotor6Wiring, rotor7Wiring, rotor8Wiring];


greekRotorNameList = ["beta", "gamma"]

rotorAlphaWiring = [11, 4, 24, 9, 21, 2, 13, 8, 23, 22, 15, 1, 16, 12, 3, 17, 19, 0, 10, 25, 6, 5, 20, 7, 14, 18]
rotorBetaWiring = [5, 18, 14, 10, 0, 13, 20, 4, 17, 7, 12, 1, 19, 8, 24, 2, 22, 11, 16, 15, 25, 23, 21, 6, 9, 3]

greekRotorNotchList = [[], []]

greekRotorWiringList = [rotorAlphaWiring, rotorBetaWiring]
