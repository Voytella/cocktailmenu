{-# LANGUAGE DeriveDataTypeable #-}

module Recipie where

import Text.JSON.Generic

data Recipie = Recipie {
  title :: String
  } deriving (Show, Data, Typeable)
