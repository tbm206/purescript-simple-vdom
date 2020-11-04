module VirtualDOM.DOM
  ( createElement
  , replaceChild
  ) where

import Prelude
import Effect (Effect)
import Web.DOM.Document as Doc
import Web.DOM.Node as Node
import Web.DOM.Internal.Types (Node)
import Web.DOM.Element (toNode)
import Web.HTML as HTML
import Web.HTML.HTMLDocument (toDocument)
import Web.HTML.Window as Window

document :: Effect Doc.Document 
document = HTML.window >>= Window.document >>= toDocument >>> pure

createElement :: String -> Effect Node
createElement name = document >>= Doc.createElement name >>= toNode >>> pure

replaceChild :: Node -> Node -> Node -> Effect Unit
replaceChild new old parent = void $ Node.replaceChild new old parent
