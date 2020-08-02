-- Read a JSON recipe

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
import Recipe

-- read JSON file and populate data structure
getJSON :: String -> Recipe
getJSON s = decodeJSON s 

-- address each section of the JSON individually
seperateJSON :: Recipe -> String
seperateJSON (Recipe title source ings steps) = renderHtml (getTitle title) ++
                                                renderHtml (getSource source) ++
                                                renderHtml (getIngs ings) ++
                                                renderHtml (getSteps steps)

-- produce the title in HTML
getTitle :: String -> Html
getTitle t = h1 (stringToHtml t)

-- produce the source in HTML
getSource :: String -> Html
getSource s = h2 (stringToHtml s)

-- produce the ingredients in HTML
getIngs :: [Ingredient] -> Html
getIngs is = unordList (map stringToHtml (map catIngPts is))

-- concatenate the two parts of an Ingredient into one String
catIngPts :: Ingredient -> String
catIngPts (Ingredient item quan) = quan ++ " - " ++ item

-- product the steps in HTML
getSteps :: [String] -> Html
getSteps ss = ordList ss

main :: IO()
main = interact $ seperateJSON . getJSON
