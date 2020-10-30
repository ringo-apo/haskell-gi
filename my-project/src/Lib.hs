{-# LANGUAGE OverloadedStrings, OverloadedLabels #-}
module Lib
    ( hello
    ) where



import qualified GI.Gtk as Gtk
import Data.GI.Base

hello :: IO ()
hello = do
  Gtk.init Nothing

  win <- new Gtk.Window [ #title := "hello" ]

  on win #destroy Gtk.mainQuit

  button <- new Gtk.Button [ #label := "please push" ]

  on button #clicked (set button [ #sensitive := False,
      #label := "thank you. test is good." ] )

  #add win button

  #showAll win

  Gtk.main
