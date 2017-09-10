-- Test Linear Regression
module LinearRegSpec (main, spec)  where

import LinearReg
import Test.Hspec
import Test.QuickCheck

-- Main is here to let this file run in its own
-- It's not needed by Spec.hs for the specs discory
main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "LinearReg" $ do
    it "dotProduct [1.0, 2.0, 3.0] [2.0, 2.0, 2.0] is supposed to be 12.0" $ do
      dotProduct [1.0, 2.0, 3.0] [2.0, 2.0, 2.0] `shouldBe` 12.0

