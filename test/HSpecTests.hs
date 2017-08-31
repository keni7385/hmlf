-- Test Linear Regression
module Main where

import LinearReg
import Test.Hspec

main :: IO ()
main = hspec $ do

  describe "Valid dot product function" $ do
    it "dotProduct [1.0, 2.0, 3.0] [2.0, 2.0, 2.0] is supposed to be 12.0" $ do
      dotProduct [1.0, 2.0, 3.0] [2.0, 2.0, 2.0] `shouldBe` 12.0
      
