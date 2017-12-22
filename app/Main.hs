{-# LANGUAGE BangPatterns #-}

module Main where
import Data.Maybe (fromJust)
import Data.List (sort)
import Data.List.Unique (count)
import Control.Monad (liftM)
import Game.Poker.Cards
import System.Random.Shuffle
import System.Random
import Game.Poker.Hands
import Text.Layout.Table
import qualified Data.Map as Map

numOpenCards = 20

data GameState = GameState { humanCards::[Card], computerCards::[Card], openCards::[Card], restCards::[Card], trashCards::[Card] } deriving (Eq,Show)

data Possibility = Possibility PokerHand [Card] deriving (Eq,Ord,Show)

data Player = Human | Computer deriving (Eq,Show)

judgeGameState :: GameState -> Player
judgeGameState g = if h < c then Computer else Human
  where h = maxHand $ humanCards g ++ openCards g
        c = maxHand $ computerCards g ++ openCards g

maxHand :: [Card] -> (PokerHand, Card)
maxHand cs = (head . reverse . sort) (map (pokerHand . fromJust . toHand . sort) (combNList 5 cs))

combNList :: Int -> [a] -> [[a]]
combNList 0 _ = [[]]
combNList n [] = []
combNList n (a:as) = map (a:) (combNList (n-1) as) ++ combNList n as

subList :: Ord a => [a] -> [a] -> [a]
subList as bs = subList' (sort as) (sort bs)
  where subList' as [] = as
        subList' [] bs = []
        subList' (a:as) (b:bs)
          | a == b = subList as bs
          | a < b = a : subList as (b:bs)
          | otherwise = subList (a:as) bs

allSubset :: [a] -> [[a]]
allSubset [] = [[]]
allSubset (a:as) = map (a:) (allSubset as) ++ allSubset as

checkGameState :: GameState -> [(Possibility, Int)]
checkGameState g = count $ sort $ possibleHands (humanCards g) (openCards g) (restCards g)

possibleHands :: [Card] -> [Card] -> [Card] -> [Possibility]
possibleHands now open rest = do
  a <- allSubset now 
  b <- combNList (5 - length a) rest
  let (h,c) = maxHand $ sort (a ++ b ++ open)
  return $ Possibility h (subList now a)

randomGameState :: IO GameState
randomGameState = do
  c <- shuffleM allCards
  i <- (getStdRandom random)::IO Int
  return $ GameState (take 5 c) (take 5 (drop 5 c)) (take (i`mod`5) (drop 10 c)) (take numOpenCards (drop (10+i`mod`5) c)) (drop (10+i`mod`5+numOpenCards) c)

possToTable :: [(Possibility, Int)] -> Map.Map [Card] [(PokerHand, Int)]
possToTable [] = Map.empty
possToTable (((Possibility h c),i):rs) = 
  if Map.member c t
  then Map.insertWith (++) c [(h,i)] t
  else Map.insert c [(h,i)] t
  where t = possToTable rs

tableToString :: Map.Map [Card] [(PokerHand, Int)] -> [[String]]
tableToString m = ["Discard cards", "Possbile hands"] : tableToString' (Map.toList m)
  where tableToString' [] = [[]]
        tableToString' ((a,b):r) = [show a,show b] : (tableToString' r)


main :: IO ()
main = do
  r <- randomGameState
  let p = checkGameState r
  putStrLn $ "Your hands are " ++ (show $ humanCards r)
  putStrLn $ "Opoosite hands are " ++ (show $ computerCards r)
  putStrLn $ "Open cards are " ++ (show $ openCards r)
  putStr $ gridString [column expand left def def, column expand right def def] (tableToString $ possToTable p)
