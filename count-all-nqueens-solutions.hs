{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE UnicodeSyntax #-}

import Prelude hiding (catch)

import Control.Concurrent
import Control.Exception
import Control.Monad

import Data.Functor
import Data.Time.Clock (diffUTCTime,getCurrentTime)
import Data.Typeable (typeOf)

import Network

import System.Console.CmdTheLine
import System.IO.Error
import System.Log.Logger

import LogicGrowsOnTrees.Parallel.Adapter.Network
import LogicGrowsOnTrees.Parallel.Main
import LogicGrowsOnTrees.Utils.WordSum

import LogicGrowsOnTrees.Examples.Queens

main = withSocketsDo $ do
    start_time ← getCurrentTime
    let go = do
            current_time ← getCurrentTime
            when (current_time `diffUTCTime` start_time > 600.0) $
                error "Took too long to connect."
            catchJust
                (\e → if ioeGetErrorType e == doesNotExistErrorType
                    then Just ()
                    else Nothing
                )
                (unsafeRunNetwork doRun)
                (const $ do
                    putStrLn "Unable to connect; will try again in ten seconds..."
                    threadDelay 10000000
                    go
                )
    go
  where
    doRun =
        mainForExploreTree
            driverNetwork
            (getBoardSize <$> required (flip (pos 0) (posInfo
                {   posName = "BOARD_SIZE"
                ,   posDoc = "board size"
                }
            ) Nothing))
            (defTI { termDoc = "count the number of n-queens solutions for a given board size" })
            (\size (RunOutcome _ termination_reason) → do
                case termination_reason of
                    Aborted _ → error "search aborted"
                    Completed (WordSum count) → do
                        putStrLn $ "Finished with " ++ show count ++ " solutions."
                        if nqueensCorrectCount size == count
                            then putStrLn $ "This is the correct count."
                            else putStrLn $ "This is NOT the correct count (" ++ show (nqueensCorrectCount size) ++ ")."
                    Failure _ message → error $ "error: " ++ message
            )
            nqueensCount
