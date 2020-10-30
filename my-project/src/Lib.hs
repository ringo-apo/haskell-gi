{-# LANGUAGE OverloadedStrings, OverloadedLabels #-}
module Lib
    ( hello
    ) where



import qualified GI.Gtk as Gtk
import Data.GI.Base

hello :: IO ()
hello = do
  Gtk.init Nothing

  win <- new Gtk.Window [ #title := "こんにちは" ]

  on win #destroy Gtk.mainQuit

  button <- new Gtk.Button [ #label := "おしてね" ]

  on button #clicked (set button [ #sensitive := False,
      #label := "押してくれてありがとう、テストは成功しました" ] )

  #add win button

  #showAll win

  Gtk.main
