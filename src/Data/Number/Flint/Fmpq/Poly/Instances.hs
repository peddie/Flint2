{-# OPTIONS_HADDOCK hide, prune, ignore-exports #-}
module Data.Number.Flint.Fmpq.Poly.Instances (
  FmpqPoly (..)
) where

import GHC.Exts
import System.IO.Unsafe
import Control.Monad
import Foreign.C.String
import Foreign.Marshal.Alloc

import Data.Ratio hiding (numerator, denominator)
import Data.Number.Flint.Fmpq
import Data.Number.Flint.Fmpq.Poly

instance IsList FmpqPoly where
  type Item FmpqPoly = Fmpq
  fromList c =  unsafePerformIO $ do
    p <- newFmpqPoly
    withFmpqPoly p $ \p -> do
      forM_ [0..length c-1] $ \j -> do
        withFmpq (c!!j) $ \a -> 
          fmpq_poly_set_coeff_fmpq p (fromIntegral j) a
    return p
  toList p = snd $ unsafePerformIO $ do
    withFmpqPoly p $ \p -> do
      d <- fmpq_poly_degree p
      forM [0..d] $ \j -> do
        c <- newFmpq
        withFmpq c $ \c -> fmpq_poly_get_coeff_fmpq c p j
        return c
        
instance Show FmpqPoly where
  show p = snd $ unsafePerformIO $ do
    withFmpqPoly p $ \p -> do
      withCString "x" $ \x -> do
        cs <- fmpq_poly_get_str_pretty p x
        s <- peekCString cs
        free cs
        return s

instance Num FmpqPoly where
  (*) = lift2 fmpq_poly_mul
  (+) = lift2 fmpq_poly_add
  (-) = lift2 fmpq_poly_sub
  abs = undefined
  signum = undefined
  fromInteger = undefined

lift2 f x y = unsafePerformIO $ do
    result <- newFmpqPoly
    withFmpqPoly result $ \result -> do
      withFmpqPoly x $ \x -> do
        withFmpqPoly y $ \y -> do
          f result x y
    return result
