{-# LANGUAGE CPP #-}
{-|
Todo wraps some standard debug symbols in warnings so that you'll have to
 work a bit harder to miss unfinished code in your Haskell programs.

For instance, say that you have this line of code:

> neatFunction = undefined

`undefined` is a good stubbing tool but what if you forget what you were
stubbing? You'd like to have some more info on what you were doing, so you
do this:

> neatFunction = error "Got to implement this someday or my boss will get mad"

This may work but there's some issues with it:

 * `error` is often used for non-total functions, this may confuse the reader
 * If we forget to implement the call for `neatFunction`, we're not getting noticed
   that our function currently is incomplete!

Therefore, with Development.Todo you can do this:

> neatFunction = todo "I'm going to implement this!"

This will not only solve the cultural ambiguity of `error` but
will also throw a compile time warning so if you're using
-`Wall` in your build step, you will get a warning whenever
you forget a `todo` in your code!


Example:

@
  $ runhaskell example.hs

  example.hs:5:16: warning: [-Wdeprecations]
      In the use of ‘todo’ (imported from Development.Todo):
      "TODO:s exists in code! Make sure you fix them! "
@
-}
module Debug.Todo (
  todo,  todo_,
  trace
  ) where

import qualified Debug.Trace as DT

{-# WARNING todo   "TODO:s exists in code! Make sure you fix them! " #-}
{-# WARNING todo_  "TODO:s exists in code! Make sure you fix them! " #-}
{-# WARNING trace  "TODO:s exists in code! Make sure you fix them! " #-}

-- | Gives a warning on compile time.
todo :: String -> a
todo = error

-- | Gives a warning on compile time, even if you don't know what to write.
todo_ :: a
todo_ = undefined

-- | Wrapper for `trace` from Debug.Trace, with a warning on compile time.
trace :: String -> a -> a
trace = DT.trace
