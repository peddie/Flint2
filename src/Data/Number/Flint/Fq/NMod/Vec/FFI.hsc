module Data.Number.Flint.Fq.NMod.Vec.FFI (
  -- * Vectors over finite fields (word-size characteristic)
  -- * Memory management
    _fq_nmod_vec_init
  , _fq_nmod_vec_clear
  -- * Randomisation
  , _fq_nmod_vec_randtest
  -- * Input and output
  , _fq_nmod_vec_fprint
  , _fq_nmod_vec_print
  -- * Assignment and basic manipulation
  , _fq_nmod_vec_set
  , _fq_nmod_vec_swap
  , _fq_nmod_vec_zero
  , _fq_nmod_vec_neg
  -- * Comparison
  , _fq_nmod_vec_equal
  , _fq_nmod_vec_is_zero
  -- * Addition and subtraction
  , _fq_nmod_vec_add
  , _fq_nmod_vec_sub
  -- * Scalar multiplication and division
  , _fq_nmod_vec_scalar_addmul_fq_nmod
  , _fq_nmod_vec_scalar_submul_fq_nmod
  -- * Dot products
  , _fq_nmod_vec_dot
) where

-- Vectors over finite fields (word-size characteristic) -----------------------

import Foreign.C.String
import Foreign.C.Types
import qualified Foreign.Concurrent
import Foreign.ForeignPtr
import Foreign.Ptr ( Ptr )
import Foreign.Storable

import Data.Number.Flint.Flint
import Data.Number.Flint.Fmpz
import Data.Number.Flint.NMod.Poly
import Data.Number.Flint.NMod.Mat
import Data.Number.Flint.Fq
import Data.Number.Flint.Fq.NMod
import Data.Number.Flint.Fq.NMod.Mat
import Data.Number.Flint.Fq.NMod

#include <flint/flint.h>
#include <flint/fq_nmod.h>
#include <flint/fq_nmod_vec.h>

-- Memory management -----------------------------------------------------------

-- | /_fq_nmod_vec_init/ /len/ /ctx/ 
--
-- Returns an initialised vector of @fq_nmod@\'s of given length.
foreign import ccall "fq_nmod_vec.h _fq_nmod_vec_init"
  _fq_nmod_vec_init :: CLong -> Ptr CFqNModCtx -> IO (Ptr CFqNMod)

-- | /_fq_nmod_vec_clear/ /vec/ /len/ /ctx/ 
--
-- Clears the entries of @(vec, len)@ and frees the space allocated for
-- @vec@.
foreign import ccall "fq_nmod_vec.h _fq_nmod_vec_clear"
  _fq_nmod_vec_clear :: Ptr CFqNMod -> CLong -> Ptr CFqNModCtx -> IO ()

-- Randomisation ---------------------------------------------------------------

-- | /_fq_nmod_vec_randtest/ /f/ /state/ /len/ /ctx/ 
--
-- Sets the entries of a vector of the given length to elements of the
-- finite field.
foreign import ccall "fq_nmod_vec.h _fq_nmod_vec_randtest"
  _fq_nmod_vec_randtest ::Ptr CFqNMod -> Ptr CFRandState -> CLong -> Ptr CFqNModCtx -> IO ()

-- Input and output ------------------------------------------------------------

-- | /_fq_nmod_vec_fprint/ /file/ /vec/ /len/ /ctx/ 
--
-- Prints the vector of given length to the stream @file@. The format is
-- the length followed by two spaces, then a space separated list of
-- coefficients. If the length is zero, only \(0\) is printed.
-- 
-- In case of success, returns a positive value. In case of failure,
-- returns a non-positive value.
foreign import ccall "fq_nmod_vec.h _fq_nmod_vec_fprint"
  _fq_nmod_vec_fprint :: Ptr CFile -> Ptr CFqNMod -> CLong -> Ptr CFqNModCtx -> IO CInt

-- | /_fq_nmod_vec_print/ /vec/ /len/ /ctx/ 
--
-- Prints the vector of given length to @stdout@.
-- 
-- For further details, see @_fq_nmod_vec_fprint()@.
foreign import ccall "fq_nmod_vec.h _fq_nmod_vec_print"
  _fq_nmod_vec_print ::Ptr CFqNMod -> CLong -> Ptr CFqNModCtx -> IO CInt

-- Assignment and basic manipulation -------------------------------------------

-- | /_fq_nmod_vec_set/ /vec1/ /vec2/ /len2/ /ctx/ 
--
-- Makes a copy of @(vec2, len2)@ into @vec1@.
foreign import ccall "fq_nmod_vec.h _fq_nmod_vec_set"
  _fq_nmod_vec_set ::Ptr CFqNMod -> Ptr CFqNMod -> CLong -> Ptr CFqNModCtx -> IO ()

