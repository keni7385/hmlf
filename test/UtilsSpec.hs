-- Test Utils
module UtilsSpec (main, spec) where

import Utils
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec spec

spec = do
  describe "Utils" $ do
    it "parseCSV returns list of lists of strings" $ do
      parseCSV "lorem,ipsum\ndolor,sit,amet\r\nconsectetur\n\radipiscing,elit\r" `shouldBe` Right [["lorem", "ipsum"], ["dolor", "sit", "amet"], ["consectetur"], ["adipiscing", "elit"]]

