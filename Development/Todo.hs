{-# LANGUAGE CPP #-}
module Development.Todo (
  todo, todo_, traco
  ) where

{-|
Todo wraps some standard debug symbols in warnings so that you'll have to
 work a bit harder to miss unfinished code in your Haskell programs.
--}

import Debug.Trace (trace)
{-# WARNING todo  "TODO:s exists in code! Make sure you fix them! " #-}
{-# WARNING todo_ "TODO:s exists in code! Make sure you fix them! " #-}
{-# WARNING traco "TODO:s exists in code! Make sure you fix them! " #-}

-- | Wrapper for `error`
todo :: String -> a
todo = error

-- | Wrapper for `undefined`
todo_ :: a
todo_ = undefined

-- | Wrapper for `trace` from Debug.Trace.
traco :: String -> a -> a
traco = trace
