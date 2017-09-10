-- Test Linear Regression
module Main where

import LinearReg
import Utils
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do

  describe "Linear regression module tests" $ do
    it "dotProduct [1.0, 2.0, 3.0] [2.0, 2.0, 2.0] is supposed to be 12.0" $ do
      dotProduct [1.0, 2.0, 3.0] [2.0, 2.0, 2.0] `shouldBe` 12.0
 
  describe "Utils module tests" $ do
    it "parseCSV returns list of lists of strings" $ do
      parseCSV "lorem,ipsum\ndolor,sit,amet\r\nconsectetur\n\radipiscing,elit\r" `shouldBe` Right [["lorem", "ipsum"], ["dolor", "sit", "amet"], ["consectetur"], ["adipiscing", "elit"]]

