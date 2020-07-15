-- enables us to use generics to convert JSON to our custom datatype
{-# LANGUAGE DeriveDataTypeable #-}

-- ----------BEGIN MODULES----------

-- produce HTML
import Text.Html

-- read JSON
import Text.JSON.Generic

-- -----------END MODULES-----------

-- store JSON data in Haskell data structure
--data Recipie = Recipie { title :: String } deriving (Show, Data, Typeable)
import Recipie

-- read JSON file and populate data structure
getJSON :: String -> Recipie
getJSON s = decodeJSON s 

-- produce the title in HTML
getTitle :: Recipie -> Html
getTitle (Recipie title) = h1 (stringToHtml title)

main :: IO()
main = interact $ renderHtml . getTitle . getJSON
