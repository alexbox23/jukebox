module Jukebox.HTML (
  frontMatter,
  classNames,
  buttonStylesPrimary,
  buttonStyles,
) where

import Relude

import Text.Blaze.Html5 (Attribute, AttributeValue, Html, body, docTypeHtml, meta, script, (!))
import Text.Blaze.Html5 qualified as H
import Text.Blaze.Html5.Attributes (charset, class_, content, lang, name, src)

frontMatter :: Html -> Html
frontMatter children = docTypeHtml ! lang "en" $ do
  H.head $ do
    meta ! charset "utf-8"
    meta ! name "viewport" ! content "width=device-width, initial-scale=1"
    H.title "Jukebox"
    meta ! name "description" ! content "Listen to music with your friends"
    script ! src "https://cdn.tailwindcss.com" $ ""
  body children

classNames :: [AttributeValue] -> Attribute
classNames = class_ . foldl' (\a b -> a <> " " <> b) ""

baseButtonStyles :: [AttributeValue]
baseButtonStyles =
  [ "rounded-md"
  , "px-3"
  , "py-2"
  , "text-sm"
  , "font-semibold"
  , "shadow-sm"
  , "focus-visible:outline"
  , "focus-visible:outline-2"
  , "focus-visible:outline-offset-2"
  ]

buttonStylesPrimary :: [AttributeValue]
buttonStylesPrimary =
  baseButtonStyles
    <> [ "bg-indigo-600"
       , "text-white"
       , "hover:bg-indigo-500"
       , "focus-visible:outline-indigo-600"
       ]

buttonStyles :: [AttributeValue]
buttonStyles =
  baseButtonStyles
    <> [ "bg-white"
       , "text-gray-900"
       , "hover:bg-gray-50"
       , "ring-1"
       , "ring-inset"
       , "ring-gray-300"
       ]