module Main where
import Data.Maybe (fromJust)
import Data.List (sort)
import Control.Monad (liftM)
import Game.Poker.Cards
import System.Random.Shuffle
import Game.Poker.Hands

data GameState = GameState { humanCards::[Card], computerCards::[Card], openCards::[Card], restCards::[Card], trashCards::[Card] } deriving (Eq,Show)

data Player = Human | Computer deriving (Eq,Show)

judgeGameState :: GameState -> Player
judgeGameState g = if h < c then Computer else Human
  where h = maxHand $ humanCards g ++ openCards g
        c = maxHand $ computerCards g ++ openCards g

maxHand :: [Card] -> (PokerHand, Card)
maxHand cs = (head . sort) (map (pokerHand . fromJust . toHand . sort) (combNList 5 cs))

combNList :: Int -> [a] -> [[a]]
combNList 0 _ = [[]]
combNList n [] = []
combNList n (a:as) = map (a:) (combNList (n-1) as) ++ combNList n as

subList :: Ord a => [a] -> [a] -> [a]
subList as [] = as
subList [] bs = []
subList (a:as) (b:bs)
  | a == b = subList as bs
  | a < b = a : subList as (b:bs)
  | otherwise = subList (a:as) bs

randomGameState :: IO GameState
randomGameState = do
  c <- shuffleM allCards
  return $ GameState (take 5 c) (take 5 (drop 5 c)) [] (drop 10 c) []

main :: IO ()
main = do
  c <- shuffleM allCards
  print $ (liftM pokerHand) $ toHand $ take 5 c
  print $ take 5 c
