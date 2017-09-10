
-- Module with useful functions, as loading datasets from csv
module Utils (parseCSV) where

import Text.ParserCombinators.Parsec

-- Loads from CSV
-- from book "Real World Haskell" (ch 16)
csvFile = endBy line eol
line = sepBy cell (char ',')
cell = many (noneOf ",\n\r")

eol = try (string "\n\r")
  <|> try (string "\r\n")
  <|> string "\n"
  <|> string "\r"
  <|> fail "Couldn't find EOL"

-- |Parse csv strings
-- returns the list of records. Every record is a list of string
parseCSV :: String -- ^ The input string in csv format
         -> Either ParseError [[String]] -- ^ List of lists (records), or ParseError if the parsing failed
parseCSV input = parse csvFile "(unknown)" input


