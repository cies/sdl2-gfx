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
  , drawFilledCircle
  , drawAaLine
  , drawThickLine
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

drawFilledCircle :: MonadIO m
         => Renderer
         -> Point V2 CInt -- ^ The center of the circle
         -> CInt          -- ^ The radius of the circle
         -> V4 Word8      -- ^ The color of the circle in RGBA
         -> m ()
drawFilledCircle (Renderer renderer) (P (V2 x y)) rad (V4 r g b a) =
  liftIO $
  throwIfNeg_ "SDL.Video.drawAaCircle" "aacircleRGBA" $
  Raw.filledCircleRGBAFFI renderer x y rad r g b a

drawThickLine :: MonadIO m
         => Renderer
         -> Point V2 CInt -- ^ The starting point of the line
         -> Point V2 CInt -- ^ The ending point of the line
         -> Word8         -- ^ The width of the line
         -> V4 Word8      -- ^ The color of the line in RGBA
         -> m ()
drawThickLine (Renderer renderer) (P (V2 x y)) (P (V2 x' y')) width (V4 r g b a) =
  liftIO $
  throwIfNeg_ "SDL.Video.drawAaCircle" "aacircleRGBA" $
  Raw.thickLineRGBAFFI renderer x y x' y' width r g b a

drawAaLine :: MonadIO m
         => Renderer
         -> Point V2 CInt -- ^ The starting point of the line
         -> Point V2 CInt -- ^ The ending point of the line
         -> V4 Word8      -- ^ The color of the line in RGBA
         -> m ()
drawAaLine (Renderer renderer) (P (V2 x y)) (P (V2 x' y')) (V4 r g b a) =
  liftIO $
  throwIfNeg_ "SDL.Video.drawAaCircle" "aacircleRGBA" $
  Raw.aalineRGBAFFI renderer x y x' y' r g b a

