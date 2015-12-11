module Main where

import Data.List
import qualified Data.Map as Map
import Data.Map ( Map )

data Coords = Coords String String deriving (Eq, Ord, Show, Read)

coords :: String -> String -> Coords
coords a b
  | a < b     = Coords a b
  | otherwise = Coords b a

spliterate :: Coords -> [String]
spliterate (Coords a b) = [a,b]

uniq :: Ord a => [a] -> [a]
uniq = map head . group . sort

len :: Map Coords Int -> [String] -> Int
len mm el
  = sum
  $ map (mm Map.!)
  $ zipWith coords el (tail el)

load :: IO (Map Coords Int)
load = Map.fromList . map retrieve . lines <$> readFile "input"

retrieve :: String -> (Coords, Int)
retrieve line =
  case words line of
    [a, "to", b, "=", c] -> (coords a b,read c)
    _ -> error ("Invalid " ++ line)

main :: IO ()
main =
  do fio <- load
     let places = uniq (concatMap spliterate (Map.keys fio))
         dists  = len fio <$> permutations places
     print (maximum dists)
