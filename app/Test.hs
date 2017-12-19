module Main where
import Control.Monad
import Game.Poker.Cards
import System.Random.Shuffle
import Game.Poker.Hands

data GameState = GameState { humanCards::[Card], computerCards::[Card], openCards::[Card], restCards::[Card], trashCards::[Card] } deriving (Eq,Show)

data Player = Human | Computer deriving (Eq,Show)

judgeGameState :: GameState -> Player
judgeGameState = undefined

comb5List :: [a] -> [a]
comb5List = undefined

randomGameState :: IO GameState
randomGameState = do
  c <- shuffleM allCards
  return $ GameState (take 5 c) (take 5 (drop 5 c)) [] (drop 10 c) []

main :: IO ()
main = do
  c <- shuffleM allCards
  print $ (liftM pokerHand) $ toHand $ take 5 c
  print $ take 5 c
