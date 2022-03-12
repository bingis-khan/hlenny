module Main where

import System.Clipboard (setClipboardString)
import System.Environment (getArgs)
import Data.Foldable (find)
import System.Exit (exitFailure, exitSuccess)


lenny :: String
lenny = "( ͡° ͜ʖ ͡°)"

list :: [(String, String)]
list =
  [ ( "dollar",   "[̲̅$̲̅(̲̅ ͡° ͜ʖ ͡°̲̅)̲̅$̲̅]" )
  , ( "wat",      "(° ͜ʖ °)" )
  , ( "insomnia", "( ͡ʘ ͜ʖ ͡ʘ)" )
  , ( "huh",      "( ͡o ͜ʖ ͡o)" )
  , ( "chillera", "༼  ͡° ͜ʖ ͡° ༽" )
  , ( "wink",     "( ͡~ ͜ʖ ͡°)" )
  , ( "spider",   "/╲/\\╭( ͡° ͡° ͜ʖ ͡° ͡°)╮/\\╱\\" )
  , ( "wall",     "┬┴┬┴┤ ͜ʖ ͡°) ├┬┴┬┴"  )
  , ( "akimbo",   "̿̿ ̿̿ ̿̿ ̿'̿'\\̵͇̿̿\\з= ( ▀ ͜͞ʖ▀) =ε/̵͇̿̿/’̿’̿ ̿ ̿̿ ̿̿ ̿̿" )

  -- Not even lennys, but I don't care.
  , ( "point",    "(☞ﾟ∀ﾟ)☞" )
  , ( "tableflip",  "┻━┻ ︵ヽ(`Д´)ﾉ︵ ┻━┻" )
  , ( "cry",      "(;´༎ຶД༎ຶ`)")
  , ( ":D",       "( ﾟヮﾟ)")
  ]

usage :: String
usage = "Usage: lenny | lenny --list | lenny --help | lenny [name]"

setClipboardAndExit :: String -> IO ()
setClipboardAndExit s = setClipboardString s *> exitSuccess  


main :: IO ()
main = do
  args <- getArgs
  case args of
    []           -> setClipboardAndExit lenny
    [ "--list" ] -> putStrLn "Available lennys:" *> putStrLn (unlines $ map (\(name, lenny) -> name ++ ": " ++ lenny) list)
    [ "--help" ] -> putStrLn usage
    [ '-' : '-' : opt ] -> putStrLn ("Invalid option: \"" ++ opt ++ "\"") *> putStrLn usage
    [ name ]     ->
      let lenny = find ((==name) . fst) list
      in case lenny of
        Nothing -> putStrLn $ "Couldn't find lenny \"" ++ name ++ "\"."
        Just (_, foundLenny) -> setClipboardAndExit foundLenny

    _ -> putStrLn "The fuck are all those arguments."
  
  exitFailure 
