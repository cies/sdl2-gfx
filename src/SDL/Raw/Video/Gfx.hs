module SDL.Raw.Video.Gfx (
    aacircleRGBAFFI
  ) where

import Control.Monad.IO.Class
import Data.Word
import Foreign.C.String
import Foreign.C.Types
import Foreign.Ptr
import SDL.Raw.Enum
import SDL.Raw.Filesystem
import SDL.Raw.Types

foreign import ccall "SDL2_primitives.h aacircleRGBA" aacircleRGBAFFI :: Renderer -> CInt -> CInt -> CInt -> Word8 -> Word8 -> Word8 -> Word8 -> IO CInt

