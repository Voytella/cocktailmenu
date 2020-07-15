{-# LANGUAGE DeriveDataTypeable #-}

module Recipie where

import Text.JSON.Generic

data Recipie = Recipie {
  title :: String,
  source :: String,
  ingredients :: [String],
  steps :: [String]
  } deriving (Show, Data, Typeable)
