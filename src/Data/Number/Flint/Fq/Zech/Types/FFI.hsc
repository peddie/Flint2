{-|
module      :  Data.Number.Flint.Fq.Zech.Types.FFI
copyright   :  (c) 2022 Hartmut Monien
license     :  GNU GPL, version 2 or above (see LICENSE)
maintainer  :  hmonien@uni-bonn.de
-}
module Data.Number.Flint.Fq.Zech.Types.FFI where

import Foreign.Ptr
import Foreign.ForeignPtr
import Foreign.C.Types

import Data.Number.Flint.Flint

-- fq_zech_poly_t --------------------------------------------------------------

data FqZechPoly = FqZechPoly {-# UNPACK #-} !(ForeignPtr CFqZechPoly)
type CFqZechPoly = CFlint FqZechPoly

-- fq_zech_poly_factor_t -------------------------------------------------------

data FqZechPolyFactor = FqZechPolyFactor {-# UNPACK #-} !(ForeignPtr CFqZechPolyFactor)
data CFqZechPolyFactor = CFqZechPolyFactor (Ptr CFqZechPoly) (Ptr CLong) CLong CLong

-- fq_zech_mat_t ---------------------------------------------------------------

data FqZechMat = FqZechMat {-# UNPACK #-} !(ForeignPtr CFqZechMat)
type CFqZechMat = CFlint FqZechMat

