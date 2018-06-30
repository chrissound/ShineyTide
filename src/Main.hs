module Main where

import Sound.OSC.FD
import Control.Monad

main :: IO ()
main = do
  startServ 1235 >>= print

startServ :: Int -> IO ()
startServ port = do
  scServer <- openUDP "127.0.0.1" 57120
  x <- udpServer "127.0.0.1" port
  forever $ do
    m <- waitImmediate x
    sendOSC scServer $ m
    print m
