import Text.Html

main :: IO()
main = interact $ renderHtml . h1 . stringToHtml