-- | /_fq_nmod_vec_swap/ /vec1/ /vec2/ /len2/ /ctx/ 
--
-- Swaps the elements in @(vec1, len2)@ and @(vec2, len2)@.
foreign import ccall "fq_nmod_vec.h _fq_nmod_vec_swap"
  _fq_nmod_vec_swap ::Ptr CFqNMod -> Ptr CFqNMod -> CLong -> Ptr CFqNModCtx -> IO ()

-- | /_fq_nmod_vec_zero/ /vec/ /len/ /ctx/ 
--
-- Zeros the entries of @(vec, len)@.
foreign import ccall "fq_nmod_vec.h _fq_nmod_vec_zero"
  _fq_nmod_vec_zero ::Ptr CFqNMod -> CLong -> Ptr CFqNModCtx -> IO ()

-- | /_fq_nmod_vec_neg/ /vec1/ /vec2/ /len2/ /ctx/ 
--
-- Negates @(vec2, len2)@ and places it into @vec1@.
foreign import ccall "fq_nmod_vec.h _fq_nmod_vec_neg"
  _fq_nmod_vec_neg ::Ptr CFqNMod -> Ptr CFqNMod -> CLong -> Ptr CFqNModCtx -> IO ()

-- Comparison ------------------------------------------------------------------

-- | /_fq_nmod_vec_equal/ /vec1/ /vec2/ /len/ /ctx/ 
--
-- Compares two vectors of the given length and returns \(1\) if they are
-- equal, otherwise returns \(0\).
foreign import ccall "fq_nmod_vec.h _fq_nmod_vec_equal"
  _fq_nmod_vec_equal ::Ptr CFqNMod -> Ptr CFqNMod -> CLong -> Ptr CFqNModCtx -> IO CInt

-- | /_fq_nmod_vec_is_zero/ /vec/ /len/ /ctx/ 
--
-- Returns \(1\) if @(vec, len)@ is zero, and \(0\) otherwise.
foreign import ccall "fq_nmod_vec.h _fq_nmod_vec_is_zero"
  _fq_nmod_vec_is_zero ::Ptr CFqNMod -> CLong -> Ptr CFqNModCtx -> IO CInt

-- Addition and subtraction ----------------------------------------------------

-- | /_fq_nmod_vec_add/ /res/ /vec1/ /vec2/ /len2/ /ctx/ 
--
-- Sets @(res, len2)@ to the sum of @(vec1, len2)@ and @(vec2, len2)@.
foreign import ccall "fq_nmod_vec.h _fq_nmod_vec_add"
  _fq_nmod_vec_add ::Ptr CFqNMod -> Ptr CFqNMod -> Ptr CFqNMod -> CLong -> Ptr CFqNModCtx -> IO ()

-- | /_fq_nmod_vec_sub/ /res/ /vec1/ /vec2/ /len2/ /ctx/ 
--
-- Sets @(res, len2)@ to @(vec1, len2)@ minus @(vec2, len2)@.
foreign import ccall "fq_nmod_vec.h _fq_nmod_vec_sub"
  _fq_nmod_vec_sub ::Ptr CFqNMod -> Ptr CFqNMod -> Ptr CFqNMod -> CLong -> Ptr CFqNModCtx -> IO ()

-- Scalar multiplication and division ------------------------------------------

-- | /_fq_nmod_vec_scalar_addmul_fq_nmod/ /vec1/ /vec2/ /len2/ /c/ /ctx/ 
--
-- Adds @(vec2, len2)@ times \(c\) to @(vec1, len2)@, where \(c\) is a
-- @fq_nmod_t@.
foreign import ccall "fq_nmod_vec.h _fq_nmod_vec_scalar_addmul_fq_nmod"
  _fq_nmod_vec_scalar_addmul_fq_nmod ::Ptr CFqNMod -> Ptr CFqNMod -> CLong -> Ptr CFqNMod -> Ptr CFqNModCtx -> IO ()

-- | /_fq_nmod_vec_scalar_submul_fq_nmod/ /vec1/ /vec2/ /len2/ /c/ /ctx/ 
--
-- Subtracts @(vec2, len2)@ times \(c\) from @(vec1, len2)@, where \(c\) is
-- a @fq_nmod_t@.
foreign import ccall "fq_nmod_vec.h _fq_nmod_vec_scalar_submul_fq_nmod"
  _fq_nmod_vec_scalar_submul_fq_nmod ::Ptr CFqNMod -> Ptr CFqNMod -> CLong -> Ptr CFqNMod -> Ptr CFqNModCtx -> IO ()

-- Dot products ----------------------------------------------------------------

-- | /_fq_nmod_vec_dot/ /res/ /vec1/ /vec2/ /len2/ /ctx/ 
--
-- Sets @res@ to the dot product of (@vec1@, @len@) and (@vec2@, @len@).
foreign import ccall "fq_nmod_vec.h _fq_nmod_vec_dot"
  _fq_nmod_vec_dot :: Ptr CFqNMod -> Ptr CFqNMod -> Ptr CFqNMod -> CLong -> Ptr CFqNModCtx -> IO ()

