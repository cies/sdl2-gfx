-- {-# LANGUAGE CPP #-}
-- {-# LANGUAGE DeriveDataTypeable #-}
-- {-# LANGUAGE DeriveFunctor #-}
-- {-# LANGUAGE DeriveGeneric #-}
-- {-# LANGUAGE FlexibleContexts #-}
-- {-# LANGUAGE MultiParamTypeClasses #-}
-- {-# LANGUAGE PatternSynonyms #-}

{-# LANGUAGE OverloadedStrings #-}


module SDL.Video.Gfx (
    drawAaCircle
  ) where

import Control.Monad.IO.Class (MonadIO, liftIO)
import Data.Word
import Foreign.C.String
import Foreign.C.Types
import Foreign.Ptr
import Linear
import Linear.Affine (Point(P))
import Prelude hiding (foldr)
import SDL.Internal.Types
import SDL.Exception (throwIfNeg_)
import qualified SDL.Raw.Video.Gfx as Raw

drawAaCircle :: MonadIO m
         => Renderer
         -> Point V2 CInt -- ^ The center of the circle
         -> CInt          -- ^ The radius of the circle
         -> V4 Word8      -- ^ The color of the circle in RGBA
         -> m ()
drawAaCircle (Renderer renderer) (P (V2 x y)) rad (V4 r g b a) =
  liftIO $
  throwIfNeg_ "SDL.Video.drawAaCircle" "aacircleRGBA" $
  Raw.aacircleRGBAFFI renderer x y rad r g b a

-- foreign import ccall "SDL2_primitives.h aacircleRGBA" aacircleRGBAFFI :: Renderer -> CInt -> CInt -> CInt -> Word8 -> Word8 -> Word8 -> Word8 -> IO CInt

