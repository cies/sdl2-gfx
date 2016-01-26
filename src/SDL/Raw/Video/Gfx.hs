module SDL.Raw.Video.Gfx (
    aacircleRGBAFFI
  , filledCircleRGBAFFI
  , thickLineRGBAFFI
  , aalineRGBAFFI
  ) where

import Data.Word
import Foreign.C.Types
import SDL.Raw.Types


foreign import ccall "SDL2_primitives.h filledCircleRGBA" filledCircleRGBAFFI :: Renderer -> CInt -> CInt -> CInt -> Word8 -> Word8 -> Word8 -> Word8 -> IO CInt

foreign import ccall "SDL2_primitives.h aacircleRGBA" aacircleRGBAFFI :: Renderer -> CInt -> CInt -> CInt -> Word8 -> Word8 -> Word8 -> Word8 -> IO CInt

foreign import ccall "SDL2_primitives.h aalineRGBA" aalineRGBAFFI :: Renderer -> CInt -> CInt -> CInt -> CInt -> Word8 -> Word8 -> Word8 -> Word8 -> IO CInt

foreign import ccall "SDL2_primitives.h thickLineRGBA" thickLineRGBAFFI :: Renderer -> CInt -> CInt -> CInt -> CInt -> Word8 -> Word8 -> Word8 -> Word8 -> Word8 -> IO CInt



