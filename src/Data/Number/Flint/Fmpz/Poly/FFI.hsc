module Data.Number.Flint.Fmpz.Poly.FFI (
  -- * Univariate polynomials over the integers
    FmpzPoly (..)
  , CFmpzPoly (..)
  , newFmpzPoly
  , withFmpzPoly
  , withNewFmpzPoly
  -- * Memory management
  , fmpz_poly_init
  , fmpz_poly_init2
  , fmpz_poly_realloc
  , fmpz_poly_fit_length
  , fmpz_poly_clear
  , _fmpz_poly_normalise
  , _fmpz_poly_set_length
  , fmpz_poly_attach_truncate
  , fmpz_poly_attach_shift
  -- * Polynomial parameters
  , fmpz_poly_length
  , fmpz_poly_degree
  -- * Assignment and basic manipulation
  , fmpz_poly_set
  , fmpz_poly_set_si
  , fmpz_poly_set_ui
  , fmpz_poly_set_fmpz
  -- , fmpz_poly_set_mpz
  , _fmpz_poly_set_str
  , fmpz_poly_set_str
  , _fmpz_poly_get_str
  , fmpz_poly_get_str
  , _fmpz_poly_get_str_pretty
  , fmpz_poly_get_str_pretty
  , fmpz_poly_zero
  , fmpz_poly_one
  , fmpz_poly_zero_coeffs
  , fmpz_poly_swap
  , _fmpz_poly_reverse
  , fmpz_poly_reverse
  , fmpz_poly_truncate
  , fmpz_poly_set_trunc
  -- * Randomisation
  , fmpz_poly_randtest
  , fmpz_poly_randtest_unsigned
  , fmpz_poly_randtest_not_zero
  , fmpz_poly_randtest_no_real_root
  -- * Getting and setting coefficients
  , fmpz_poly_get_coeff_fmpz
  , fmpz_poly_get_coeff_si
  , fmpz_poly_get_coeff_ui
  , fmpz_poly_get_coeff_ptr
  , fmpz_poly_lead
  , fmpz_poly_set_coeff_fmpz
  , fmpz_poly_set_coeff_si
  , fmpz_poly_set_coeff_ui
  -- * Comparison
  , fmpz_poly_equal
  , fmpz_poly_equal_trunc
  , fmpz_poly_is_zero
  , fmpz_poly_is_one
  , fmpz_poly_is_unit
  , fmpz_poly_is_gen
  -- * Addition and subtraction
  , _fmpz_poly_add
  , fmpz_poly_add
  , fmpz_poly_add_series
  , _fmpz_poly_sub
  , fmpz_poly_sub
  , fmpz_poly_sub_series
  , fmpz_poly_neg
  -- * Scalar absolute value, multiplication and division
  , fmpz_poly_scalar_abs
  , fmpz_poly_scalar_mul_fmpz
  --, fmpz_poly_scalar_mul_mpz
  , fmpz_poly_scalar_mul_si
  , fmpz_poly_scalar_mul_ui
  , fmpz_poly_scalar_mul_2exp
  , fmpz_poly_scalar_addmul_si
  , fmpz_poly_scalar_addmul_ui
  , fmpz_poly_scalar_addmul_fmpz
  , fmpz_poly_scalar_submul_fmpz
  , fmpz_poly_scalar_fdiv_fmpz
  --, fmpz_poly_scalar_fdiv_mpz
  , fmpz_poly_scalar_fdiv_si
  , fmpz_poly_scalar_fdiv_ui
  , fmpz_poly_scalar_fdiv_2exp
  , fmpz_poly_scalar_tdiv_fmpz
  , fmpz_poly_scalar_tdiv_si
  , fmpz_poly_scalar_tdiv_ui
  , fmpz_poly_scalar_tdiv_2exp
  , fmpz_poly_scalar_divexact_fmpz
  --, fmpz_poly_scalar_divexact_mpz
  , fmpz_poly_scalar_divexact_si
  , fmpz_poly_scalar_divexact_ui
  , fmpz_poly_scalar_mod_fmpz
  , fmpz_poly_scalar_smod_fmpz
  , _fmpz_poly_remove_content_2exp
  , _fmpz_poly_scale_2exp
  -- * Bit packing
  , _fmpz_poly_bit_pack
  , _fmpz_poly_bit_unpack
  , _fmpz_poly_bit_unpack_unsigned
  , fmpz_poly_bit_pack
  , fmpz_poly_bit_unpack
  , fmpz_poly_bit_unpack_unsigned
  -- * Multiplication
  , _fmpz_poly_mul_classical
  , fmpz_poly_mul_classical
  , _fmpz_poly_mullow_classical
  , fmpz_poly_mullow_classical
  , _fmpz_poly_mulhigh_classical
  , fmpz_poly_mulhigh_classical
  , _fmpz_poly_mulmid_classical
  , fmpz_poly_mulmid_classical
  , _fmpz_poly_mul_karatsuba
  , fmpz_poly_mul_karatsuba
  , _fmpz_poly_mullow_karatsuba_n
  , fmpz_poly_mullow_karatsuba_n
  , _fmpz_poly_mulhigh_karatsuba_n
  , fmpz_poly_mulhigh_karatsuba_n
  , _fmpz_poly_mul_KS
  , fmpz_poly_mul_KS
  , _fmpz_poly_mullow_KS
  , fmpz_poly_mullow_KS
  , _fmpz_poly_mul_SS
  , fmpz_poly_mul_SS
  , _fmpz_poly_mullow_SS
  , fmpz_poly_mullow_SS
  , _fmpz_poly_mul
  , fmpz_poly_mul
  , _fmpz_poly_mullow
  , fmpz_poly_mullow
  , fmpz_poly_mulhigh_n
  , _fmpz_poly_mulhigh
  -- * FFT precached multiplication
  , fmpz_poly_mul_SS_precache_init
  , fmpz_poly_mul_precache_clear
  , _fmpz_poly_mullow_SS_precache
  , fmpz_poly_mullow_SS_precache
  , fmpz_poly_mul_SS_precache
  -- * Squaring
  , _fmpz_poly_sqr_KS
  , fmpz_poly_sqr_KS
  , _fmpz_poly_sqr_karatsuba
  , fmpz_poly_sqr_karatsuba
  , _fmpz_poly_sqr_classical
  , fmpz_poly_sqr_classical
  , _fmpz_poly_sqr
  , fmpz_poly_sqr
  , _fmpz_poly_sqrlow_KS
  , fmpz_poly_sqrlow_KS
  , _fmpz_poly_sqrlow_karatsuba_n
  , fmpz_poly_sqrlow_karatsuba_n
  , _fmpz_poly_sqrlow_classical
  , fmpz_poly_sqrlow_classical
  , _fmpz_poly_sqrlow
  , fmpz_poly_sqrlow
  -- * Powering
  , _fmpz_poly_pow_multinomial
  , fmpz_poly_pow_multinomial
  , _fmpz_poly_pow_binomial
  , fmpz_poly_pow_binomial
  , _fmpz_poly_pow_addchains
  , fmpz_poly_pow_addchains
  , _fmpz_poly_pow_binexp
  , fmpz_poly_pow_binexp
  , _fmpz_poly_pow_small
  , _fmpz_poly_pow
  , fmpz_poly_pow
  , _fmpz_poly_pow_trunc
  , fmpz_poly_pow_trunc
  -- * Shifting
  , _fmpz_poly_shift_left
  , fmpz_poly_shift_left
  , _fmpz_poly_shift_right
  , fmpz_poly_shift_right
  -- * Bit sizes and norms
  , fmpz_poly_max_limbs
  , fmpz_poly_max_bits
  , fmpz_poly_height
  , _fmpz_poly_2norm
  , fmpz_poly_2norm
  , _fmpz_poly_2norm_normalised_bits
  -- * Greatest common divisor
  , _fmpz_poly_gcd_subresultant
  , fmpz_poly_gcd_subresultant
  , _fmpz_poly_gcd_heuristic
  , fmpz_poly_gcd_heuristic
  , _fmpz_poly_gcd_modular
  , fmpz_poly_gcd_modular
  , _fmpz_poly_gcd
  , fmpz_poly_gcd
  , _fmpz_poly_xgcd_modular
  , fmpz_poly_xgcd_modular
  , _fmpz_poly_xgcd
  , fmpz_poly_xgcd
  , _fmpz_poly_lcm
  , fmpz_poly_lcm
  , _fmpz_poly_resultant_modular
  , fmpz_poly_resultant_modular
  , fmpz_poly_resultant_modular_div
  , _fmpz_poly_resultant_euclidean
  , fmpz_poly_resultant_euclidean
  , _fmpz_poly_resultant
  , fmpz_poly_resultant
  -- * Discriminant
  , _fmpz_poly_discriminant
  , fmpz_poly_discriminant
  -- * Gaussian content
  , _fmpz_poly_content
  , fmpz_poly_content
  , _fmpz_poly_primitive_part
  , fmpz_poly_primitive_part
  -- * Square-free
  , _fmpz_poly_is_squarefree
  , fmpz_poly_is_squarefree
  -- * Euclidean division
  , _fmpz_poly_divrem_basecase
  , fmpz_poly_divrem_basecase
  , _fmpz_poly_divrem_divconquer_recursive
  , _fmpz_poly_divrem_divconquer
  , fmpz_poly_divrem_divconquer
  , _fmpz_poly_divrem
  , fmpz_poly_divrem
  , _fmpz_poly_div_basecase
  , fmpz_poly_div_basecase
  , _fmpz_poly_divremlow_divconquer_recursive
  , _fmpz_poly_div_divconquer_recursive
  , _fmpz_poly_div_divconquer
  , fmpz_poly_div_divconquer
  , _fmpz_poly_div
  , fmpz_poly_div
  , _fmpz_poly_rem_basecase
  , fmpz_poly_rem_basecase
  , _fmpz_poly_rem
  , fmpz_poly_rem
  , _fmpz_poly_div_root
  , fmpz_poly_div_root
  -- * Division with precomputed inverse
  , _fmpz_poly_preinvert
  , fmpz_poly_preinvert
  , _fmpz_poly_div_preinv
  , fmpz_poly_div_preinv
  , _fmpz_poly_divrem_preinv
  , fmpz_poly_divrem_preinv
  , _fmpz_poly_powers_precompute
  , fmpz_poly_powers_precompute
  , _fmpz_poly_powers_clear
  , fmpz_poly_powers_clear
  , _fmpz_poly_rem_powers_precomp
  , fmpz_poly_rem_powers_precomp
  -- * Divisibility testing
  , _fmpz_poly_divides
  , fmpz_poly_divides
  , fmpz_poly_remove
  -- * Division mod p
  , fmpz_poly_divlow_smodp
  , fmpz_poly_divhigh_smodp
  -- * Power series division
  , _fmpz_poly_inv_series_basecase
  , fmpz_poly_inv_series_basecase
  , _fmpz_poly_inv_series_newton
  , fmpz_poly_inv_series_newton
  , _fmpz_poly_inv_series
  , fmpz_poly_inv_series
  , _fmpz_poly_div_series_basecase
  , _fmpz_poly_div_series_divconquer
  , _fmpz_poly_div_series
  , fmpz_poly_div_series_basecase
  , fmpz_poly_div_series_divconquer
  , fmpz_poly_div_series
  -- * Pseudo division
  , _fmpz_poly_pseudo_divrem_basecase
  , fmpz_poly_pseudo_divrem_basecase
  , _fmpz_poly_pseudo_divrem_divconquer
  , fmpz_poly_pseudo_divrem_divconquer
  , _fmpz_poly_pseudo_divrem_cohen
  , fmpz_poly_pseudo_divrem_cohen
  , _fmpz_poly_pseudo_rem_cohen
  , fmpz_poly_pseudo_rem_cohen
  --, _fmpz_poly_pseudo_divrem
  --, fmpz_poly_pseudo_divrem
  , _fmpz_poly_pseudo_div
  , fmpz_poly_pseudo_div
  , _fmpz_poly_pseudo_rem
  , fmpz_poly_pseudo_rem
  -- * Derivative
  , _fmpz_poly_derivative
  , fmpz_poly_derivative
  , _fmpz_poly_nth_derivative
  , fmpz_poly_nth_derivative
  -- * Evaluation
  , _fmpz_poly_evaluate_divconquer_fmpz
  , fmpz_poly_evaluate_divconquer_fmpz
  , _fmpz_poly_evaluate_horner_fmpz
  , fmpz_poly_evaluate_horner_fmpz
  , _fmpz_poly_evaluate_fmpz
  , fmpz_poly_evaluate_fmpz
  , _fmpz_poly_evaluate_divconquer_fmpq
  , fmpz_poly_evaluate_divconquer_fmpq
  , _fmpz_poly_evaluate_horner_fmpq
  , fmpz_poly_evaluate_horner_fmpq
  , _fmpz_poly_evaluate_fmpq
  , fmpz_poly_evaluate_fmpq
  -- , fmpz_poly_evaluate_mpq
  , _fmpz_poly_evaluate_mod
  , fmpz_poly_evaluate_mod
  , fmpz_poly_evaluate_fmpz_vec
  , _fmpz_poly_evaluate_horner_d
  , fmpz_poly_evaluate_horner_d
  , _fmpz_poly_evaluate_horner_d_2exp
  , fmpz_poly_evaluate_horner_d_2exp
  , _fmpz_poly_evaluate_horner_d_2exp2
  -- * Newton basis
  , _fmpz_poly_monomial_to_newton
  , _fmpz_poly_newton_to_monomial
  -- * Interpolation
  , fmpz_poly_interpolate_fmpz_vec
  -- * Composition
  , _fmpz_poly_compose_horner
  , fmpz_poly_compose_horner
  , _fmpz_poly_compose_divconquer
  , fmpz_poly_compose_divconquer
  , _fmpz_poly_compose
  , fmpz_poly_compose
  -- * Inflation and deflation
  , fmpz_poly_inflate
  , fmpz_poly_deflate
  , fmpz_poly_deflation
  -- * Taylor shift
  , _fmpz_poly_taylor_shift_horner
  , fmpz_poly_taylor_shift_horner
  , _fmpz_poly_taylor_shift_divconquer
  , fmpz_poly_taylor_shift_divconquer
  , _fmpz_poly_taylor_shift_multi_mod
  , fmpz_poly_taylor_shift_multi_mod
  , _fmpz_poly_taylor_shift
  , fmpz_poly_taylor_shift
  -- * Power series composition
  , _fmpz_poly_compose_series_horner
  , fmpz_poly_compose_series_horner
  , _fmpz_poly_compose_series_brent_kung
  , fmpz_poly_compose_series_brent_kung
  , _fmpz_poly_compose_series
  , fmpz_poly_compose_series
  -- * Power series reversion
  , _fmpz_poly_revert_series_lagrange
  , fmpz_poly_revert_series_lagrange
  , _fmpz_poly_revert_series_lagrange_fast
  , fmpz_poly_revert_series_lagrange_fast
  , _fmpz_poly_revert_series_newton
  , fmpz_poly_revert_series_newton
  , _fmpz_poly_revert_series
  , fmpz_poly_revert_series
  -- * Square root
  , _fmpz_poly_sqrtrem_classical
  , fmpz_poly_sqrtrem_classical
  , _fmpz_poly_sqrtrem_divconquer
  , fmpz_poly_sqrtrem_divconquer
  , _fmpz_poly_sqrt_classical
  , fmpz_poly_sqrt_classical
  , _fmpz_poly_sqrt_KS
  , fmpz_poly_sqrt_KS
  , _fmpz_poly_sqrt_divconquer
  , fmpz_poly_sqrt_divconquer
  , _fmpz_poly_sqrt
  , fmpz_poly_sqrt
  , _fmpz_poly_sqrt_series
  , fmpz_poly_sqrt_series
  -- * Power sums
  , _fmpz_poly_power_sums_naive
  , fmpz_poly_power_sums_naive
  , fmpz_poly_power_sums
  , _fmpz_poly_power_sums_to_poly
  , fmpz_poly_power_sums_to_poly
  -- * Signature
  , _fmpz_poly_signature
  , fmpz_poly_signature
  -- * Hensel lifting
  , fmpz_poly_hensel_build_tree
  , fmpz_poly_hensel_lift
  , fmpz_poly_hensel_lift_without_inverse
  , fmpz_poly_hensel_lift_only_inverse
  , fmpz_poly_hensel_lift_tree_recursive
  , fmpz_poly_hensel_lift_tree
  , _fmpz_poly_hensel_start_lift
  , _fmpz_poly_hensel_continue_lift
  , fmpz_poly_hensel_lift_once
  -- * Input and output
  , _fmpz_poly_print
  , fmpz_poly_print
  , _fmpz_poly_print_pretty
  , fmpz_poly_print_pretty
  , _fmpz_poly_fprint
  , fmpz_poly_fprint
  , _fmpz_poly_fprint_pretty
  , fmpz_poly_fprint_pretty
  , fmpz_poly_read
  , fmpz_poly_read_pretty
  , fmpz_poly_fread
  , fmpz_poly_fread_pretty
  -- * Modular reduction and reconstruction
  , fmpz_poly_get_nmod_poly
  , fmpz_poly_set_nmod_poly
  , fmpz_poly_set_nmod_poly_unsigned
  , _fmpz_poly_CRT_ui_precomp
  , _fmpz_poly_CRT_ui
  , fmpz_poly_CRT_ui
  -- * Products
  , _fmpz_poly_product_roots_fmpz_vec
  , fmpz_poly_product_roots_fmpz_vec
  , _fmpz_poly_product_roots_fmpq_vec
  , fmpz_poly_product_roots_fmpq_vec
  -- * Roots
  , _fmpz_poly_bound_roots
  , _fmpz_poly_num_real_roots_sturm
  , fmpz_poly_num_real_roots_sturm
  , _fmpz_poly_num_real_roots
  , fmpz_poly_num_real_roots
  -- * Minimal polynomials
  , _fmpz_poly_cyclotomic
  , fmpz_poly_cyclotomic
  , _fmpz_poly_is_cyclotomic
  , _fmpz_poly_cos_minpoly
  , _fmpz_poly_swinnerton_dyer
  -- * Orthogonal polynomials
  , _fmpz_poly_chebyshev_t
  , _fmpz_poly_chebyshev_u
  , _fmpz_poly_legendre_pt
  , fmpz_poly_legendre_pt
  , _fmpz_poly_hermite_h
  , fmpz_poly_hermite_h
  , _fmpz_poly_hermite_he
  , fmpz_poly_hermite_he
  -- * Fibonacci polynomials
  , _fmpz_poly_fibonacci
  , fmpz_poly_fibonacci
  -- THIS DOES NOT SEEM TO EXIST IN THE ACTUAL IMPLEMENTATION
  -- -- * Eulerian numbers and polynomials
  -- , arith_eulerian_polynomial
  -- * Modular forms and q-series
  , _fmpz_poly_eta_qexp
  , _fmpz_poly_theta_qexp
  -- * CLD bounds
  , fmpz_poly_CLD_bound
) where 

-- univariate polynomials over the integers ------------------------------------

import Control.Monad

import Foreign.C.String
import Foreign.C.Types
import Foreign.ForeignPtr
import Foreign.Ptr ( Ptr, FunPtr, nullPtr, plusPtr )
import Foreign.Storable
import Foreign.Marshal ( free )
import Foreign.Marshal.Array ( advancePtr )

import Data.Number.Flint.Flint
import Data.Number.Flint.Fmpz
import Data.Number.Flint.Fmpq
import Data.Number.Flint.NMod.Types

#include <flint/flint.h>
#include <flint/fmpz.h>
#include <flint/fmpq.h>
#include <flint/fmpz_poly.h>

-- fmpz_poly_t -----------------------------------------------------------------

data FmpzPoly = FmpzPoly {-# UNPACK #-} !(ForeignPtr CFmpzPoly)
data CFmpzPoly = CFmpzPoly (Ptr CFmpz) CLong CLong

instance Storable CFmpzPoly where
  {-# INLINE sizeOf #-}
  sizeOf _ = #{size fmpz_poly_t}
  {-# INLINE alignment #-}
  alignment _ = #{alignment fmpz_poly_t}
  peek ptr = do
    coeffs <- #{peek fmpz_poly_struct, coeffs} ptr
    alloc  <- #{peek fmpz_poly_struct, alloc } ptr
    length <- #{peek fmpz_poly_struct, length} ptr
    return $ CFmpzPoly coeffs alloc length
  poke = error "CFmpzPoly.poke: Not defined"

-- | Create a new `FmpzPoly`
newFmpzPoly = do
  p <- mallocForeignPtr
  withForeignPtr p fmpz_poly_init
  addForeignPtrFinalizer p_fmpz_poly_clear p
  return $ FmpzPoly p

-- | Use a `FmpzPoly`
{-# INLINE withFmpzPoly #-}
withFmpzPoly (FmpzPoly p) f = do
  withForeignPtr p $ \fp -> f fp >>= return . (FmpzPoly p,)

-- | Create and use a new `FmpzPoly`
withNewFmpzPoly f = do
  x <- newFmpzPoly
  withFmpzPoly x $ \x -> f x

-- fmpz_poly_powers_precomp_t --------------------------------------------------

-- | Data structure containing the /CFmpzPolyPowersPrecomp/ pointer
data FmpzPolyPowersPrecomp = FmpzPolyPowersPrecomp
  {-# UNPACK #-} !(ForeignPtr CFmpzPolyPowersPrecomp) 
type CFmpzPolyPowersPrecomp = CFlint FmpzPolyPowersPrecomp

-- fmpz_poly_factor_t ----------------------------------------------------------

-- | Data structure containing the /CFmpzPolyFactor/ pointer
data FmpzPolyFactor = FmpzPolyFactor
  {-# UNPACK #-} !(ForeignPtr CFmpzPolyFactor) 
type CFmpzPolyFactor = CFlint FmpzPolyFactor

-- fmpz_poly_mul_precache_t ----------------------------------------------------

-- | Data structure containing the /CFmpzPolyMulPrecache/ pointer
data FmpzPolyMulPrecache = FmpzPolyMulPrecache
  {-# UNPACK #-} !(ForeignPtr CFmpzPolyMulPrecache) 
type CFmpzPolyMulPrecache = CFlint FmpzPolyMulPrecache

-- Memory management -----------------------------------------------------------

-- | /fmpz_poly_init/ /poly/ 
-- 
-- Initialises @poly@ for use, setting its length to zero. A corresponding
-- call to @fmpz_poly_clear@ must be made after finishing with the
-- @fmpz_poly_t@ to free the memory used by the polynomial.
foreign import ccall "fmpz_poly.h fmpz_poly_init"
  fmpz_poly_init :: Ptr CFmpzPoly -> IO ()

-- | /fmpz_poly_init2/ /poly/ /alloc/ 
-- 
-- Initialises @poly@ with space for at least @alloc@ coefficients and sets
-- the length to zero. The allocated coefficients are all set to zero.
foreign import ccall "fmpz_poly.h fmpz_poly_init2"
  fmpz_poly_init2 :: Ptr CFmpzPoly -> CLong -> IO ()

-- | /fmpz_poly_realloc/ /poly/ /alloc/ 
-- 
-- Reallocates the given polynomial to have space for @alloc@ coefficients.
-- If @alloc@ is zero the polynomial is cleared and then reinitialised. If
-- the current length is greater than @alloc@ the polynomial is first
-- truncated to length @alloc@.
foreign import ccall "fmpz_poly.h fmpz_poly_realloc"
  fmpz_poly_realloc :: Ptr CFmpzPoly -> CLong -> IO ()

-- | /fmpz_poly_fit_length/ /poly/ /len/ 
-- 
-- If @len@ is greater than the number of coefficients currently allocated,
-- then the polynomial is reallocated to have space for at least @len@
-- coefficients. No data is lost when calling this function.
-- 
-- The function efficiently deals with the case where @fit_length@ is
-- called many times in small increments by at least doubling the number of
-- allocated coefficients when length is larger than the number of
-- coefficients currently allocated.
foreign import ccall "fmpz_poly.h fmpz_poly_fit_length"
  fmpz_poly_fit_length :: Ptr CFmpzPoly -> CLong -> IO ()

-- | /fmpz_poly_clear/ /poly/ 
-- 
-- Clears the given polynomial, releasing any memory used. It must be
-- reinitialised in order to be used again.
foreign import ccall "fmpz_poly.h fmpz_poly_clear"
  fmpz_poly_clear :: Ptr CFmpzPoly -> IO ()

foreign import ccall "fmpz_poly.h &fmpz_poly_clear"
  p_fmpz_poly_clear :: FunPtr (Ptr CFmpzPoly -> IO ())

-- | /_fmpz_poly_normalise/ /poly/ 
-- 
-- Sets the length of @poly@ so that the top coefficient is non-zero. If
-- all coefficients are zero, the length is set to zero. This function is
-- mainly used internally, as all functions guarantee normalisation.
foreign import ccall "fmpz_poly.h _fmpz_poly_normalise"
  _fmpz_poly_normalise :: Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_set_length/ /poly/ /newlen/ 
-- 
-- Demotes the coefficients of @poly@ beyond @newlen@ and sets the length
-- of @poly@ to @newlen@.
foreign import ccall "fmpz_poly.h _fmpz_poly_set_length"
  _fmpz_poly_set_length :: Ptr CFmpzPoly -> CLong -> IO ()

-- | /fmpz_poly_attach_truncate/ /trunc/ /poly/ /n/ 
-- 
-- This function sets the uninitialised polynomial @trunc@ to the low \(n\)
-- coefficients of @poly@, or to @poly@ if the latter doesn\'t have \(n\)
-- coefficients. The polynomial @trunc@ not be cleared or used as the
-- output of any Flint functions.
foreign import ccall "fmpz_poly.h fmpz_poly_attach_truncate"
  fmpz_poly_attach_truncate :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /fmpz_poly_attach_shift/ /trunc/ /poly/ /n/ 
-- 
-- This function sets the uninitialised polynomial @trunc@ to the high
-- coefficients of @poly@, i.e. the coefficients not among the low \(n\)
-- coefficients of @poly@. If the latter doesn\'t have \(n\) coefficients
-- @trunc@ is set to the zero polynomial. The polynomial @trunc@ not be
-- cleared or used as the output of any Flint functions.
foreign import ccall "fmpz_poly.h fmpz_poly_attach_shift"
  fmpz_poly_attach_shift :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- Polynomial parameters -------------------------------------------------------

-- | /fmpz_poly_length/ /poly/ 
-- 
-- Returns the length of @poly@. The zero polynomial has length zero.
foreign import ccall "fmpz_poly.h fmpz_poly_length"
  fmpz_poly_length :: Ptr CFmpzPoly -> IO CLong

-- | /fmpz_poly_degree/ /poly/ 
-- 
-- Returns the degree of @poly@, which is one less than its length.
foreign import ccall "fmpz_poly.h fmpz_poly_degree"
  fmpz_poly_degree :: Ptr CFmpzPoly -> IO CLong

-- Assignment and basic manipulation -------------------------------------------

-- | /fmpz_poly_set/ /poly1/ /poly2/ 
-- 
-- Sets @poly1@ to equal @poly2@.
foreign import ccall "fmpz_poly.h fmpz_poly_set"
  fmpz_poly_set :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /fmpz_poly_set_si/ /poly/ /c/ 
-- 
-- Sets @poly@ to the signed integer @c@.
foreign import ccall "fmpz_poly.h fmpz_poly_set_si"
  fmpz_poly_set_si :: Ptr CFmpzPoly -> CLong -> IO ()

-- | /fmpz_poly_set_ui/ /poly/ /c/ 
-- 
-- Sets @poly@ to the unsigned integer @c@.
foreign import ccall "fmpz_poly.h fmpz_poly_set_ui"
  fmpz_poly_set_ui :: Ptr CFmpzPoly -> CULong -> IO ()

-- | /fmpz_poly_set_fmpz/ /poly/ /c/ 
-- 
-- Sets @poly@ to the integer @c@.
foreign import ccall "fmpz_poly.h fmpz_poly_set_fmpz"
  fmpz_poly_set_fmpz :: Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- -- | /fmpz_poly_set_mpz/ /poly/ /c/ 
-- -- 
-- -- Sets @poly@ to the integer @c@.
-- foreign import ccall "fmpz_poly.h fmpz_poly_set_mpz"
--   fmpz_poly_set_mpz :: Ptr CFmpzPoly -> Ptr CMpz -> IO ()

-- | /_fmpz_poly_set_str/ /poly/ /str/ 
-- 
-- Sets @poly@ to the polynomial encoded in the null-terminated string
-- @str@. Assumes that @poly@ is allocated as a sufficiently large array
-- suitable for the number of coefficients present in @str@.
-- 
-- Returns \(0\) if no error occurred. Otherwise, returns a non-zero value,
-- in which case the resulting value of @poly@ is undefined. If @str@ is
-- not null-terminated, calling this method might result in a segmentation
-- fault.
foreign import ccall "fmpz_poly.h _fmpz_poly_set_str"
  _fmpz_poly_set_str :: Ptr CFmpz -> CString -> IO CInt

-- | /fmpz_poly_set_str/ /poly/ /str/ 
-- 
-- Imports a polynomial from a null-terminated string. If the string @str@
-- represents a valid polynomial returns \(0\), otherwise returns \(1\).
-- 
-- Returns \(0\) if no error occurred. Otherwise, returns a non-zero value,
-- in which case the resulting value of @poly@ is undefined. If @str@ is
-- not null-terminated, calling this method might result in a segmentation
-- fault.
foreign import ccall "fmpz_poly.h fmpz_poly_set_str"
  fmpz_poly_set_str :: Ptr CFmpzPoly -> CString -> IO CInt

-- | /_fmpz_poly_get_str/ /poly/ /len/ 
-- 
-- Returns the plain FLINT string representation of the polynomial
-- @(poly, len)@.
foreign import ccall "fmpz_poly.h _fmpz_poly_get_str"
  _fmpz_poly_get_str :: Ptr CFmpz -> CLong -> IO CString

-- | /fmpz_poly_get_str/ /poly/ 
-- 
-- Returns the plain FLINT string representation of the polynomial @poly@.
foreign import ccall "fmpz_poly.h fmpz_poly_get_str"
  fmpz_poly_get_str :: Ptr CFmpzPoly -> IO CString

-- | /_fmpz_poly_get_str_pretty/ /poly/ /len/ /x/ 
-- 
-- Returns a pretty representation of the polynomial @(poly, len)@ using
-- the null-terminated string @x@ as the variable name.
foreign import ccall "fmpz_poly.h _fmpz_poly_get_str_pretty"
  _fmpz_poly_get_str_pretty :: Ptr CFmpz -> CLong -> CString -> IO CString

-- | /fmpz_poly_get_str_pretty/ /poly/ /x/ 
-- 
-- Returns a pretty representation of the polynomial @poly@ using the
-- null-terminated string @x@ as the variable name.
foreign import ccall "fmpz_poly.h fmpz_poly_get_str_pretty"
  fmpz_poly_get_str_pretty :: Ptr CFmpzPoly -> CString -> IO CString

-- | /fmpz_poly_zero/ /poly/ 
-- 
-- Sets @poly@ to the zero polynomial.
foreign import ccall "fmpz_poly.h fmpz_poly_zero"
  fmpz_poly_zero :: Ptr CFmpzPoly -> IO ()

-- | /fmpz_poly_one/ /poly/ 
-- 
-- Sets @poly@ to the constant polynomial one.
foreign import ccall "fmpz_poly.h fmpz_poly_one"
  fmpz_poly_one :: Ptr CFmpzPoly -> IO ()

-- | /fmpz_poly_zero_coeffs/ /poly/ /i/ /j/ 
-- 
-- Sets the coefficients of \(x^i, \dotsc, x^{j-1}\) to zero.
foreign import ccall "fmpz_poly.h fmpz_poly_zero_coeffs"
  fmpz_poly_zero_coeffs :: Ptr CFmpzPoly -> CLong -> CLong -> IO ()

-- | /fmpz_poly_swap/ /poly1/ /poly2/ 
-- 
-- Swaps @poly1@ and @poly2@. This is done efficiently without copying data
-- by swapping pointers, etc.
foreign import ccall "fmpz_poly.h fmpz_poly_swap"
  fmpz_poly_swap :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_reverse/ /res/ /poly/ /len/ /n/ 
-- 
-- Sets @(res, n)@ to the reverse of @(poly, n)@, where @poly@ is in fact
-- an array of length @len@. Assumes that @0 \< len \<= n@. Supports
-- aliasing of @res@ and @poly@, but the behaviour is undefined in case of
-- partial overlap.
foreign import ccall "fmpz_poly.h _fmpz_poly_reverse"
  _fmpz_poly_reverse :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_reverse/ /res/ /poly/ /n/ 
-- 
-- This function considers the polynomial @poly@ to be of length \(n\),
-- notionally truncating and zero padding if required, and reverses the
-- result. Since the function normalises its result @res@ may be of length
-- less than \(n\).
foreign import ccall "fmpz_poly.h fmpz_poly_reverse"
  fmpz_poly_reverse :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /fmpz_poly_truncate/ /poly/ /newlen/ 
-- 
-- If the current length of @poly@ is greater than @newlen@, it is
-- truncated to have the given length. Discarded coefficients are not
-- necessarily set to zero.
foreign import ccall "fmpz_poly.h fmpz_poly_truncate"
  fmpz_poly_truncate :: Ptr CFmpzPoly -> CLong -> IO ()

-- | /fmpz_poly_set_trunc/ /res/ /poly/ /n/ 
-- 
-- Sets @res@ to a copy of @poly@, truncated to length @n@.
foreign import ccall "fmpz_poly.h fmpz_poly_set_trunc"
  fmpz_poly_set_trunc :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- Randomisation ---------------------------------------------------------------

-- | /fmpz_poly_randtest/ /f/ /state/ /len/ /bits/ 
-- 
-- Sets \(f\) to a random polynomial with up to the given length and where
-- each coefficient has up to the given number of bits. The coefficients
-- are signed randomly. One must call @flint_randinit@ before calling this
-- function.
foreign import ccall "fmpz_poly.h fmpz_poly_randtest"
  fmpz_poly_randtest :: Ptr CFmpzPoly -> Ptr CFRandState -> CLong -> CFBitCnt -> IO ()

-- | /fmpz_poly_randtest_unsigned/ /f/ /state/ /len/ /bits/ 
-- 
-- Sets \(f\) to a random polynomial with up to the given length and where
-- each coefficient has up to the given number of bits. One must call
-- @flint_randinit@ before calling this function.
foreign import ccall "fmpz_poly.h fmpz_poly_randtest_unsigned"
  fmpz_poly_randtest_unsigned :: Ptr CFmpzPoly -> Ptr CFRandState -> CLong -> CFBitCnt -> IO ()

-- | /fmpz_poly_randtest_not_zero/ /f/ /state/ /len/ /bits/ 
-- 
-- As for @fmpz_poly_randtest@ except that @len@ and bits may not be zero
-- and the polynomial generated is guaranteed not to be the zero
-- polynomial. One must call @flint_randinit@ before calling this function.
foreign import ccall "fmpz_poly.h fmpz_poly_randtest_not_zero"
  fmpz_poly_randtest_not_zero :: Ptr CFmpzPoly -> Ptr CFRandState -> CLong -> CFBitCnt -> IO ()

-- | /fmpz_poly_randtest_no_real_root/ /p/ /state/ /len/ /bits/ 
-- 
-- Sets @p@ to a random polynomial without any real root, whose length is
-- up to @len@ and where each coefficient has up to the given number of
-- bits. One must call @flint_randinit@ before calling this function.
foreign import ccall "fmpz_poly.h fmpz_poly_randtest_no_real_root"
  fmpz_poly_randtest_no_real_root :: Ptr CFmpzPoly -> Ptr CFRandState -> CLong -> CFBitCnt -> IO ()

-- Getting and setting coefficients --------------------------------------------

-- | /fmpz_poly_get_coeff_fmpz/ /x/ /poly/ /n/ 
-- 
-- Sets \(x\) to the \(n\)-th coefficient of @poly@. Coefficient numbering
-- is from zero and if \(n\) is set to a value beyond the end of the
-- polynomial, zero is returned.
foreign import ccall "fmpz_poly.h fmpz_poly_get_coeff_fmpz"
  fmpz_poly_get_coeff_fmpz :: Ptr CFmpz -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /fmpz_poly_get_coeff_si/ /poly/ /n/ 
-- 
-- Returns coefficient \(n\) of @poly@ as a @slong@. The result is
-- undefined if the value does not fit into a @slong@. Coefficient
-- numbering is from zero and if \(n\) is set to a value beyond the end of
-- the polynomial, zero is returned.
foreign import ccall "fmpz_poly.h fmpz_poly_get_coeff_si"
  fmpz_poly_get_coeff_si :: Ptr CFmpzPoly -> CLong -> IO CLong

-- | /fmpz_poly_get_coeff_ui/ /poly/ /n/ 
-- 
-- Returns coefficient \(n\) of @poly@ as a @ulong@. The result is
-- undefined if the value does not fit into a @ulong@. Coefficient
-- numbering is from zero and if \(n\) is set to a value beyond the end of
-- the polynomial, zero is returned.
foreign import ccall "fmpz_poly.h fmpz_poly_get_coeff_ui"
  fmpz_poly_get_coeff_ui :: Ptr CFmpzPoly -> CLong -> IO CULong

-- | /fmpz_poly_get_coeff_ptr/ /poly/ /n/ 
-- 
-- Returns a reference to the coefficient of \(x^n\) in the polynomial, as
-- an @fmpz *@. This function is provided so that individual coefficients
-- can be accessed and operated on by functions in the @fmpz@ module. This
-- function does not make a copy of the data, but returns a reference to
-- the actual coefficient.
-- 
-- Returns @NULL@ when \(n\) exceeds the degree of the polynomial.
-- 
-- This function is implemented as a macro.
fmpz_poly_get_coeff_ptr :: Ptr CFmpzPoly -> CLong -> IO (Ptr CFmpz)
fmpz_poly_get_coeff_ptr poly j = do
  CFmpzPoly coeffs _ n <- peek poly
  return $ if 0 <= j && j < n then
             (coeffs `advancePtr` (fromIntegral j))
           else
             nullPtr
-- | /fmpz_poly_lead/ /poly/ 
-- 
-- Returns a reference to the leading coefficient of the polynomial, as an
-- @fmpz *@. This function is provided so that the leading coefficient can
-- be easily accessed and operated on by functions in the @fmpz@ module.
-- This function does not make a copy of the data, but returns a reference
-- to the actual coefficient.
-- 
-- Returns @NULL@ when the polynomial is zero.
-- 
-- This function is implemented as a macro.
fmpz_poly_lead :: Ptr CFmpzPoly -> IO (Ptr CFmpz)
fmpz_poly_lead poly = do
  CFmpzPoly coeffs _ n <- peek poly
  return $ coeffs `advancePtr` (fromIntegral $ pred $ n)

-- | /fmpz_poly_set_coeff_fmpz/ /poly/ /n/ /x/ 
-- 
-- Sets coefficient \(n\) of @poly@ to the @fmpz@ value @x@. Coefficient
-- numbering starts from zero and if \(n\) is beyond the current length of
-- @poly@ then the polynomial is extended and zero coefficients inserted if
-- necessary.
foreign import ccall "fmpz_poly.h fmpz_poly_set_coeff_fmpz"
  fmpz_poly_set_coeff_fmpz :: Ptr CFmpzPoly -> CLong -> Ptr CFmpz -> IO ()

-- | /fmpz_poly_set_coeff_si/ /poly/ /n/ /x/ 
-- 
-- Sets coefficient \(n\) of @poly@ to the @slong@ value @x@. Coefficient
-- numbering starts from zero and if \(n\) is beyond the current length of
-- @poly@ then the polynomial is extended and zero coefficients inserted if
-- necessary.
foreign import ccall "fmpz_poly.h fmpz_poly_set_coeff_si"
  fmpz_poly_set_coeff_si :: Ptr CFmpzPoly -> CLong -> CLong -> IO ()

-- | /fmpz_poly_set_coeff_ui/ /poly/ /n/ /x/ 
-- 
-- Sets coefficient \(n\) of @poly@ to the @ulong@ value @x@. Coefficient
-- numbering starts from zero and if \(n\) is beyond the current length of
-- @poly@ then the polynomial is extended and zero coefficients inserted if
-- necessary.
foreign import ccall "fmpz_poly.h fmpz_poly_set_coeff_ui"
  fmpz_poly_set_coeff_ui :: Ptr CFmpzPoly -> CLong -> CULong -> IO ()

-- Comparison ------------------------------------------------------------------

-- | /fmpz_poly_equal/ /poly1/ /poly2/ 
-- 
-- Returns \(1\) if @poly1@ is equal to @poly2@, otherwise returns \(0\).
-- The polynomials are assumed to be normalised.
foreign import ccall "fmpz_poly.h fmpz_poly_equal"
  fmpz_poly_equal :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO CInt

-- | /fmpz_poly_equal_trunc/ /poly1/ /poly2/ /n/ 
-- 
-- Return \(1\) if @poly1@ and @poly2@, notionally truncated to length
-- \(n\) are equal, otherwise return \(0\).
foreign import ccall "fmpz_poly.h fmpz_poly_equal_trunc"
  fmpz_poly_equal_trunc :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO CInt

-- | /fmpz_poly_is_zero/ /poly/ 
-- 
-- Returns \(1\) if the polynomial is zero and \(0\) otherwise.
-- 
-- This function is implemented as a macro.
fmpz_poly_is_zero :: Ptr CFmpzPoly -> IO CInt
fmpz_poly_is_zero poly = do
  CFmpzPoly _ _ n <- peek poly
  return $ if n == 0 then 1 else 0
  
-- | /fmpz_poly_is_one/ /poly/ 
-- 
-- Returns \(1\) if the polynomial is one and \(0\) otherwise.
foreign import ccall "fmpz_poly.h fmpz_poly_is_one"
  fmpz_poly_is_one :: Ptr CFmpzPoly -> IO CInt

-- | /fmpz_poly_is_unit/ /poly/ 
-- 
-- Returns \(1\) is the polynomial is the constant polynomial \(\pm 1\),
-- and \(0\) otherwise.
foreign import ccall "fmpz_poly.h fmpz_poly_is_unit"
  fmpz_poly_is_unit :: Ptr CFmpzPoly -> IO CInt

-- | /fmpz_poly_is_gen/ /poly/ 
-- 
-- Returns \(1\) if the polynomial is the degree \(1\) polynomial \(x\),
-- and \(0\) otherwise.
foreign import ccall "fmpz_poly.h fmpz_poly_is_gen"
  fmpz_poly_is_gen :: Ptr CFmpzPoly -> IO CInt

-- Addition and subtraction ----------------------------------------------------

-- | /_fmpz_poly_add/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Sets @res@ to the sum of @(poly1, len1)@ and @(poly2, len2)@. It is
-- assumed that @res@ has sufficient space for the longer of the two
-- polynomials.
foreign import ccall "fmpz_poly.h _fmpz_poly_add"
  _fmpz_poly_add :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_add/ /res/ /poly1/ /poly2/ 
-- 
-- Sets @res@ to the sum of @poly1@ and @poly2@.
foreign import ccall "fmpz_poly.h fmpz_poly_add"
  fmpz_poly_add :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /fmpz_poly_add_series/ /res/ /poly1/ /poly2/ /n/ 
-- 
-- Notionally truncate @poly1@ and @poly2@ to length \(n\) and then set
-- @res@ to the sum.
foreign import ccall "fmpz_poly.h fmpz_poly_add_series"
  fmpz_poly_add_series :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- | /_fmpz_poly_sub/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Sets @res@ to @(poly1, len1)@ minus @(poly2, len2)@. It is assumed that
-- @res@ has sufficient space for the longer of the two polynomials.
foreign import ccall "fmpz_poly.h _fmpz_poly_sub"
  _fmpz_poly_sub :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_sub/ /res/ /poly1/ /poly2/ 
-- 
-- Sets @res@ to @poly1@ minus @poly2@.
foreign import ccall "fmpz_poly.h fmpz_poly_sub"
  fmpz_poly_sub :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /fmpz_poly_sub_series/ /res/ /poly1/ /poly2/ /n/ 
-- 
-- Notionally truncate @poly1@ and @poly2@ to length \(n\) and then set
-- @res@ to the sum.
foreign import ccall "fmpz_poly.h fmpz_poly_sub_series"
  fmpz_poly_sub_series :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- | /fmpz_poly_neg/ /res/ /poly/ 
-- 
-- Sets @res@ to @-poly@.
foreign import ccall "fmpz_poly.h fmpz_poly_neg"
  fmpz_poly_neg :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- Scalar absolute value, multiplication and division --------------------------

-- | /fmpz_poly_scalar_abs/ /res/ /poly/ 
-- 
-- Sets @poly1@ to the polynomial whose coefficients are the absolute value
-- of those of @poly2@.
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_abs"
  fmpz_poly_scalar_abs :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /fmpz_poly_scalar_mul_fmpz/ /poly1/ /poly2/ /x/ 
-- 
-- Sets @poly1@ to @poly2@ times \(x\).
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_mul_fmpz"
  fmpz_poly_scalar_mul_fmpz :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- -- | /fmpz_poly_scalar_mul_mpz/ /poly1/ /poly2/ /x/ 
-- -- 
-- -- Sets @poly1@ to @poly2@ times the @mpz_t@ \(x\).
-- foreign import ccall "fmpz_poly.h fmpz_poly_scalar_mul_mpz"
--   fmpz_poly_scalar_mul_mpz :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CMpz -> IO ()

-- | /fmpz_poly_scalar_mul_si/ /poly1/ /poly2/ /x/ 
-- 
-- Sets @poly1@ to @poly2@ times the signed @slong x@.
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_mul_si"
  fmpz_poly_scalar_mul_si :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /fmpz_poly_scalar_mul_ui/ /poly1/ /poly2/ /x/ 
-- 
-- Sets @poly1@ to @poly2@ times the @ulong x@.
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_mul_ui"
  fmpz_poly_scalar_mul_ui :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- | /fmpz_poly_scalar_mul_2exp/ /poly1/ /poly2/ /exp/ 
-- 
-- Sets @poly1@ to @poly2@ times @2^exp@.
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_mul_2exp"
  fmpz_poly_scalar_mul_2exp :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

foreign import ccall "fmpz_poly.h fmpz_poly_scalar_addmul_si"
  fmpz_poly_scalar_addmul_si :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

foreign import ccall "fmpz_poly.h fmpz_poly_scalar_addmul_ui"
  fmpz_poly_scalar_addmul_ui :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- | /fmpz_poly_scalar_addmul_fmpz/ /poly1/ /poly2/ /x/ 
-- 
-- Sets @poly1@ to @poly1 + x * poly2@.
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_addmul_fmpz"
  fmpz_poly_scalar_addmul_fmpz :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- | /fmpz_poly_scalar_submul_fmpz/ /poly1/ /poly2/ /x/ 
-- 
-- Sets @poly1@ to @poly1 - x * poly2@.
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_submul_fmpz"
  fmpz_poly_scalar_submul_fmpz :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- | /fmpz_poly_scalar_fdiv_fmpz/ /poly1/ /poly2/ /x/ 
-- 
-- Sets @poly1@ to @poly2@ divided by the @fmpz_t x@, rounding coefficients
-- down toward \(- \infty\).
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_fdiv_fmpz"
  fmpz_poly_scalar_fdiv_fmpz :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- -- | /fmpz_poly_scalar_fdiv_mpz/ /poly1/ /poly2/ /x/ 
-- -- 
-- -- Sets @poly1@ to @poly2@ divided by the @mpz_t x@, rounding coefficients
-- -- down toward \(- \infty\).
-- foreign import ccall "fmpz_poly.h fmpz_poly_scalar_fdiv_mpz"
--   fmpz_poly_scalar_fdiv_mpz :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CMpz -> IO ()

-- | /fmpz_poly_scalar_fdiv_si/ /poly1/ /poly2/ /x/ 
-- 
-- Sets @poly1@ to @poly2@ divided by the @slong x@, rounding coefficients
-- down toward \(- \infty\).
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_fdiv_si"
  fmpz_poly_scalar_fdiv_si :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /fmpz_poly_scalar_fdiv_ui/ /poly1/ /poly2/ /x/ 
-- 
-- Sets @poly1@ to @poly2@ divided by the @ulong x@, rounding coefficients
-- down toward \(- \infty\).
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_fdiv_ui"
  fmpz_poly_scalar_fdiv_ui :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- | /fmpz_poly_scalar_fdiv_2exp/ /poly1/ /poly2/ /x/ 
-- 
-- Sets @poly1@ to @poly2@ divided by @2^x@, rounding coefficients down
-- toward \(- \infty\).
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_fdiv_2exp"
  fmpz_poly_scalar_fdiv_2exp :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- | /fmpz_poly_scalar_tdiv_fmpz/ /poly1/ /poly2/ /x/ 
-- 
-- Sets @poly1@ to @poly2@ divided by the @fmpz_t x@, rounding coefficients
-- toward \(0\).
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_tdiv_fmpz"
  fmpz_poly_scalar_tdiv_fmpz :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- | /fmpz_poly_scalar_tdiv_si/ /poly1/ /poly2/ /x/ 
-- 
-- Sets @poly1@ to @poly2@ divided by the @slong x@, rounding coefficients
-- toward \(0\).
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_tdiv_si"
  fmpz_poly_scalar_tdiv_si :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /fmpz_poly_scalar_tdiv_ui/ /poly1/ /poly2/ /x/ 
-- 
-- Sets @poly1@ to @poly2@ divided by the @ulong x@, rounding coefficients
-- toward \(0\).
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_tdiv_ui"
  fmpz_poly_scalar_tdiv_ui :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- | /fmpz_poly_scalar_tdiv_2exp/ /poly1/ /poly2/ /x/ 
-- 
-- Sets @poly1@ to @poly2@ divided by @2^x@, rounding coefficients toward
-- \(0\).
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_tdiv_2exp"
  fmpz_poly_scalar_tdiv_2exp :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- | /fmpz_poly_scalar_divexact_fmpz/ /poly1/ /poly2/ /x/ 
-- 
-- Sets @poly1@ to @poly2@ divided by the @fmpz_t x@, assuming the division
-- is exact for every coefficient.
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_divexact_fmpz"
  fmpz_poly_scalar_divexact_fmpz :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- -- | /fmpz_poly_scalar_divexact_mpz/ /poly1/ /poly2/ /x/ 
-- -- 
-- -- Sets @poly1@ to @poly2@ divided by the @mpz_t x@, assuming the
-- -- coefficient is exact for every coefficient.
-- foreign import ccall "fmpz_poly.h fmpz_poly_scalar_divexact_mpz"
--   fmpz_poly_scalar_divexact_mpz :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CMpz -> IO ()

-- | /fmpz_poly_scalar_divexact_si/ /poly1/ /poly2/ /x/ 
-- 
-- Sets @poly1@ to @poly2@ divided by the @slong x@, assuming the
-- coefficient is exact for every coefficient.
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_divexact_si"
  fmpz_poly_scalar_divexact_si :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /fmpz_poly_scalar_divexact_ui/ /poly1/ /poly2/ /x/ 
-- 
-- Sets @poly1@ to @poly2@ divided by the @ulong x@, assuming the
-- coefficient is exact for every coefficient.
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_divexact_ui"
  fmpz_poly_scalar_divexact_ui :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- | /fmpz_poly_scalar_mod_fmpz/ /poly1/ /poly2/ /p/ 
-- 
-- Sets @poly1@ to @poly2@, reducing each coefficient modulo \(p > 0\).
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_mod_fmpz"
  fmpz_poly_scalar_mod_fmpz :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- | /fmpz_poly_scalar_smod_fmpz/ /poly1/ /poly2/ /p/ 
-- 
-- Sets @poly1@ to @poly2@, symmetrically reducing each coefficient modulo
-- \(p > 0\), that is, choosing the unique representative in the interval
-- \((-p/2, p/2]\).
foreign import ccall "fmpz_poly.h fmpz_poly_scalar_smod_fmpz"
  fmpz_poly_scalar_smod_fmpz :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- | /_fmpz_poly_remove_content_2exp/ /pol/ /len/ 
-- 
-- Remove the 2-content of @pol@ and return the number \(k\) that is the
-- maximal non-negative integer so that \(2^k\) divides all coefficients of
-- the polynomial. For the zero polynomial, \(0\) is returned.
foreign import ccall "fmpz_poly.h _fmpz_poly_remove_content_2exp"
  _fmpz_poly_remove_content_2exp :: Ptr CFmpz -> CLong -> IO CLong

-- | /_fmpz_poly_scale_2exp/ /pol/ /len/ /k/ 
-- 
-- Scale @(pol, len)@ to \(p(2^k X)\) in-place and divide by the 2-content
-- (so that the gcd of coefficients is odd). If @k@ is negative the
-- polynomial is multiplied by \(2^{kd}\).
foreign import ccall "fmpz_poly.h _fmpz_poly_scale_2exp"
  _fmpz_poly_scale_2exp :: Ptr CFmpz -> CLong -> CLong -> IO ()

-- Bit packing -----------------------------------------------------------------

-- | /_fmpz_poly_bit_pack/ /arr/ /poly/ /len/ /bit_size/ /negate/ 
-- 
-- Packs the coefficients of @poly@ into bitfields of the given @bit_size@,
-- negating the coefficients before packing if @negate@ is set to \(-1\).
foreign import ccall "fmpz_poly.h _fmpz_poly_bit_pack"
  _fmpz_poly_bit_pack :: Ptr CMp -> Ptr CFmpz -> CLong -> CFBitCnt -> CInt -> IO ()

-- | /_fmpz_poly_bit_unpack/ /poly/ /len/ /arr/ /bit_size/ /negate/ 
-- 
-- Unpacks the polynomial of given length from the array as packed into
-- fields of the given @bit_size@, finally negating the coefficients if
-- @negate@ is set to \(-1\). Returns borrow, which is nonzero if a leading
-- term with coefficient \(\pm1\) should be added at position @len@ of
-- @poly@.
foreign import ccall "fmpz_poly.h _fmpz_poly_bit_unpack"
  _fmpz_poly_bit_unpack :: Ptr CFmpz -> CLong -> Ptr CMp -> CFBitCnt -> CInt -> IO CInt

-- | /_fmpz_poly_bit_unpack_unsigned/ /poly/ /len/ /arr/ /bit_size/ 
-- 
-- Unpacks the polynomial of given length from the array as packed into
-- fields of the given @bit_size@. The coefficients are assumed to be
-- unsigned.
foreign import ccall "fmpz_poly.h _fmpz_poly_bit_unpack_unsigned"
  _fmpz_poly_bit_unpack_unsigned :: Ptr CFmpz -> CLong -> Ptr CMp -> CFBitCnt -> IO ()

-- | /fmpz_poly_bit_pack/ /f/ /poly/ /bit_size/ 
-- 
-- Packs @poly@ into bitfields of size @bit_size@, writing the result to
-- @f@. The sign of @f@ will be the same as that of the leading coefficient
-- of @poly@.
foreign import ccall "fmpz_poly.h fmpz_poly_bit_pack"
  fmpz_poly_bit_pack :: Ptr CFmpz -> Ptr CFmpzPoly -> CFBitCnt -> IO ()

-- | /fmpz_poly_bit_unpack/ /poly/ /f/ /bit_size/ 
-- 
-- Unpacks the polynomial with signed coefficients packed into fields of
-- size @bit_size@ as represented by the integer @f@.
foreign import ccall "fmpz_poly.h fmpz_poly_bit_unpack"
  fmpz_poly_bit_unpack :: Ptr CFmpzPoly -> Ptr CFmpz -> CFBitCnt -> IO ()

-- | /fmpz_poly_bit_unpack_unsigned/ /poly/ /f/ /bit_size/ 
-- 
-- Unpacks the polynomial with unsigned coefficients packed into fields of
-- size @bit_size@ as represented by the integer @f@. It is required that
-- @f@ is nonnegative.
foreign import ccall "fmpz_poly.h fmpz_poly_bit_unpack_unsigned"
  fmpz_poly_bit_unpack_unsigned :: Ptr CFmpzPoly -> Ptr CFmpz -> CFBitCnt -> IO ()

-- Multiplication --------------------------------------------------------------

-- | /_fmpz_poly_mul_classical/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Sets @(res, len1 + len2 - 1)@ to the product of @(poly1, len1)@ and
-- @(poly2, len2)@.
-- 
-- Assumes @len1@ and @len2@ are positive. Allows zero-padding of the two
-- input polynomials. No aliasing of inputs with outputs is allowed.
foreign import ccall "fmpz_poly.h _fmpz_poly_mul_classical"
  _fmpz_poly_mul_classical :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_mul_classical/ /res/ /poly1/ /poly2/ 
-- 
-- Sets @res@ to the product of @poly1@ and @poly2@, computed using the
-- classical or schoolbook method.
foreign import ccall "fmpz_poly.h fmpz_poly_mul_classical"
  fmpz_poly_mul_classical :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_mullow_classical/ /res/ /poly1/ /len1/ /poly2/ /len2/ /n/ 
-- 
-- Sets @(res, n)@ to the first \(n\) coefficients of @(poly1, len1)@
-- multiplied by @(poly2, len2)@.
-- 
-- Assumes @0 \< n \<= len1 + len2 - 1@. Assumes neither @len1@ nor @len2@
-- is zero.
foreign import ccall "fmpz_poly.h _fmpz_poly_mullow_classical"
  _fmpz_poly_mullow_classical :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_mullow_classical/ /res/ /poly1/ /poly2/ /n/ 
-- 
-- Sets @res@ to the first \(n\) coefficients of @poly1 * poly2@.
foreign import ccall "fmpz_poly.h fmpz_poly_mullow_classical"
  fmpz_poly_mullow_classical :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_mulhigh_classical/ /res/ /poly1/ /len1/ /poly2/ /len2/ /start/ 
-- 
-- Sets the first @start@ coefficients of @res@ to zero and the remainder
-- to the corresponding coefficients of @(poly1, len1) * (poly2, len2)@.
-- 
-- Assumes @start \<= len1 + len2 - 1@. Assumes neither @len1@ nor @len2@
-- is zero.
foreign import ccall "fmpz_poly.h _fmpz_poly_mulhigh_classical"
  _fmpz_poly_mulhigh_classical :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_mulhigh_classical/ /res/ /poly1/ /poly2/ /start/ 
-- 
-- Sets the first @start@ coefficients of @res@ to zero and the remainder
-- to the corresponding coefficients of the product of @poly1@ and @poly2@.
foreign import ccall "fmpz_poly.h fmpz_poly_mulhigh_classical"
  fmpz_poly_mulhigh_classical :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_mulmid_classical/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Sets @res@ to the middle @len1 - len2 + 1@ coefficients of the product
-- of @(poly1, len1)@ and @(poly2, len2)@, i.e.the coefficients from degree
-- @len2 - 1@ to @len1 - 1@ inclusive. Assumes that @len1 >= len2 > 0@.
foreign import ccall "fmpz_poly.h _fmpz_poly_mulmid_classical"
  _fmpz_poly_mulmid_classical :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_mulmid_classical/ /res/ /poly1/ /poly2/ 
-- 
-- Sets @res@ to the middle @len(poly1) - len(poly2) + 1@ coefficients of
-- @poly1 * poly2@, i.e.the coefficient from degree @len2 - 1@ to
-- @len1 - 1@ inclusive. Assumes that @len1 >= len2@.
foreign import ccall "fmpz_poly.h fmpz_poly_mulmid_classical"
  fmpz_poly_mulmid_classical :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_mul_karatsuba/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Sets @(res, len1 + len2 - 1)@ to the product of @(poly1, len1)@ and
-- @(poly2, len2)@. Assumes @len1 >= len2 > 0@. Allows zero-padding of the
-- two input polynomials. No aliasing of inputs with outputs is allowed.
foreign import ccall "fmpz_poly.h _fmpz_poly_mul_karatsuba"
  _fmpz_poly_mul_karatsuba :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_mul_karatsuba/ /res/ /poly1/ /poly2/ 
-- 
-- Sets @res@ to the product of @poly1@ and @poly2@.
foreign import ccall "fmpz_poly.h fmpz_poly_mul_karatsuba"
  fmpz_poly_mul_karatsuba :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_mullow_karatsuba_n/ /res/ /poly1/ /poly2/ /n/ 
-- 
-- Sets @res@ to the product of @poly1@ and @poly2@ and truncates to the
-- given length. It is assumed that @poly1@ and @poly2@ are precisely the
-- given length, possibly zero padded. Assumes \(n\) is not zero.
foreign import ccall "fmpz_poly.h _fmpz_poly_mullow_karatsuba_n"
  _fmpz_poly_mullow_karatsuba_n :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_mullow_karatsuba_n/ /res/ /poly1/ /poly2/ /n/ 
-- 
-- Sets @res@ to the product of @poly1@ and @poly2@ and truncates to the
-- given length.
foreign import ccall "fmpz_poly.h fmpz_poly_mullow_karatsuba_n"
  fmpz_poly_mullow_karatsuba_n :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_mulhigh_karatsuba_n/ /res/ /poly1/ /poly2/ /len/ 
-- 
-- Sets @res@ to the product of @poly1@ and @poly2@ and truncates at the
-- top to the given length. The first @len - 1@ coefficients are set to
-- zero. It is assumed that @poly1@ and @poly2@ are precisely the given
-- length, possibly zero padded. Assumes @len@ is not zero.
foreign import ccall "fmpz_poly.h _fmpz_poly_mulhigh_karatsuba_n"
  _fmpz_poly_mulhigh_karatsuba_n :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_mulhigh_karatsuba_n/ /res/ /poly1/ /poly2/ /len/ 
-- 
-- Sets the first @len - 1@ coefficients of the result to zero and the
-- remaining coefficients to the corresponding coefficients of the product
-- of @poly1@ and @poly2@. Assumes @poly1@ and @poly2@ are at most of the
-- given length.
foreign import ccall "fmpz_poly.h fmpz_poly_mulhigh_karatsuba_n"
  fmpz_poly_mulhigh_karatsuba_n :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_mul_KS/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Sets @(res, len1 + len2 - 1)@ to the product of @(poly1, len1)@ and
-- @(poly2, len2)@.
-- 
-- Places no assumptions on @len1@ and @len2@. Allows zero-padding of the
-- two input polynomials. Supports aliasing of inputs and outputs.
foreign import ccall "fmpz_poly.h _fmpz_poly_mul_KS"
  _fmpz_poly_mul_KS :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_mul_KS/ /res/ /poly1/ /poly2/ 
-- 
-- Sets @res@ to the product of @poly1@ and @poly2@.
foreign import ccall "fmpz_poly.h fmpz_poly_mul_KS"
  fmpz_poly_mul_KS :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_mullow_KS/ /res/ /poly1/ /len1/ /poly2/ /len2/ /n/ 
-- 
-- Sets @(res, n)@ to the lowest \(n\) coefficients of the product of
-- @(poly1, len1)@ and @(poly2, len2)@.
-- 
-- Assumes that @len1@ and @len2@ are positive, but does allow for the
-- polynomials to be zero-padded. The polynomials may be zero, too. Assumes
-- \(n\) is positive. Supports aliasing between @res@, @poly1@ and @poly2@.
foreign import ccall "fmpz_poly.h _fmpz_poly_mullow_KS"
  _fmpz_poly_mullow_KS :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_mullow_KS/ /res/ /poly1/ /poly2/ /n/ 
-- 
-- Sets @res@ to the lowest \(n\) coefficients of the product of @poly1@
-- and @poly2@.
foreign import ccall "fmpz_poly.h fmpz_poly_mullow_KS"
  fmpz_poly_mullow_KS :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_mul_SS/ /output/ /input1/ /length1/ /input2/ /length2/ 
-- 
-- Sets @(output, length1 + length2 - 1)@ to the product of
-- @(input1, length1)@ and @(input2, length2)@.
-- 
-- We must have @len1 > 1@ and @len2 > 1@. Allows zero-padding of the two
-- input polynomials. Supports aliasing of inputs and outputs.
foreign import ccall "fmpz_poly.h _fmpz_poly_mul_SS"
  _fmpz_poly_mul_SS :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_mul_SS/ /res/ /poly1/ /poly2/ 
-- 
-- Sets @res@ to the product of @poly1@ and @poly2@. Uses the
-- Sch\"{o}nhage-Strassen algorithm.
foreign import ccall "fmpz_poly.h fmpz_poly_mul_SS"
  fmpz_poly_mul_SS :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_mullow_SS/ /output/ /input1/ /length1/ /input2/ /length2/ /n/ 
-- 
-- Sets @(res, n)@ to the lowest \(n\) coefficients of the product of
-- @(poly1, len1)@ and @(poly2, len2)@.
-- 
-- Assumes that @len1@ and @len2@ are positive, but does allow for the
-- polynomials to be zero-padded. We must have @len1 > 1@ and @len2 > 1@.
-- Assumes \(n\) is positive. Supports aliasing between @res@, @poly1@ and
-- @poly2@.
foreign import ccall "fmpz_poly.h _fmpz_poly_mullow_SS"
  _fmpz_poly_mullow_SS :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_mullow_SS/ /res/ /poly1/ /poly2/ /n/ 
-- 
-- Sets @res@ to the lowest \(n\) coefficients of the product of @poly1@
-- and @poly2@.
foreign import ccall "fmpz_poly.h fmpz_poly_mullow_SS"
  fmpz_poly_mullow_SS :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_mul/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Sets @(res, len1 + len2 - 1)@ to the product of @(poly1, len1)@ and
-- @(poly2, len2)@. Assumes @len1 >= len2 > 0@. Allows zero-padding of the
-- two input polynomials. Does not support aliasing between the inputs and
-- the output.
foreign import ccall "fmpz_poly.h _fmpz_poly_mul"
  _fmpz_poly_mul :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_mul/ /res/ /poly1/ /poly2/ 
-- 
-- Sets @res@ to the product of @poly1@ and @poly2@. Chooses an optimal
-- algorithm from the choices above.
foreign import ccall "fmpz_poly.h fmpz_poly_mul"
  fmpz_poly_mul :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_mullow/ /res/ /poly1/ /len1/ /poly2/ /len2/ /n/ 
-- 
-- Sets @(res, n)@ to the lowest \(n\) coefficients of the product of
-- @(poly1, len1)@ and @(poly2, len2)@.
-- 
-- Assumes @len1 >= len2 > 0@ and @0 \< n \<= len1 + len2 - 1@. Allows for
-- zero-padding in the inputs. Does not support aliasing between the inputs
-- and the output.
foreign import ccall "fmpz_poly.h _fmpz_poly_mullow"
  _fmpz_poly_mullow :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_mullow/ /res/ /poly1/ /poly2/ /n/ 
-- 
-- Sets @res@ to the lowest \(n\) coefficients of the product of @poly1@
-- and @poly2@.
foreign import ccall "fmpz_poly.h fmpz_poly_mullow"
  fmpz_poly_mullow :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /fmpz_poly_mulhigh_n/ /res/ /poly1/ /poly2/ /n/ 
-- 
-- Sets the high \(n\) coefficients of @res@ to the high \(n\) coefficients
-- of the product of @poly1@ and @poly2@, assuming the latter are precisely
-- \(n\) coefficients in length, zero padded if necessary. The remaining
-- \(n - 1\) coefficients may be arbitrary.
foreign import ccall "fmpz_poly.h fmpz_poly_mulhigh_n"
  fmpz_poly_mulhigh_n :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_mulhigh/ /res/ /poly1/ /len1/ /poly2/ /len2/ /start/ 
-- 
-- Sets all but the low \(n\) coefficients of \(res\) to the corresponding
-- coefficients of the product of \(poly1\) of length \(len1\) and
-- \(poly2\) of length \(len2\), the remaining coefficients being
-- arbitrary. It is assumed that \(len1 >= len2 > 0\) and that
-- \(0 < n < len1 + len2 - 1\). Aliasing of inputs is not permitted.
foreign import ccall "fmpz_poly.h _fmpz_poly_mulhigh"
  _fmpz_poly_mulhigh :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- FFT precached multiplication ------------------------------------------------

-- | /fmpz_poly_mul_SS_precache_init/ /pre/ /len1/ /bits1/ /poly2/ 
-- 
-- Precompute the FFT of @poly2@ to enable repeated multiplication of
-- @poly2@ by polynomials whose length does not exceed @len1@ and whose
-- number of bits per coefficient does not exceed @bits1@.
-- 
-- The value @bits1@ may be negative, i.e. it may be the result of calling
-- @fmpz_poly_max_bits@. The function only considers the absolute value of
-- @bits1@.
-- 
-- Suppose @len2@ is the length of @poly2@ and @len = len1 + len2 - 1@ is
-- the maximum output length of a polynomial multiplication using @pre@.
-- Then internally @len@ is rounded up to a power of two, \(2^n\) say. The
-- truncated FFT algorithm is used to smooth performance but note that it
-- can only do this in the range \((2^{n-1}, 2^n]\). Therefore, it may be
-- more efficient to recompute \(pre\) for cases where the output length
-- will fall below \(2^{n-1} + 1\). Otherwise the implementation will zero
-- pad them up to that length.
-- 
-- Note that the Schoenhage-Strassen algorithm is only efficient for
-- polynomials with relatively large coefficients relative to the length of
-- the polynomials.
-- 
-- Also note that there are no restrictions on the polynomials. In
-- particular the polynomial whose FFT is being precached does not have to
-- be either longer or shorter than the polynomials it is to be multiplied
-- by.
foreign import ccall "fmpz_poly.h fmpz_poly_mul_SS_precache_init"
  fmpz_poly_mul_SS_precache_init :: Ptr CFmpzPolyMulPrecache -> CLong -> CLong -> Ptr CFmpzPoly -> IO ()

-- | /fmpz_poly_mul_precache_clear/ /pre/ 
-- 
-- Clear the space allocated by @fmpz_poly_mul_SS_precache_init@.
foreign import ccall "fmpz_poly.h fmpz_poly_mul_precache_clear"
  fmpz_poly_mul_precache_clear :: Ptr CFmpzPolyMulPrecache -> IO ()

-- | /_fmpz_poly_mullow_SS_precache/ /output/ /input1/ /len1/ /pre/ /trunc/ 
-- 
-- Write into @output@ the first @trunc@ coefficients of the polynomial
-- @(input1, len1)@ by the polynomial whose FFT was precached by
-- @fmpz_poly_mul_SS_precache_init@ and stored in @pre@.
-- 
-- For performance reasons it is recommended that all polynomials be
-- truncated to at most @trunc@ coefficients if possible.
foreign import ccall "fmpz_poly.h _fmpz_poly_mullow_SS_precache"
  _fmpz_poly_mullow_SS_precache :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpzPolyMulPrecache -> CLong -> IO ()

-- | /fmpz_poly_mullow_SS_precache/ /res/ /poly1/ /pre/ /n/ 
-- 
-- Set @res@ to the product of @poly1@ by the polynomial whose FFT was
-- precached by @fmpz_poly_mul_SS_precache_init@ (and stored in pre). The
-- result is truncated to \(n\) coefficients (and normalised).
-- 
-- There are no restrictions on the length of @poly1@ other than those
-- given in the call to @fmpz_poly_mul_SS_precache_init@.
foreign import ccall "fmpz_poly.h fmpz_poly_mullow_SS_precache"
  fmpz_poly_mullow_SS_precache :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPolyMulPrecache -> CLong -> IO ()

-- | /fmpz_poly_mul_SS_precache/ /res/ /poly1/ /pre/ 
-- 
-- Set @res@ to the product of @poly1@ by the polynomial whose FFT was
-- precached by @fmpz_poly_mul_SS_precache_init@ (and stored in pre).
-- 
-- There are no restrictions on the length of @poly1@ other than those
-- given in the call to @fmpz_poly_mul_SS_precache_init@.
foreign import ccall "fmpz_poly.h fmpz_poly_mul_SS_precache"
  fmpz_poly_mul_SS_precache :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPolyMulPrecache -> IO ()

-- Squaring --------------------------------------------------------------------

-- | /_fmpz_poly_sqr_KS/ /rop/ /op/ /len/ 
-- 
-- Sets @(rop, 2*len - 1)@ to the square of @(op, len)@, assuming that
-- @len > 0@.
-- 
-- Supports zero-padding in @(op, len)@. Does not support aliasing.
foreign import ccall "fmpz_poly.h _fmpz_poly_sqr_KS"
  _fmpz_poly_sqr_KS :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_sqr_KS/ /rop/ /op/ 
-- 
-- Sets @rop@ to the square of the polynomial @op@ using Kronecker
-- segmentation.
foreign import ccall "fmpz_poly.h fmpz_poly_sqr_KS"
  fmpz_poly_sqr_KS :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_sqr_karatsuba/ /rop/ /op/ /len/ 
-- 
-- Sets @(rop, 2*len - 1)@ to the square of @(op, len)@, assuming that
-- @len > 0@.
-- 
-- Supports zero-padding in @(op, len)@. Does not support aliasing.
foreign import ccall "fmpz_poly.h _fmpz_poly_sqr_karatsuba"
  _fmpz_poly_sqr_karatsuba :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_sqr_karatsuba/ /rop/ /op/ 
-- 
-- Sets @rop@ to the square of the polynomial @op@ using the Karatsuba
-- multiplication algorithm.
foreign import ccall "fmpz_poly.h fmpz_poly_sqr_karatsuba"
  fmpz_poly_sqr_karatsuba :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_sqr_classical/ /rop/ /op/ /len/ 
-- 
-- Sets @(rop, 2*len - 1)@ to the square of @(op, len)@, assuming that
-- @len > 0@.
-- 
-- Supports zero-padding in @(op, len)@. Does not support aliasing.
foreign import ccall "fmpz_poly.h _fmpz_poly_sqr_classical"
  _fmpz_poly_sqr_classical :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_sqr_classical/ /rop/ /op/ 
-- 
-- Sets @rop@ to the square of the polynomial @op@ using the classical or
-- schoolbook method.
foreign import ccall "fmpz_poly.h fmpz_poly_sqr_classical"
  fmpz_poly_sqr_classical :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_sqr/ /rop/ /op/ /len/ 
-- 
-- Sets @(rop, 2*len - 1)@ to the square of @(op, len)@, assuming that
-- @len > 0@.
-- 
-- Supports zero-padding in @(op, len)@. Does not support aliasing.
foreign import ccall "fmpz_poly.h _fmpz_poly_sqr"
  _fmpz_poly_sqr :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_sqr/ /rop/ /op/ 
-- 
-- Sets @rop@ to the square of the polynomial @op@.
foreign import ccall "fmpz_poly.h fmpz_poly_sqr"
  fmpz_poly_sqr :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_sqrlow_KS/ /res/ /poly/ /len/ /n/ 
-- 
-- Sets @(res, n)@ to the lowest \(n\) coefficients of the square of
-- @(poly, len)@.
-- 
-- Assumes that @len@ is positive, but does allow for the polynomial to be
-- zero-padded. The polynomial may be zero, too. Assumes \(n\) is positive.
-- Supports aliasing between @res@ and @poly@.
foreign import ccall "fmpz_poly.h _fmpz_poly_sqrlow_KS"
  _fmpz_poly_sqrlow_KS :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_sqrlow_KS/ /res/ /poly/ /n/ 
-- 
-- Sets @res@ to the lowest \(n\) coefficients of the square of @poly@.
foreign import ccall "fmpz_poly.h fmpz_poly_sqrlow_KS"
  fmpz_poly_sqrlow_KS :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_sqrlow_karatsuba_n/ /res/ /poly/ /n/ 
-- 
-- Sets @(res, n)@ to the square of @(poly, n)@ truncated to length \(n\),
-- which is assumed to be positive. Allows for @poly@ to be zero-oadded.
foreign import ccall "fmpz_poly.h _fmpz_poly_sqrlow_karatsuba_n"
  _fmpz_poly_sqrlow_karatsuba_n :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_sqrlow_karatsuba_n/ /res/ /poly/ /n/ 
-- 
-- Sets @res@ to the square of @poly@ and truncates to the given length.
foreign import ccall "fmpz_poly.h fmpz_poly_sqrlow_karatsuba_n"
  fmpz_poly_sqrlow_karatsuba_n :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_sqrlow_classical/ /res/ /poly/ /len/ /n/ 
-- 
-- Sets @(res, n)@ to the first \(n\) coefficients of the square of
-- @(poly, len)@.
-- 
-- Assumes that @0 \< n \<= 2 * len - 1@.
foreign import ccall "fmpz_poly.h _fmpz_poly_sqrlow_classical"
  _fmpz_poly_sqrlow_classical :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_sqrlow_classical/ /res/ /poly/ /n/ 
-- 
-- Sets @res@ to the first \(n\) coefficients of the square of @poly@.
foreign import ccall "fmpz_poly.h fmpz_poly_sqrlow_classical"
  fmpz_poly_sqrlow_classical :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_sqrlow/ /res/ /poly/ /len/ /n/ 
-- 
-- Sets @(res, n)@ to the lowest \(n\) coefficients of the square of
-- @(poly, len)@.
-- 
-- Assumes @len1 >= len2 > 0@ and @0 \< n \<= 2 * len - 1@. Allows for
-- zero-padding in the input. Does not support aliasing between the input
-- and the output.
foreign import ccall "fmpz_poly.h _fmpz_poly_sqrlow"
  _fmpz_poly_sqrlow :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_sqrlow/ /res/ /poly/ /n/ 
-- 
-- Sets @res@ to the lowest \(n\) coefficients of the square of @poly@.
foreign import ccall "fmpz_poly.h fmpz_poly_sqrlow"
  fmpz_poly_sqrlow :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- Powering --------------------------------------------------------------------

-- | /_fmpz_poly_pow_multinomial/ /res/ /poly/ /len/ /e/ 
-- 
-- Computes @res = poly^e@. This uses the J.C.P. Miller pure recurrence as
-- follows:
-- 
-- If \(\ell\) is the index of the lowest non-zero coefficient in @poly@,
-- as a first step this method zeros out the lowest \(e \ell\) coefficients
-- of @res@. The recurrence above is then used to compute the remaining
-- coefficients.
-- 
-- Assumes @len > 0@, @e > 0@. Does not support aliasing.
foreign import ccall "fmpz_poly.h _fmpz_poly_pow_multinomial"
  _fmpz_poly_pow_multinomial :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CULong -> IO ()

-- | /fmpz_poly_pow_multinomial/ /res/ /poly/ /e/ 
-- 
-- Computes @res = poly^e@ using a generalisation of binomial expansion
-- called the J.C.P. Miller pure recurrence [1], [2]. If \(e\) is zero,
-- returns one, so that in particular @0^0 = 1@.
-- 
-- The formal statement of the recurrence is as follows. Write the input
-- polynomial as \(P(x) = p_0 + p_1 x + \dotsb + p_m x^m\) with
-- \(p_0 \neq 0\) and let
-- 
-- \[`\]
-- \[P(x)^n = a(n, 0) + a(n, 1) x + \dotsb + a(n, mn) x^{mn}.\]
-- 
-- Then \(a(n, 0) = p_0^n\) and, for all \(1 \leq k \leq mn\),
-- 
-- \[`\]
-- \[a(n, k) = 
--     (k p_0)^{-1} \sum_{i = 1}^m p_i \bigl( (n + 1) i - k \bigr) a(n, k-i).\]
-- 
-- [1] D. Knuth, The Art of Computer Programming Vol. 2, Seminumerical
-- Algorithms, Third Edition (Reading, Massachusetts: Addison-Wesley, 1997)
-- 
-- [2] D. Zeilberger, The J.C.P. Miller Recurrence for Exponentiating a
-- Polynomial, and its q-Analog, Journal of Difference Equations and
-- Applications, 1995, Vol. 1, pp. 57--60
foreign import ccall "fmpz_poly.h fmpz_poly_pow_multinomial"
  fmpz_poly_pow_multinomial :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- | /_fmpz_poly_pow_binomial/ /res/ /poly/ /e/ 
-- 
-- Computes @res = poly^e@ when poly is of length 2, using binomial
-- expansion.
-- 
-- Assumes \(e > 0\). Does not support aliasing.
foreign import ccall "fmpz_poly.h _fmpz_poly_pow_binomial"
  _fmpz_poly_pow_binomial :: Ptr CFmpz -> Ptr CFmpz -> CULong -> IO ()

-- | /fmpz_poly_pow_binomial/ /res/ /poly/ /e/ 
-- 
-- Computes @res = poly^e@ when @poly@ is of length \(2\), using binomial
-- expansion.
-- 
-- If the length of @poly@ is not \(2\), raises an exception and aborts.
foreign import ccall "fmpz_poly.h fmpz_poly_pow_binomial"
  fmpz_poly_pow_binomial :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- | /_fmpz_poly_pow_addchains/ /res/ /poly/ /len/ /a/ /n/ 
-- 
-- Given a star chain \(1 = a_0 < a_1 < \dotsb < a_n = e\) computes
-- @res = poly^e@.
-- 
-- A star chain is an addition chain \(1 = a_0 < a_1 < \dotsb < a_n\) such
-- that, for all \(i > 0\), \(a_i = a_{i-1} + a_j\) for some \(j < i\).
-- 
-- Assumes that \(e > 2\), or equivalently \(n > 1\), and @len > 0@. Does
-- not support aliasing.
foreign import ccall "fmpz_poly.h _fmpz_poly_pow_addchains"
  _fmpz_poly_pow_addchains :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CInt -> CInt -> IO ()

-- | /fmpz_poly_pow_addchains/ /res/ /poly/ /e/ 
-- 
-- Computes @res = poly^e@ using addition chains whenever
-- \(0 \leq e \leq 148\).
-- 
-- If \(e > 148\), raises an exception and aborts.
foreign import ccall "fmpz_poly.h fmpz_poly_pow_addchains"
  fmpz_poly_pow_addchains :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- | /_fmpz_poly_pow_binexp/ /res/ /poly/ /len/ /e/ 
-- 
-- Sets @res = poly^e@ using left-to-right binary exponentiation as
-- described in [p. 461]< [Knu1997]>.
-- 
-- Assumes that @len > 0@, @e > 1@. Assumes that @res@ is an array of
-- length at least @e*(len - 1) + 1@. Does not support aliasing.
foreign import ccall "fmpz_poly.h _fmpz_poly_pow_binexp"
  _fmpz_poly_pow_binexp :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CULong -> IO ()

-- | /fmpz_poly_pow_binexp/ /res/ /poly/ /e/ 
-- 
-- Computes @res = poly^e@ using the binary exponentiation algorithm. If
-- \(e\) is zero, returns one, so that in particular @0^0 = 1@.
foreign import ccall "fmpz_poly.h fmpz_poly_pow_binexp"
  fmpz_poly_pow_binexp :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- | /_fmpz_poly_pow_small/ /res/ /poly/ /len/ /e/ 
-- 
-- Sets @res = poly^e@ whenever \(0 \leq e \leq 4\).
-- 
-- Assumes that @len > 0@ and that @res@ is an array of length at least
-- @e*(len - 1) + 1@. Does not support aliasing.
foreign import ccall "fmpz_poly.h _fmpz_poly_pow_small"
  _fmpz_poly_pow_small :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CULong -> IO ()

-- | /_fmpz_poly_pow/ /res/ /poly/ /len/ /e/ 
-- 
-- Sets @res = poly^e@, assuming that @e, len > 0@ and that @res@ has space
-- for @e*(len - 1) + 1@ coefficients. Does not support aliasing.
foreign import ccall "fmpz_poly.h _fmpz_poly_pow"
  _fmpz_poly_pow :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CULong -> IO ()

-- | /fmpz_poly_pow/ /res/ /poly/ /e/ 
-- 
-- Computes @res = poly^e@. If \(e\) is zero, returns one, so that in
-- particular @0^0 = 1@.
foreign import ccall "fmpz_poly.h fmpz_poly_pow"
  fmpz_poly_pow :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- | /_fmpz_poly_pow_trunc/ /res/ /poly/ /e/ /n/ 
-- 
-- Sets @(res, n)@ to @(poly, n)@ raised to the power \(e\) and truncated
-- to length \(n\).
-- 
-- Assumes that \(e, n > 0\). Allows zero-padding of @(poly, n)@. Does not
-- support aliasing of any inputs and outputs.
foreign import ccall "fmpz_poly.h _fmpz_poly_pow_trunc"
  _fmpz_poly_pow_trunc :: Ptr CFmpz -> Ptr CFmpz -> CULong -> CLong -> IO ()

-- | /fmpz_poly_pow_trunc/ /res/ /poly/ /e/ /n/ 
-- 
-- Notationally raises @poly@ to the power \(e\), truncates the result to
-- length \(n\) and writes the result in @res@. This is computed much more
-- efficiently than simply powering the polynomial and truncating.
-- 
-- Thus, if \(n = 0\) the result is zero. Otherwise, whenever \(e = 0\) the
-- result will be the constant polynomial equal to \(1\).
-- 
-- This function can be used to raise power series to a power in an
-- efficient way.
foreign import ccall "fmpz_poly.h fmpz_poly_pow_trunc"
  fmpz_poly_pow_trunc :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> CLong -> IO ()

-- Shifting --------------------------------------------------------------------

-- | /_fmpz_poly_shift_left/ /res/ /poly/ /len/ /n/ 
-- 
-- Sets @(res, len + n)@ to @(poly, len)@ shifted left by \(n\)
-- coefficients.
-- 
-- Inserts zero coefficients at the lower end. Assumes that @len@ and \(n\)
-- are positive, and that @res@ fits @len + n@ elements. Supports aliasing
-- between @res@ and @poly@.
foreign import ccall "fmpz_poly.h _fmpz_poly_shift_left"
  _fmpz_poly_shift_left :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_shift_left/ /res/ /poly/ /n/ 
-- 
-- Sets @res@ to @poly@ shifted left by \(n\) coeffs. Zero coefficients are
-- inserted.
foreign import ccall "fmpz_poly.h fmpz_poly_shift_left"
  fmpz_poly_shift_left :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_shift_right/ /res/ /poly/ /len/ /n/ 
-- 
-- Sets @(res, len - n)@ to @(poly, len)@ shifted right by \(n\)
-- coefficients.
-- 
-- Assumes that @len@ and \(n\) are positive, that @len > n@, and that
-- @res@ fits @len - n@ elements. Supports aliasing between @res@ and
-- @poly@, although in this case the top coefficients of @poly@ are not set
-- to zero.
foreign import ccall "fmpz_poly.h _fmpz_poly_shift_right"
  _fmpz_poly_shift_right :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_shift_right/ /res/ /poly/ /n/ 
-- 
-- Sets @res@ to @poly@ shifted right by \(n\) coefficients. If \(n\) is
-- equal to or greater than the current length of @poly@, @res@ is set to
-- the zero polynomial.
foreign import ccall "fmpz_poly.h fmpz_poly_shift_right"
  fmpz_poly_shift_right :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- Bit sizes and norms ---------------------------------------------------------

-- | /fmpz_poly_max_limbs/ /poly/ 
-- 
-- Returns the maximum number of limbs required to store the absolute value
-- of coefficients of @poly@. If @poly@ is zero, returns \(0\).
foreign import ccall "fmpz_poly.h fmpz_poly_max_limbs"
  fmpz_poly_max_limbs :: Ptr CFmpzPoly -> IO CULong

-- | /fmpz_poly_max_bits/ /poly/ 
-- 
-- Computes the maximum number of bits \(b\) required to store the absolute
-- value of coefficients of @poly@. If all the coefficients of @poly@ are
-- non-negative, \(b\) is returned, otherwise \(-b\) is returned.
foreign import ccall "fmpz_poly.h fmpz_poly_max_bits"
  fmpz_poly_max_bits :: Ptr CFmpzPoly -> IO CLong

-- | /fmpz_poly_height/ /height/ /poly/ 
-- 
-- Computes the height of @poly@, defined as the largest of the absolute
-- values the coefficients of @poly@. Equivalently, this gives the infinity
-- norm of the coefficients. If @poly@ is zero, the height is \(0\).
foreign import ccall "fmpz_poly.h fmpz_poly_height"
  fmpz_poly_height :: Ptr CFmpz -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_2norm/ /res/ /poly/ /len/ 
-- 
-- Sets @res@ to the Euclidean norm of @(poly, len)@, that is, the integer
-- square root of the sum of the squares of the coefficients of @poly@.
foreign import ccall "fmpz_poly.h _fmpz_poly_2norm"
  _fmpz_poly_2norm :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_2norm/ /res/ /poly/ 
-- 
-- Sets @res@ to the Euclidean norm of @poly@, that is, the integer square
-- root of the sum of the squares of the coefficients of @poly@.
foreign import ccall "fmpz_poly.h fmpz_poly_2norm"
  fmpz_poly_2norm :: Ptr CFmpz -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_2norm_normalised_bits/ /poly/ /len/ 
-- 
-- Returns an upper bound on the number of bits of the normalised Euclidean
-- norm of @(poly, len)@, i.e. the number of bits of the Euclidean norm
-- divided by the absolute value of the leading coefficient. The returned
-- value will be no more than 1 bit too large.
-- 
-- This is used in the computation of the Landau-Mignotte bound.
-- 
-- It is assumed that @len > 0@. The result only makes sense if the leading
-- coefficient is nonzero.
foreign import ccall "fmpz_poly.h _fmpz_poly_2norm_normalised_bits"
  _fmpz_poly_2norm_normalised_bits :: Ptr CFmpz -> CLong -> IO CMpLimb

-- Greatest common divisor -----------------------------------------------------

-- | /_fmpz_poly_gcd_subresultant/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Computes the greatest common divisor @(res, len2)@ of @(poly1, len1)@
-- and @(poly2, len2)@, assuming @len1 >= len2 > 0@. The result is
-- normalised to have positive leading coefficient. Aliasing between @res@,
-- @poly1@ and @poly2@ is supported.
foreign import ccall "fmpz_poly.h _fmpz_poly_gcd_subresultant"
  _fmpz_poly_gcd_subresultant :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_gcd_subresultant/ /res/ /poly1/ /poly2/ 
-- 
-- Computes the greatest common divisor @res@ of @poly1@ and @poly2@,
-- normalised to have non-negative leading coefficient.
-- 
-- This function uses the subresultant algorithm as described in [Algorithm
-- 3.3.1]< [Coh1996]>.
foreign import ccall "fmpz_poly.h fmpz_poly_gcd_subresultant"
  fmpz_poly_gcd_subresultant :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_gcd_heuristic/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Computes the greatest common divisor @(res, len2)@ of @(poly1, len1)@
-- and @(poly2, len2)@, assuming @len1 >= len2 > 0@. The result is
-- normalised to have positive leading coefficient. Aliasing between @res@,
-- @poly1@ and @poly2@ is not supported. The function may not always
-- succeed in finding the GCD. If it fails, the function returns 0,
-- otherwise it returns 1.
foreign import ccall "fmpz_poly.h _fmpz_poly_gcd_heuristic"
  _fmpz_poly_gcd_heuristic :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO CInt

-- | /fmpz_poly_gcd_heuristic/ /res/ /poly1/ /poly2/ 
-- 
-- Computes the greatest common divisor @res@ of @poly1@ and @poly2@,
-- normalised to have non-negative leading coefficient.
-- 
-- The function may not always succeed in finding the GCD. If it fails, the
-- function returns 0, otherwise it returns 1.
-- 
-- This function uses the heuristic GCD algorithm (GCDHEU). The basic
-- strategy is to remove the content of the polynomials, pack them using
-- Kronecker segmentation (given a bound on the size of the coefficients of
-- the GCD) and take the integer GCD. Unpack the result and test
-- divisibility.
foreign import ccall "fmpz_poly.h fmpz_poly_gcd_heuristic"
  fmpz_poly_gcd_heuristic :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO CInt

-- | /_fmpz_poly_gcd_modular/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Computes the greatest common divisor @(res, len2)@ of @(poly1, len1)@
-- and @(poly2, len2)@, assuming @len1 >= len2 > 0@. The result is
-- normalised to have positive leading coefficient. Aliasing between @res@,
-- @poly1@ and @poly2@ is not supported.
foreign import ccall "fmpz_poly.h _fmpz_poly_gcd_modular"
  _fmpz_poly_gcd_modular :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_gcd_modular/ /res/ /poly1/ /poly2/ 
-- 
-- Computes the greatest common divisor @res@ of @poly1@ and @poly2@,
-- normalised to have non-negative leading coefficient.
-- 
-- This function uses the modular GCD algorithm. The basic strategy is to
-- remove the content of the polynomials, reduce them modulo sufficiently
-- many primes and do CRT reconstruction until some bound is reached (or we
-- can prove with trial division that we have the GCD).
foreign import ccall "fmpz_poly.h fmpz_poly_gcd_modular"
  fmpz_poly_gcd_modular :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_gcd/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Computes the greatest common divisor @res@ of @(poly1, len1)@ and
-- @(poly2, len2)@, assuming @len1 >= len2 > 0@. The result is normalised
-- to have positive leading coefficient.
-- 
-- Assumes that @res@ has space for @len2@ coefficients. Aliasing between
-- @res@, @poly1@ and @poly2@ is not supported.
foreign import ccall "fmpz_poly.h _fmpz_poly_gcd"
  _fmpz_poly_gcd :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_gcd/ /res/ /poly1/ /poly2/ 
-- 
-- Computes the greatest common divisor @res@ of @poly1@ and @poly2@,
-- normalised to have non-negative leading coefficient.
foreign import ccall "fmpz_poly.h fmpz_poly_gcd"
  fmpz_poly_gcd :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_xgcd_modular/ /r/ /s/ /t/ /f/ /len1/ /g/ /len2/ 
-- 
-- Set \(r\) to the resultant of @(f, len1)@ and @(g, len2)@. If the
-- resultant is zero, the function returns immediately. Otherwise it finds
-- polynomials \(s\) and \(t\) such that @s*f + t*g = r@. The length of
-- \(s\) will be no greater than @len2@ and the length of \(t\) will be no
-- greater than @len1@ (both are zero padded if necessary).
-- 
-- It is assumed that @len1 >= len2 > 0@. No aliasing of inputs and outputs
-- is permitted.
-- 
-- The function assumes that \(f\) and \(g\) are primitive (have Gaussian
-- content equal to 1). The result is undefined otherwise.
-- 
-- Uses a multimodular algorithm. The resultant is first computed and
-- extended GCD\'s modulo various primes \(p\) are computed and combined
-- using CRT. When the CRT stabilises the resulting polynomials are simply
-- reduced modulo further primes until a proven bound is reached.
foreign import ccall "fmpz_poly.h _fmpz_poly_xgcd_modular"
  _fmpz_poly_xgcd_modular :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_xgcd_modular/ /r/ /s/ /t/ /f/ /g/ 
-- 
-- Set \(r\) to the resultant of \(f\) and \(g\). If the resultant is zero,
-- the function then returns immediately, otherwise \(s\) and \(t\) are
-- found such that @s*f + t*g = r@.
-- 
-- The function assumes that \(f\) and \(g\) are primitive (have Gaussian
-- content equal to 1). The result is undefined otherwise.
-- 
-- Uses the multimodular algorithm.
foreign import ccall "fmpz_poly.h fmpz_poly_xgcd_modular"
  fmpz_poly_xgcd_modular :: Ptr CFmpz -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_xgcd/ /r/ /s/ /t/ /f/ /len1/ /g/ /len2/ 
-- 
-- Set \(r\) to the resultant of @(f, len1)@ and @(g, len2)@. If the
-- resultant is zero, the function returns immediately. Otherwise it finds
-- polynomials \(s\) and \(t\) such that @s*f + t*g = r@. The length of
-- \(s\) will be no greater than @len2@ and the length of \(t\) will be no
-- greater than @len1@ (both are zero padded if necessary).
-- 
-- The function assumes that \(f\) and \(g\) are primitive (have Gaussian
-- content equal to 1). The result is undefined otherwise.
-- 
-- It is assumed that @len1 >= len2 > 0@. No aliasing of inputs and outputs
-- is permitted.
foreign import ccall "fmpz_poly.h _fmpz_poly_xgcd"
  _fmpz_poly_xgcd :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_xgcd/ /r/ /s/ /t/ /f/ /g/ 
-- 
-- Set \(r\) to the resultant of \(f\) and \(g\). If the resultant is zero,
-- the function then returns immediately, otherwise \(s\) and \(t\) are
-- found such that @s*f + t*g = r@.
-- 
-- The function assumes that \(f\) and \(g\) are primitive (have Gaussian
-- content equal to 1). The result is undefined otherwise.
foreign import ccall "fmpz_poly.h fmpz_poly_xgcd"
  fmpz_poly_xgcd :: Ptr CFmpz -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_lcm/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Sets @(res, len1 + len2 - 1)@ to the least common multiple of the two
-- polynomials @(poly1, len1)@ and @(poly2, len2)@, normalised to have
-- non-negative leading coefficient.
-- 
-- Assumes that @len1 >= len2 > 0@.
-- 
-- Does not support aliasing.
foreign import ccall "fmpz_poly.h _fmpz_poly_lcm"
  _fmpz_poly_lcm :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_lcm/ /res/ /poly1/ /poly2/ 
-- 
-- Sets @res@ to the least common multiple of the two polynomials @poly1@
-- and @poly2@, normalised to have non-negative leading coefficient.
-- 
-- If either of the two polynomials is zero, sets @res@ to zero.
-- 
-- This ensures that the equality
-- 
-- \[`\]
-- \[f g = \gcd(f, g) \operatorname{lcm}(f, g)\]
-- 
-- holds up to sign.
foreign import ccall "fmpz_poly.h fmpz_poly_lcm"
  fmpz_poly_lcm :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_resultant_modular/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Sets @res@ to the resultant of @(poly1, len1)@ and @(poly2, len2)@,
-- assuming that @len1 >= len2 > 0@.
foreign import ccall "fmpz_poly.h _fmpz_poly_resultant_modular"
  _fmpz_poly_resultant_modular :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_resultant_modular/ /res/ /poly1/ /poly2/ 
-- 
-- Computes the resultant of @poly1@ and @poly2@.
-- 
-- For two non-zero polynomials \(f(x) = a_m x^m + \dotsb + a_0\) and
-- \(g(x) = b_n x^n + \dotsb + b_0\) of degrees \(m\) and \(n\), the
-- resultant is defined to be
-- 
-- \[`\]
-- \[a_m^n b_n^m \prod_{(x, y) : f(x) = g(y) = 0} (x - y).\]
-- 
-- For convenience, we define the resultant to be equal to zero if either
-- of the two polynomials is zero.
-- 
-- This function uses the modular algorithm described in < [Col1971]>.
foreign import ccall "fmpz_poly.h fmpz_poly_resultant_modular"
  fmpz_poly_resultant_modular :: Ptr CFmpz -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /fmpz_poly_resultant_modular_div/ /res/ /poly1/ /poly2/ /div/ /nbits/ 
-- 
-- Computes the resultant of @poly1@ and @poly2@ divided by @div@ using a
-- slight modification of the above function. It is assumed that the
-- resultant is exactly divisible by @div@ and the result @res@ has at most
-- @nbits@ bits. This bypasses the computation of general bounds.
foreign import ccall "fmpz_poly.h fmpz_poly_resultant_modular_div"
  fmpz_poly_resultant_modular_div :: Ptr CFmpz -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> CLong -> IO ()

-- | /_fmpz_poly_resultant_euclidean/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Sets @res@ to the resultant of @(poly1, len1)@ and @(poly2, len2)@,
-- assuming that @len1 >= len2 > 0@.
foreign import ccall "fmpz_poly.h _fmpz_poly_resultant_euclidean"
  _fmpz_poly_resultant_euclidean :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_resultant_euclidean/ /res/ /poly1/ /poly2/ 
-- 
-- Computes the resultant of @poly1@ and @poly2@.
-- 
-- For two non-zero polynomials \(f(x) = a_m x^m + \dotsb + a_0\) and
-- \(g(x) = b_n x^n + \dotsb + b_0\) of degrees \(m\) and \(n\), the
-- resultant is defined to be
-- 
-- \[`\]
-- \[a_m^n b_n^m \prod_{(x, y) : f(x) = g(y) = 0} (x - y).\]
-- 
-- For convenience, we define the resultant to be equal to zero if either
-- of the two polynomials is zero.
-- 
-- This function uses the algorithm described in [Algorithm
-- 3.3.7]< [Coh1996]>.
foreign import ccall "fmpz_poly.h fmpz_poly_resultant_euclidean"
  fmpz_poly_resultant_euclidean :: Ptr CFmpz -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_resultant/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Sets @res@ to the resultant of @(poly1, len1)@ and @(poly2, len2)@,
-- assuming that @len1 >= len2 > 0@.
foreign import ccall "fmpz_poly.h _fmpz_poly_resultant"
  _fmpz_poly_resultant :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_resultant/ /res/ /poly1/ /poly2/ 
-- 
-- Computes the resultant of @poly1@ and @poly2@.
-- 
-- For two non-zero polynomials \(f(x) = a_m x^m + \dotsb + a_0\) and
-- \(g(x) = b_n x^n + \dotsb + b_0\) of degrees \(m\) and \(n\), the
-- resultant is defined to be
-- 
-- \[`\]
-- \[a_m^n b_n^m \prod_{(x, y) : f(x) = g(y) = 0} (x - y).\]
-- 
-- For convenience, we define the resultant to be equal to zero if either
-- of the two polynomials is zero.
foreign import ccall "fmpz_poly.h fmpz_poly_resultant"
  fmpz_poly_resultant :: Ptr CFmpz -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- Discriminant ----------------------------------------------------------------

-- | /_fmpz_poly_discriminant/ /res/ /poly/ /len/ 
-- 
-- Set @res@ to the discriminant of @(poly, len)@. Assumes @len > 1@.
foreign import ccall "fmpz_poly.h _fmpz_poly_discriminant"
  _fmpz_poly_discriminant :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_discriminant/ /res/ /poly/ 
-- 
-- Set @res@ to the discriminant of @poly@. We normalise the discriminant
-- so that \(\operatorname{disc}(f) = (-1)^{(n(n-1)/2)}
-- \operatorname{res}(f, f')/\operatorname{lc}(f)\), thus
-- \(\operatorname{disc}(f) = \operatorname{lc}(f)^{(2n - 2)} \prod_{i < j} (r_i
-- - r_j)^2\), where \(\operatorname{lc}(f)\) is the leading coefficient of
-- \(f\), \(n\) is the degree of \(f\) and \(r_i\) are the roots of \(f\).
foreign import ccall "fmpz_poly.h fmpz_poly_discriminant"
  fmpz_poly_discriminant :: Ptr CFmpz -> Ptr CFmpzPoly -> IO ()

-- Gaussian content ------------------------------------------------------------

-- | /_fmpz_poly_content/ /res/ /poly/ /len/ 
-- 
-- Sets @res@ to the non-negative content of @(poly, len)@. Aliasing
-- between @res@ and the coefficients of @poly@ is not supported.
foreign import ccall "fmpz_poly.h _fmpz_poly_content"
  _fmpz_poly_content :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_content/ /res/ /poly/ 
-- 
-- Sets @res@ to the non-negative content of @poly@. The content of the
-- zero polynomial is defined to be zero. Supports aliasing, that is, @res@
-- is allowed to be one of the coefficients of @poly@.
foreign import ccall "fmpz_poly.h fmpz_poly_content"
  fmpz_poly_content :: Ptr CFmpz -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_primitive_part/ /res/ /poly/ /len/ 
-- 
-- Sets @(res, len)@ to @(poly, len)@ divided by the content of
-- @(poly, len)@, and normalises the result to have non-negative leading
-- coefficient.
-- 
-- Assumes that @(poly, len)@ is non-zero. Supports aliasing of @res@ and
-- @poly@.
foreign import ccall "fmpz_poly.h _fmpz_poly_primitive_part"
  _fmpz_poly_primitive_part :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_primitive_part/ /res/ /poly/ 
-- 
-- Sets @res@ to @poly@ divided by the content of @poly@, and normalises
-- the result to have non-negative leading coefficient. If @poly@ is zero,
-- sets @res@ to zero.
foreign import ccall "fmpz_poly.h fmpz_poly_primitive_part"
  fmpz_poly_primitive_part :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- Square-free -----------------------------------------------------------------

-- | /_fmpz_poly_is_squarefree/ /poly/ /len/ 
-- 
-- Returns whether the polynomial @(poly, len)@ is square-free.
foreign import ccall "fmpz_poly.h _fmpz_poly_is_squarefree"
  _fmpz_poly_is_squarefree :: Ptr CFmpz -> CLong -> IO CInt

-- | /fmpz_poly_is_squarefree/ /poly/ 
-- 
-- Returns whether the polynomial @poly@ is square-free. A non-zero
-- polynomial is defined to be square-free if it has no non-unit square
-- factors. We also define the zero polynomial to be square-free.
-- 
-- Returns \(1\) if the length of @poly@ is at most \(2\). Returns whether
-- the discriminant is zero for quadratic polynomials. Otherwise, returns
-- whether the greatest common divisor of @poly@ and its derivative has
-- length \(1\).
foreign import ccall "fmpz_poly.h fmpz_poly_is_squarefree"
  fmpz_poly_is_squarefree :: Ptr CFmpzPoly -> IO CInt

-- Euclidean division ----------------------------------------------------------

-- | /_fmpz_poly_divrem_basecase/ /Q/ /R/ /A/ /lenA/ /B/ /lenB/ /exact/ 
-- 
-- Computes @(Q, lenA - lenB + 1)@, @(R, lenA)@ such that \(A = B Q + R\)
-- and each coefficient of \(R\) beyond @lenB@ is reduced modulo the
-- leading coefficient of \(B\). If the leading coefficient of \(B\) is
-- \(\pm 1\) or the division is exact, this is the same thing as division
-- over \(\mathbb{Q}\).
-- 
-- Assumes that \(\operatorname{len}(A), \operatorname{len}(B) > 0\).
-- Allows zero-padding in @(A, lenA)@. \(R\) and \(A\) may be aliased, but
-- apart from this no aliasing of input and output operands is allowed.
-- 
-- If the flag @exact@ is \(1\), the function stops if an inexact division
-- is encountered, upon which the function will return \(0\). If no inexact
-- division is encountered, the function returns \(1\). Note that this does
-- not guarantee the remainder of the polynomial division is zero, merely
-- that its length is less than that of B. This feature is useful for
-- series division and for divisibility testing (upon testing the
-- remainder).
-- 
-- For ordinary use set the flag @exact@ to \(0\). In this case, no checks
-- or early aborts occur and the function always returns \(1\).
foreign import ccall "fmpz_poly.h _fmpz_poly_divrem_basecase"
  _fmpz_poly_divrem_basecase :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CInt -> IO CInt

-- | /fmpz_poly_divrem_basecase/ /Q/ /R/ /A/ /B/ 
-- 
-- Computes \(Q\), \(R\) such that \(A = B Q + R\) and each coefficient of
-- \(R\) beyond \(\operatorname{len}(B) - 1\) is reduced modulo the leading
-- coefficient of \(B\). If the leading coefficient of \(B\) is \(\pm 1\)
-- or the division is exact, this is the same thing as division over
-- \(\mathbb{Q}\). An exception is raised if \(B\) is zero.
foreign import ccall "fmpz_poly.h fmpz_poly_divrem_basecase"
  fmpz_poly_divrem_basecase :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_divrem_divconquer_recursive/ /Q/ /BQ/ /W/ /A/ /B/ /lenB/ /exact/ 
-- 
-- Computes @(Q, lenB)@, @(BQ, 2 lenB - 1)@ such that \(BQ = B \times Q\)
-- and \(A = B Q + R\) where each coefficient of \(R\) beyond
-- \(\operatorname{len}(B) - 1\) is reduced modulo the leading coefficient
-- of \(B\). We assume that
-- \(\operatorname{len}(A) = 2 \operatorname{len}(B) - 1\). If the leading
-- coefficient of \(B\) is \(\pm 1\) or the division is exact, this is the
-- same as division over \(\mathbb{Q}\).
-- 
-- Assumes \(\operatorname{len}(B) > 0\). Allows zero-padding in
-- @(A, lenA)@. Requires a temporary array @(W, 2 lenB - 1)@. No aliasing
-- of input and output operands is allowed.
-- 
-- This function does not read the bottom \(\operatorname{len}(B) - 1\)
-- coefficients from \(A\), which means that they might not even need to
-- exist in allocated memory.
-- 
-- If the flag @exact@ is \(1\), the function stops if an inexact division
-- is encountered, upon which the function will return \(0\). If no inexact
-- division is encountered, the function returns \(1\). Note that this does
-- not guarantee the remainder of the polynomial division is zero, merely
-- that its length is less than that of B. This feature is useful for
-- series division and for divisibility testing (upon testing the
-- remainder).
-- 
-- For ordinary use set the flag @exact@ to \(0\). In this case, no checks
-- or early aborts occur and the function always returns \(1\).
foreign import ccall "fmpz_poly.h _fmpz_poly_divrem_divconquer_recursive"
  _fmpz_poly_divrem_divconquer_recursive :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> CInt -> IO CInt

-- | /_fmpz_poly_divrem_divconquer/ /Q/ /R/ /A/ /lenA/ /B/ /lenB/ /exact/ 
-- 
-- Computes @(Q, lenA - lenB + 1)@, @(R, lenA)@ such that \(A = B Q + R\)
-- and each coefficient of \(R\) beyond \(\operatorname{len}(B) - 1\) is
-- reduced modulo the leading coefficient of \(B\). If the leading
-- coefficient of \(B\) is \(\pm 1\) or the division is exact, this is the
-- same as division over \(\mathbb{Q}\).
-- 
-- Assumes \(\operatorname{len}(A) \geq \operatorname{len}(B) > 0\). Allows
-- zero-padding in @(A, lenA)@. No aliasing of input and output operands is
-- allowed.
-- 
-- If the flag @exact@ is \(1\), the function stops if an inexact division
-- is encountered, upon which the function will return \(0\). If no inexact
-- division is encountered, the function returns \(1\). Note that this does
-- not guarantee the remainder of the polynomial division is zero, merely
-- that its length is less than that of B. This feature is useful for
-- series division and for divisibility testing (upon testing the
-- remainder).
-- 
-- For ordinary use set the flag @exact@ to \(0\). In this case, no checks
-- or early aborts occur and the function always returns \(1\).
foreign import ccall "fmpz_poly.h _fmpz_poly_divrem_divconquer"
  _fmpz_poly_divrem_divconquer :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CInt -> IO CInt

-- | /fmpz_poly_divrem_divconquer/ /Q/ /R/ /A/ /B/ 
-- 
-- Computes \(Q\), \(R\) such that \(A = B Q + R\) and each coefficient of
-- \(R\) beyond \(\operatorname{len}(B) - 1\) is reduced modulo the leading
-- coefficient of \(B\). If the leading coefficient of \(B\) is \(\pm 1\)
-- or the division is exact, this is the same as division over
-- \(\mathbb{Q}\). An exception is raised if \(B\) is zero.
foreign import ccall "fmpz_poly.h fmpz_poly_divrem_divconquer"
  fmpz_poly_divrem_divconquer :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_divrem/ /Q/ /R/ /A/ /lenA/ /B/ /lenB/ /exact/ 
-- 
-- Computes @(Q, lenA - lenB + 1)@, @(R, lenA)@ such that \(A = B Q + R\)
-- and each coefficient of \(R\) beyond \(\operatorname{len}(B) - 1\) is
-- reduced modulo the leading coefficient of \(B\). If the leading
-- coefficient of \(B\) is \(\pm 1\) or the division is exact, this is the
-- same thing as division over \(\mathbb{Q}\).
-- 
-- Assumes \(\operatorname{len}(A) \geq \operatorname{len}(B) > 0\). Allows
-- zero-padding in @(A, lenA)@. No aliasing of input and output operands is
-- allowed.
-- 
-- If the flag @exact@ is \(1\), the function stops if an inexact division
-- is encountered, upon which the function will return \(0\). If no inexact
-- division is encountered, the function returns \(1\). Note that this does
-- not guarantee the remainder of the polynomial division is zero, merely
-- that its length is less than that of B. This feature is useful for
-- series division and for divisibility testing (upon testing the
-- remainder).
-- 
-- For ordinary use set the flag @exact@ to \(0\). In this case, no checks
-- or early aborts occur and the function always returns \(1\).
foreign import ccall "fmpz_poly.h _fmpz_poly_divrem"
  _fmpz_poly_divrem :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CInt -> IO CInt

-- | /fmpz_poly_divrem/ /Q/ /R/ /A/ /B/ 
-- 
-- Computes \(Q\), \(R\) such that \(A = B Q + R\) and each coefficient of
-- \(R\) beyond \(\operatorname{len}(B) - 1\) is reduced modulo the leading
-- coefficient of \(B\). If the leading coefficient of \(B\) is \(\pm 1\)
-- or the division is exact, this is the same as division over
-- \(\mathbb{Q}\). An exception is raised if \(B\) is zero.
foreign import ccall "fmpz_poly.h fmpz_poly_divrem"
  fmpz_poly_divrem :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_div_basecase/ /Q/ /R/ /A/ /lenA/ /B/ /lenB/ /exact/ 
-- 
-- Computes the quotient @(Q, lenA - lenB + 1)@ of @(A, lenA)@ divided by
-- @(B, lenB)@.
-- 
-- Notationally, computes \(Q\), \(R\) such that \(A = B Q + R\) and each
-- coefficient of \(R\) beyond \(\operatorname{len}(B) - 1\) is reduced
-- modulo the leading coefficient of \(B\).
-- 
-- If the leading coefficient of \(B\) is \(\pm 1\) or the division is
-- exact, this is the same as division over \(\mathbb{Q}\).
-- 
-- Assumes \(\operatorname{len}(A), \operatorname{len}(B) > 0\). Allows
-- zero-padding in @(A, lenA)@. Requires a temporary array \(R\) of size at
-- least the (actual) length of \(A\). For convenience, \(R\) may be
-- @NULL@. \(R\) and \(A\) may be aliased, but apart from this no aliasing
-- of input and output operands is allowed.
-- 
-- If the flag @exact@ is \(1\), the function stops if an inexact division
-- is encountered, upon which the function will return \(0\). If no inexact
-- division is encountered, the function returns \(1\). Note that this does
-- not guarantee the remainder of the polynomial division is zero, merely
-- that its length is less than that of B. This feature is useful for
-- series division and for divisibility testing (upon testing the
-- remainder).
-- 
-- For ordinary use set the flag @exact@ to \(0\). In this case, no checks
-- or early aborts occur and the function always returns \(1\).
foreign import ccall "fmpz_poly.h _fmpz_poly_div_basecase"
  _fmpz_poly_div_basecase :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CInt -> IO CInt

-- | /fmpz_poly_div_basecase/ /Q/ /A/ /B/ 
-- 
-- Computes the quotient \(Q\) of \(A\) divided by \(Q\).
-- 
-- Notationally, computes \(Q\), \(R\) such that \(A = B Q + R\) and each
-- coefficient of \(R\) beyond \(\operatorname{len}(B) - 1\) is reduced
-- modulo the leading coefficient of \(B\).
-- 
-- If the leading coefficient of \(B\) is \(\pm 1\) or the division is
-- exact, this is the same as division over \(\mathbb{Q}\). An exception is
-- raised if \(B\) is zero.
foreign import ccall "fmpz_poly.h fmpz_poly_div_basecase"
  fmpz_poly_div_basecase :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_divremlow_divconquer_recursive/ /Q/ /BQ/ /A/ /B/ /lenB/ /exact/ 
-- 
-- Divide and conquer division of @(A, 2 lenB - 1)@ by @(B, lenB)@,
-- computing only the bottom \(\operatorname{len}(B) - 1\) coefficients of
-- \(B Q\).
-- 
-- Assumes \(\operatorname{len}(B) > 0\). Requires \(B Q\) to have length
-- at least \(2 \operatorname{len}(B) - 1\), although only the bottom
-- \(\operatorname{len}(B) - 1\) coefficients will carry meaningful output.
-- Does not support any aliasing. Allows zero-padding in \(A\), but not in
-- \(B\).
-- 
-- If the flag @exact@ is \(1\), the function stops if an inexact division
-- is encountered, upon which the function will return \(0\). If no inexact
-- division is encountered, the function returns \(1\). Note that this does
-- not guarantee the remainder of the polynomial division is zero, merely
-- that its length is less than that of B. This feature is useful for
-- series division and for divisibility testing (upon testing the
-- remainder).
-- 
-- For ordinary use set the flag @exact@ to \(0\). In this case, no checks
-- or early aborts occur and the function always returns \(1\).
foreign import ccall "fmpz_poly.h _fmpz_poly_divremlow_divconquer_recursive"
  _fmpz_poly_divremlow_divconquer_recursive :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> CInt -> IO CInt

-- | /_fmpz_poly_div_divconquer_recursive/ /Q/ /temp/ /A/ /B/ /lenB/ /exact/ 
-- 
-- Recursive short division in the balanced case.
-- 
-- Computes the quotient @(Q, lenB)@ of @(A, 2 lenB - 1)@ upon division by
-- @(B, lenB)@. Requires \(\operatorname{len}(B) > 0\). Needs a temporary
-- array @temp@ of length \(2 \operatorname{len}(B) - 1\). Does not support
-- any aliasing.
-- 
-- For further details, see < [Mul2000]>.
-- 
-- If the flag @exact@ is \(1\), the function stops if an inexact division
-- is encountered, upon which the function will return \(0\). If no inexact
-- division is encountered, the function returns \(1\). Note that this does
-- not guarantee the remainder of the polynomial division is zero, merely
-- that its length is less than that of B. This feature is useful for
-- series division and for divisibility testing (upon testing the
-- remainder).
-- 
-- For ordinary use set the flag @exact@ to \(0\). In this case, no checks
-- or early aborts occur and the function always returns \(1\).
foreign import ccall "fmpz_poly.h _fmpz_poly_div_divconquer_recursive"
  _fmpz_poly_div_divconquer_recursive :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> CInt -> IO CInt

-- | /_fmpz_poly_div_divconquer/ /Q/ /A/ /lenA/ /B/ /lenB/ /exact/ 
-- 
-- Computes the quotient @(Q, lenA - lenB + 1)@ of @(A, lenA)@ upon
-- division by @(B, lenB)@. Assumes that
-- \(\operatorname{len}(A) \geq \operatorname{len}(B) > 0\). Does not
-- support aliasing.
-- 
-- If the flag @exact@ is \(1\), the function stops if an inexact division
-- is encountered, upon which the function will return \(0\). If no inexact
-- division is encountered, the function returns \(1\). Note that this does
-- not guarantee the remainder of the polynomial division is zero, merely
-- that its length is less than that of B. This feature is useful for
-- series division and for divisibility testing (upon testing the
-- remainder).
-- 
-- For ordinary use set the flag @exact@ to \(0\). In this case, no checks
-- or early aborts occur and the function always returns \(1\).
foreign import ccall "fmpz_poly.h _fmpz_poly_div_divconquer"
  _fmpz_poly_div_divconquer :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CInt -> IO CInt

-- | /fmpz_poly_div_divconquer/ /Q/ /A/ /B/ 
-- 
-- Computes the quotient \(Q\) of \(A\) divided by \(B\).
-- 
-- Notationally, computes \(Q\), \(R\) such that \(A = B Q + R\) and each
-- coefficient of \(R\) beyond \(\operatorname{len}(B) - 1\) is reduced
-- modulo the leading coefficient of \(B\).
-- 
-- If the leading coefficient of \(B\) is \(\pm 1\) or the division is
-- exact, this is the same as division over \(\mathbb{Q}\). An exception is
-- raised if \(B\) is zero.
foreign import ccall "fmpz_poly.h fmpz_poly_div_divconquer"
  fmpz_poly_div_divconquer :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_div/ /Q/ /A/ /lenA/ /B/ /lenB/ /exact/ 
-- 
-- Computes the quotient @(Q, lenA - lenB + 1)@ of @(A, lenA)@ divided by
-- @(B, lenB)@.
-- 
-- Notationally, computes \(Q\), \(R\) such that \(A = B Q + R\) and each
-- coefficient of \(R\) beyond \(\operatorname{len}(B) - 1\) is reduced
-- modulo the leading coefficient of \(B\). If the leading coefficient of
-- \(B\) is \(\pm 1\) or the division is exact, this is the same as
-- division over \(\mathbb{Q}\).
-- 
-- Assumes \(\operatorname{len}(A) \geq \operatorname{len}(B) > 0\). Allows
-- zero-padding in @(A, lenA)@. Aliasing of input and output operands is
-- not allowed.
-- 
-- If the flag @exact@ is \(1\), the function stops if an inexact division
-- is encountered, upon which the function will return \(0\). If no inexact
-- division is encountered, the function returns \(1\). Note that this does
-- not guarantee the remainder of the polynomial division is zero, merely
-- that its length is less than that of B. This feature is useful for
-- series division and for divisibility testing (upon testing the
-- remainder).
-- 
-- For ordinary use set the flag @exact@ to \(0\). In this case, no checks
-- or early aborts occur and the function always returns \(1\).
foreign import ccall "fmpz_poly.h _fmpz_poly_div"
  _fmpz_poly_div :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CInt -> IO CInt

-- | /fmpz_poly_div/ /Q/ /A/ /B/ 
-- 
-- Computes the quotient \(Q\) of \(A\) divided by \(B\).
-- 
-- Notationally, computes \(Q\), \(R\) such that \(A = B Q + R\) and each
-- coefficient of \(R\) beyond \(\operatorname{len}(B) - 1\) is reduced
-- modulo the leading coefficient of \(B\). If the leading coefficient of
-- \(B\) is \(\pm 1\) or the division is exact, this is the same as
-- division over \(Q\). An exception is raised if \(B\) is zero.
foreign import ccall "fmpz_poly.h fmpz_poly_div"
  fmpz_poly_div :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_rem_basecase/ /R/ /A/ /lenA/ /B/ /lenB/ 
-- 
-- Computes the remainder @(R, lenA)@ of @(A, lenA)@ upon division by
-- @(B, lenB)@.
-- 
-- Notationally, computes \(Q\), \(R\) such that \(A = B Q + R\) and each
-- coefficient of \(R\) beyond \(\operatorname{len}(B) - 1\) is reduced
-- modulo the leading coefficient of \(B\). If the leading coefficient of
-- \(B\) is \(\pm 1\) or the division is exact, this is the same thing as
-- division over \(\mathbb{Q}\).
-- 
-- Assumes that \(\operatorname{len}(A), \operatorname{len}(B) > 0\).
-- Allows zero-padding in @(A, lenA)@. \(R\) and \(A\) may be aliased, but
-- apart from this no aliasing of input and output operands is allowed.
foreign import ccall "fmpz_poly.h _fmpz_poly_rem_basecase"
  _fmpz_poly_rem_basecase :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_rem_basecase/ /R/ /A/ /B/ 
-- 
-- Computes the remainder \(R\) of \(A\) upon division by \(B\).
-- 
-- Notationally, computes \(Q\), \(R\) such that \(A = B Q + R\) and each
-- coefficient of \(R\) beyond \(\operatorname{len}(B) - 1\) is reduced
-- modulo the leading coefficient of \(B\). If the leading coefficient of
-- \(B\) is \(\pm 1\) or the division is exact, this is the same as
-- division over \(\mathbb{Q}\). An exception is raised if \(B\) is zero.
foreign import ccall "fmpz_poly.h fmpz_poly_rem_basecase"
  fmpz_poly_rem_basecase :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_rem/ /R/ /A/ /lenA/ /B/ /lenB/ 
-- 
-- Computes the remainder @(R, lenA)@ of @(A, lenA)@ upon division by
-- @(B, lenB)@.
-- 
-- Notationally, computes \(Q\), \(R\) such that \(A = B Q + R\) and each
-- coefficient of \(R\) beyond \(\operatorname{len}(B) - 1\) is reduced
-- modulo the leading coefficient of \(B\). If the leading coefficient of
-- \(B\) is \(\pm 1\) or the division is exact, this is the same thing as
-- division over \(\mathbb{Q}\).
-- 
-- Assumes that \(\operatorname{len}(A) \geq \operatorname{len}(B) > 0\).
-- Allows zero-padding in @(A, lenA)@. Aliasing of input and output
-- operands is not allowed.
foreign import ccall "fmpz_poly.h _fmpz_poly_rem"
  _fmpz_poly_rem :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_rem/ /R/ /A/ /B/ 
-- 
-- Computes the remainder \(R\) of \(A\) upon division by \(B\).
-- 
-- Notationally, computes \(Q\), \(R\) such that \(A = B Q + R\) and each
-- coefficient of \(R\) beyond \(\operatorname{len}(B) - 1\) is reduced
-- modulo the leading coefficient of \(B\). If the leading coefficient of
-- \(B\) is \(\pm 1\) or the division is exact, this is the same as
-- division over \(\mathbb{Q}\). An exception is raised if \(B\) is zero.
foreign import ccall "fmpz_poly.h fmpz_poly_rem"
  fmpz_poly_rem :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_div_root/ /Q/ /A/ /len/ /c/ 
-- 
-- Computes the quotient @(Q, len-1)@ of @(A, len)@ upon division by
-- \(x - c\).
-- 
-- Supports aliasing of @Q@ and @A@, but the result is undefined in case of
-- partial overlap.
foreign import ccall "fmpz_poly.h _fmpz_poly_div_root"
  _fmpz_poly_div_root :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> IO ()

-- | /fmpz_poly_div_root/ /Q/ /A/ /c/ 
-- 
-- Computes the quotient @(Q, len-1)@ of @(A, len)@ upon division by
-- \(x - c\).
foreign import ccall "fmpz_poly.h fmpz_poly_div_root"
  fmpz_poly_div_root :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- Division with precomputed inverse -------------------------------------------

-- | /_fmpz_poly_preinvert/ /B_inv/ /B/ /n/ 
-- 
-- Given a monic polynomial @B@ of length @n@, compute a precomputed
-- inverse @B_inv@ of length @n@ for use in the functions below. No
-- aliasing of @B@ and @B_inv@ is permitted. We assume @n@ is not zero.
foreign import ccall "fmpz_poly.h _fmpz_poly_preinvert"
  _fmpz_poly_preinvert :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_preinvert/ /B_inv/ /B/ 
-- 
-- Given a monic polynomial @B@, compute a precomputed inverse @B_inv@ for
-- use in the functions below. An exception is raised if @B@ is zero.
foreign import ccall "fmpz_poly.h fmpz_poly_preinvert"
  fmpz_poly_preinvert :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_div_preinv/ /Q/ /A/ /len1/ /B/ /B_inv/ /len2/ 
-- 
-- Given a precomputed inverse @B_inv@ of the polynomial @B@ of length
-- @len2@, compute the quotient @Q@ of @A@ by @B@. We assume the length
-- @len1@ of @A@ is at least @len2@. The polynomial @Q@ must have space for
-- @len1 - len2 + 1@ coefficients. No aliasing of operands is permitted.
foreign import ccall "fmpz_poly.h _fmpz_poly_div_preinv"
  _fmpz_poly_div_preinv :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_div_preinv/ /Q/ /A/ /B/ /B_inv/ 
-- 
-- Given a precomputed inverse @B_inv@ of the polynomial @B@, compute the
-- quotient @Q@ of @A@ by @B@. Aliasing of @B@ and @B_inv@ is not
-- permitted.
foreign import ccall "fmpz_poly.h fmpz_poly_div_preinv"
  fmpz_poly_div_preinv :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_divrem_preinv/ /Q/ /A/ /len1/ /B/ /B_inv/ /len2/ 
-- 
-- Given a precomputed inverse @B_inv@ of the polynomial @B@ of length
-- @len2@, compute the quotient @Q@ of @A@ by @B@. The remainder is then
-- placed in @A@. We assume the length @len1@ of @A@ is at least @len2@.
-- The polynomial @Q@ must have space for @len1 - len2 + 1@ coefficients.
-- No aliasing of operands is permitted.
foreign import ccall "fmpz_poly.h _fmpz_poly_divrem_preinv"
  _fmpz_poly_divrem_preinv :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_divrem_preinv/ /Q/ /R/ /A/ /B/ /B_inv/ 
-- 
-- Given a precomputed inverse @B_inv@ of the polynomial @B@, compute the
-- quotient @Q@ of @A@ by @B@ and the remainder @R@. Aliasing of @B@ and
-- @B_inv@ is not permitted.
foreign import ccall "fmpz_poly.h fmpz_poly_divrem_preinv"
  fmpz_poly_divrem_preinv :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_powers_precompute/ /B/ /len/ 
-- 
-- Computes @2*len - 1@ powers of \(x\) modulo the polynomial \(B\) of the
-- given length. This is used as a kind of precomputed inverse in the
-- remainder routine below.
foreign import ccall "fmpz_poly.h _fmpz_poly_powers_precompute"
  _fmpz_poly_powers_precompute :: Ptr CFmpz -> CLong -> IO (Ptr (Ptr CFmpz))

-- | /fmpz_poly_powers_precompute/ /pinv/ /poly/ 
-- 
-- Computes @2*len - 1@ powers of \(x\) modulo the polynomial \(B\) of the
-- given length. This is used as a kind of precomputed inverse in the
-- remainder routine below.
foreign import ccall "fmpz_poly.h fmpz_poly_powers_precompute"
  fmpz_poly_powers_precompute :: Ptr CFmpzPolyPowersPrecomp -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_powers_clear/ /powers/ /len/ 
-- 
-- Clean up resources used by precomputed powers which have been computed
-- by @_fmpz_poly_powers_precompute@.
foreign import ccall "fmpz_poly.h _fmpz_poly_powers_clear"
  _fmpz_poly_powers_clear :: Ptr (Ptr CFmpz) -> CLong -> IO ()

-- | /fmpz_poly_powers_clear/ /pinv/ 
-- 
-- Clean up resources used by precomputed powers which have been computed
-- by @fmpz_poly_powers_precompute@.
foreign import ccall "fmpz_poly.h fmpz_poly_powers_clear"
  fmpz_poly_powers_clear :: Ptr CFmpzPolyPowersPrecomp -> IO ()

-- | /_fmpz_poly_rem_powers_precomp/ /A/ /m/ /B/ /n/ /powers/ 
-- 
-- Set \(A\) to the remainder of \(A\) divide \(B\) given precomputed
-- powers mod \(B\) provided by @_fmpz_poly_powers_precompute@. No aliasing
-- is allowed.
foreign import ccall "fmpz_poly.h _fmpz_poly_rem_powers_precomp"
  _fmpz_poly_rem_powers_precomp :: Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> Ptr (Ptr CFmpz) -> IO ()

-- | /fmpz_poly_rem_powers_precomp/ /R/ /A/ /B/ /B_inv/ 
-- 
-- Set \(R\) to the remainder of \(A\) divide \(B\) given precomputed
-- powers mod \(B\) provided by @fmpz_poly_powers_precompute@.
foreign import ccall "fmpz_poly.h fmpz_poly_rem_powers_precomp"
  fmpz_poly_rem_powers_precomp :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPolyPowersPrecomp -> IO ()

-- Divisibility testing --------------------------------------------------------

-- | /_fmpz_poly_divides/ /Q/ /A/ /lenA/ /B/ /lenB/ 
-- 
-- Returns 1 if @(B, lenB)@ divides @(A, lenA)@ exactly and sets \(Q\) to
-- the quotient, otherwise returns 0.
-- 
-- It is assumed that
-- \(\operatorname{len}(A) \geq \operatorname{len}(B) > 0\) and that \(Q\)
-- has space for \(\operatorname{len}(A) - \operatorname{len}(B) + 1\)
-- coefficients.
-- 
-- Aliasing of \(Q\) with either of the inputs is not permitted.
-- 
-- This function is currently unoptimised and provided for convenience
-- only.
foreign import ccall "fmpz_poly.h _fmpz_poly_divides"
  _fmpz_poly_divides :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO CInt

-- | /fmpz_poly_divides/ /Q/ /A/ /B/ 
-- 
-- Returns 1 if \(B\) divides \(A\) exactly and sets \(Q\) to the quotient,
-- otherwise returns 0.
-- 
-- This function is currently unoptimised and provided for convenience
-- only.
foreign import ccall "fmpz_poly.h fmpz_poly_divides"
  fmpz_poly_divides :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO CInt

-- | /fmpz_poly_remove/ /res/ /poly1/ /poly2/ 
-- 
-- Set @res@ to @poly1@ divided by the highest power of @poly2@ that
-- divides it and return the power. The divisor @poly2@ must not be zero or
-- \(\pm 1\), otherwise an exception is raised.
foreign import ccall "fmpz_poly.h fmpz_poly_remove"
  fmpz_poly_remove :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO CLong

-- Division mod p --------------------------------------------------------------

-- | /fmpz_poly_divlow_smodp/ /res/ /f/ /g/ /p/ /n/ 
-- 
-- Compute the \(n\) lowest coefficients of \(f\) divided by \(g\),
-- assuming the division is exact modulo \(p\). The computed coefficients
-- are reduced modulo \(p\) using the symmetric remainder system. We
-- require \(f\) to be at least \(n\) in length. The function can handle
-- trailing zeroes, but the low nonzero coefficient of \(g\) must be
-- coprime to \(p\). This is a bespoke function used by factoring.
foreign import ccall "fmpz_poly.h fmpz_poly_divlow_smodp"
  fmpz_poly_divlow_smodp :: Ptr CFmpz -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_divhigh_smodp/ /res/ /f/ /g/ /p/ /n/ 
-- 
-- Compute the \(n\) highest coefficients of \(f\) divided by \(g\),
-- assuming the division is exact modulo \(p\). The computed coefficients
-- are reduced modulo \(p\) using the symmetric remainder system. We
-- require \(f\) to be as output by @fmpz_poly_mulhigh_n@ given polynomials
-- \(g\) and a polynomial of length \(n\) as inputs. The leading
-- coefficient of \(g\) must be coprime to \(p\). This is a bespoke
-- function used by factoring.
foreign import ccall "fmpz_poly.h fmpz_poly_divhigh_smodp"
  fmpz_poly_divhigh_smodp :: Ptr CFmpz -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> CLong -> IO ()

-- Power series division -------------------------------------------------------

-- | /_fmpz_poly_inv_series_basecase/ /Qinv/ /Q/ /Qlen/ /n/ 
-- 
-- Computes the first \(n\) terms of the inverse power series of
-- @(Q, lenQ)@ using a recurrence.
-- 
-- Assumes that \(n \geq 1\) and that \(Q\) has constant term \(\pm 1\).
-- Does not support aliasing.
foreign import ccall "fmpz_poly.h _fmpz_poly_inv_series_basecase"
  _fmpz_poly_inv_series_basecase :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_inv_series_basecase/ /Qinv/ /Q/ /n/ 
-- 
-- Computes the first \(n\) terms of the inverse power series of \(Q\)
-- using a recurrence, assuming that \(Q\) has constant term \(\pm 1\) and
-- \(n \geq 1\).
foreign import ccall "fmpz_poly.h fmpz_poly_inv_series_basecase"
  fmpz_poly_inv_series_basecase :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_inv_series_newton/ /Qinv/ /Q/ /n/ 
-- 
-- Computes the first \(n\) terms of the inverse power series of
-- @(Q, lenQ)@ using Newton iteration.
-- 
-- Assumes that \(n \geq 1\) and that \(Q\) has constant term \(\pm 1\).
-- Does not support aliasing.
foreign import ccall "fmpz_poly.h _fmpz_poly_inv_series_newton"
  _fmpz_poly_inv_series_newton :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_inv_series_newton/ /Qinv/ /Q/ /Qlen/ /n/ 
-- 
-- Computes the first \(n\) terms of the inverse power series of \(Q\)
-- using Newton iteration, assuming \(Q\) has constant term \(\pm 1\) and
-- \(n \geq 1\).
foreign import ccall "fmpz_poly.h fmpz_poly_inv_series_newton"
  fmpz_poly_inv_series_newton :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> CLong -> IO ()

-- | /_fmpz_poly_inv_series/ /Qinv/ /Q/ /n/ 
-- 
-- Computes the first \(n\) terms of the inverse power series of
-- @(Q, lenQ)@.
-- 
-- Assumes that \(n \geq 1\) and that \(Q\) has constant term \(\pm 1\).
-- Does not support aliasing.
foreign import ccall "fmpz_poly.h _fmpz_poly_inv_series"
  _fmpz_poly_inv_series :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_inv_series/ /Qinv/ /Q/ /n/ 
-- 
-- Computes the first \(n\) terms of the inverse power series of \(Q\),
-- assuming \(Q\) has constant term \(\pm 1\) and \(n \geq 1\).
foreign import ccall "fmpz_poly.h fmpz_poly_inv_series"
  fmpz_poly_inv_series :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

foreign import ccall "fmpz_poly.h _fmpz_poly_div_series_basecase"
  _fmpz_poly_div_series_basecase :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CLong -> IO ()

foreign import ccall "fmpz_poly.h _fmpz_poly_div_series_divconquer"
  _fmpz_poly_div_series_divconquer :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /_fmpz_poly_div_series/ /Q/ /A/ /Alen/ /B/ /Blen/ /n/ 
-- 
-- Divides @(A, Alen)@ by @(B, Blen)@ as power series over \(\mathbb{Z}\),
-- assuming \(B\) has constant term \(\pm 1\) and \(n \geq 1\). Aliasing is
-- not supported.
foreign import ccall "fmpz_poly.h _fmpz_poly_div_series"
  _fmpz_poly_div_series :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CLong -> IO ()

foreign import ccall "fmpz_poly.h fmpz_poly_div_series_basecase"
  fmpz_poly_div_series_basecase :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

foreign import ccall "fmpz_poly.h fmpz_poly_div_series_divconquer"
  fmpz_poly_div_series_divconquer :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /fmpz_poly_div_series/ /Q/ /A/ /B/ /n/ 
-- 
-- Performs power series division in \(\mathbb{Z}[[x]] / (x^n)\). The
-- function considers the polynomials \(A\) and \(B\) as power series of
-- length \(n\) starting with the constant terms. The function assumes that
-- \(B\) has constant term \(\pm 1\) and \(n \geq 1\).
foreign import ccall "fmpz_poly.h fmpz_poly_div_series"
  fmpz_poly_div_series :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- Pseudo division -------------------------------------------------------------

-- | /_fmpz_poly_pseudo_divrem_basecase/ /Q/ /R/ /d/ /A/ /lenA/ /B/ /lenB/ /inv/ 
-- 
-- If \(\ell\) is the leading coefficient of \(B\), then computes \(Q\),
-- \(R\) such that \(\ell^d A = Q B + R\). This function is used for
-- simulating division over \(\mathbb{Q}\).
-- 
-- Assumes that \(\operatorname{len}(A) \geq \operatorname{len}(B) > 0\).
-- Assumes that \(Q\) can fit
-- \(\operatorname{len}(A) - \operatorname{len}(B) + 1\) coefficients, and
-- that \(R\) can fit \(\operatorname{len}(A)\) coefficients. Supports
-- aliasing of @(R, lenA)@ and @(A, lenA)@. But other than this, no
-- aliasing of the inputs and outputs is supported.
-- 
-- An optional precomputed inverse of the leading coefficient of \(B\) from
-- @fmpz_preinvn_init@ can be supplied. Otherwise @inv@ should be @NULL@.
foreign import ccall "fmpz_poly.h _fmpz_poly_pseudo_divrem_basecase"
  _fmpz_poly_pseudo_divrem_basecase :: Ptr CFmpz -> Ptr CFmpz -> Ptr CULong -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> Ptr CFmpzPreInvN -> IO ()

-- | /fmpz_poly_pseudo_divrem_basecase/ /Q/ /R/ /d/ /A/ /B/ 
-- 
-- If \(\ell\) is the leading coefficient of \(B\), then computes \(Q\),
-- \(R\) such that \(\ell^d A = Q B + R\). This function is used for
-- simulating division over \(\mathbb{Q}\).
foreign import ccall "fmpz_poly.h fmpz_poly_pseudo_divrem_basecase"
  fmpz_poly_pseudo_divrem_basecase :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CULong -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_pseudo_divrem_divconquer/ /Q/ /R/ /d/ /A/ /lenA/ /B/ /lenB/ /inv/ 
-- 
-- Computes @(Q, lenA - lenB + 1)@, @(R, lenA)@ such that
-- \(\ell^d A = B Q + R\), only setting the bottom
-- \(\operatorname{len}(B) - 1\) coefficients of \(R\) to their correct
-- values. The remaining top coefficients of @(R, lenA)@ may be arbitrary.
-- 
-- Assumes \(\operatorname{len}(A) \geq \operatorname{len}(B) > 0\). Allows
-- zero-padding in @(A, lenA)@. No aliasing of input and output operands is
-- allowed.
-- 
-- An optional precomputed inverse of the leading coefficient of \(B\) from
-- @fmpz_preinvn_init@ can be supplied. Otherwise @inv@ should be @NULL@.
foreign import ccall "fmpz_poly.h _fmpz_poly_pseudo_divrem_divconquer"
  _fmpz_poly_pseudo_divrem_divconquer :: Ptr CFmpz -> Ptr CFmpz -> Ptr CULong -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> Ptr CFmpzPreInvN -> IO ()

-- | /fmpz_poly_pseudo_divrem_divconquer/ /Q/ /R/ /d/ /A/ /B/ 
-- 
-- Computes \(Q\), \(R\), and \(d\) such that \(\ell^d A = B Q + R\), where
-- \(R\) has length less than the length of \(B\) and \(\ell\) is the
-- leading coefficient of \(B\). An exception is raised if \(B\) is zero.
foreign import ccall "fmpz_poly.h fmpz_poly_pseudo_divrem_divconquer"
  fmpz_poly_pseudo_divrem_divconquer :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CULong -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_pseudo_divrem_cohen/ /Q/ /R/ /A/ /lenA/ /B/ /lenB/ 
-- 
-- Assumes that \(\operatorname{len}(A) \geq \operatorname{len}(B) > 0\).
-- Assumes that \(Q\) can fit
-- \(\operatorname{len}(A) - \operatorname{len}(B) + 1\) coefficients, and
-- that \(R\) can fit \(\operatorname{len}(A)\) coefficients. Supports
-- aliasing of @(R, lenA)@ and @(A, lenA)@. But other than this, no
-- aliasing of the inputs and outputs is supported.
foreign import ccall "fmpz_poly.h _fmpz_poly_pseudo_divrem_cohen"
  _fmpz_poly_pseudo_divrem_cohen :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_pseudo_divrem_cohen/ /Q/ /R/ /A/ /B/ 
-- 
-- This is a variant of @fmpz_poly_pseudo_divrem@ which computes
-- polynomials \(Q\) and \(R\) such that \(\ell^d A = B Q + R\). However,
-- the value of \(d\) is fixed at
-- \(\max{\{0, \operatorname{len}(A) - \operatorname{len}(B) + 1\}}\).
-- 
-- This function is faster when the remainder is not well behaved, i.e.
-- where it is not expected to be close to zero. Note that this function is
-- not asymptotically fast. It is efficient only for short polynomials,
-- e.g.when \(\operatorname{len}(B) < 32\).
foreign import ccall "fmpz_poly.h fmpz_poly_pseudo_divrem_cohen"
  fmpz_poly_pseudo_divrem_cohen :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_pseudo_rem_cohen/ /R/ /A/ /lenA/ /B/ /lenB/ 
-- 
-- Assumes that \(\operatorname{len}(A) \geq \operatorname{len}(B) > 0\).
-- Assumes that \(R\) can fit \(\operatorname{len}(A)\) coefficients.
-- Supports aliasing of @(R, lenA)@ and @(A, lenA)@. But other than this,
-- no aliasing of the inputs and outputs is supported.
foreign import ccall "fmpz_poly.h _fmpz_poly_pseudo_rem_cohen"
  _fmpz_poly_pseudo_rem_cohen :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_pseudo_rem_cohen/ /R/ /A/ /B/ 
-- 
-- This is a variant of @fmpz_poly_pseudo_rem@ which computes polynomials
-- \(Q\) and \(R\) such that \(\ell^d A = B Q + R\), but only returns
-- \(R\). However, the value of \(d\) is fixed at
-- \(\max{\{0, \operatorname{len}(A) - \operatorname{len}(B) + 1\}}\).
-- 
-- This function is faster when the remainder is not well behaved, i.e.
-- where it is not expected to be close to zero. Note that this function is
-- not asymptotically fast. It is efficient only for short polynomials,
-- e.g.when \(\operatorname{len}(B) < 32\).
-- 
-- This function uses the algorithm described in [Algorithm
-- 3.1.2]< [Coh1996]>.
foreign import ccall "fmpz_poly.h fmpz_poly_pseudo_rem_cohen"
  fmpz_poly_pseudo_rem_cohen :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- -- | /_fmpz_poly_pseudo_divrem/ /Q/ /R/ /d/ /A/ /lenA/ /B/ /lenB/ /inv/ 
-- -- 
-- -- If \(\ell\) is the leading coefficient of \(B\), then computes
-- -- @(Q, lenA - lenB + 1)@, @(R, lenB - 1)@ and \(d\) such that
-- -- \(\ell^d A = B Q + R\). This function is used for simulating division
-- -- over \(\mathbb{Q}\).
-- -- 
-- -- Assumes that \(\operatorname{len}(A) \geq \operatorname{len}(B) > 0\).
-- -- Assumes that \(Q\) can fit
-- -- \(\operatorname{len}(A) - \operatorname{len}(B) + 1\) coefficients, and
-- -- that \(R\) can fit \(\operatorname{len}(A)\) coefficients, although on
-- -- exit only the bottom \(\operatorname{len}(B)\) coefficients will carry
-- -- meaningful data.
-- -- 
-- -- Supports aliasing of @(R, lenA)@ and @(A, lenA)@. But other than this,
-- -- no aliasing of the inputs and outputs is supported.
-- -- 
-- -- An optional precomputed inverse of the leading coefficient of \(B\) from
-- -- @fmpz_preinvn_init@ can be supplied. Otherwise @inv@ should be @NULL@.
-- foreign import ccall "fmpz_poly.h _fmpz_poly_pseudo_divrem"
--   _fmpz_poly_pseudo_divrem :: Ptr CFmpz -> Ptr CFmpz -> Ptr CULong -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> Ptr CFmpzPreInvN -> IO ()

-- -- | /fmpz_poly_pseudo_divrem/ /Q/ /R/ /d/ /A/ /B/ 
-- -- 
-- -- Computes \(Q\), \(R\), and \(d\) such that \(\ell^d A = B Q + R\).
-- foreign import ccall "fmpz_poly.h fmpz_poly_pseudo_divrem"
--   fmpz_poly_pseudo_divrem :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CULong -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_pseudo_div/ /Q/ /d/ /A/ /lenA/ /B/ /lenB/ /inv/ 
-- 
-- Pseudo-division, only returning the quotient.
foreign import ccall "fmpz_poly.h _fmpz_poly_pseudo_div"
  _fmpz_poly_pseudo_div :: Ptr CFmpz -> Ptr CULong -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> Ptr CFmpzPreInvN -> IO ()

-- | /fmpz_poly_pseudo_div/ /Q/ /d/ /A/ /B/ 
-- 
-- Pseudo-division, only returning the quotient.
foreign import ccall "fmpz_poly.h fmpz_poly_pseudo_div"
  fmpz_poly_pseudo_div :: Ptr CFmpzPoly -> Ptr CULong -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_pseudo_rem/ /R/ /d/ /A/ /lenA/ /B/ /lenB/ /inv/ 
-- 
-- Pseudo-division, only returning the remainder.
foreign import ccall "fmpz_poly.h _fmpz_poly_pseudo_rem"
  _fmpz_poly_pseudo_rem :: Ptr CFmpz -> Ptr CULong -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> Ptr CFmpzPreInvN -> IO ()

-- | /fmpz_poly_pseudo_rem/ /R/ /d/ /A/ /B/ 
-- 
-- Pseudo-division, only returning the remainder.
foreign import ccall "fmpz_poly.h fmpz_poly_pseudo_rem"
  fmpz_poly_pseudo_rem :: Ptr CFmpzPoly -> Ptr CULong -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- Derivative ------------------------------------------------------------------

-- | /_fmpz_poly_derivative/ /rpoly/ /poly/ /len/ 
-- 
-- Sets @(rpoly, len - 1)@ to the derivative of @(poly, len)@. Also handles
-- the cases where @len@ is \(0\) or \(1\) correctly. Supports aliasing of
-- @rpoly@ and @poly@.
foreign import ccall "fmpz_poly.h _fmpz_poly_derivative"
  _fmpz_poly_derivative :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_derivative/ /res/ /poly/ 
-- 
-- Sets @res@ to the derivative of @poly@.
foreign import ccall "fmpz_poly.h fmpz_poly_derivative"
  fmpz_poly_derivative :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_nth_derivative/ /rpoly/ /poly/ /n/ /len/ 
-- 
-- Sets @(rpoly, len - n)@ to the nth derivative of @(poly, len)@. Also
-- handles the cases where @len \<= n@ correctly. Supports aliasing of
-- @rpoly@ and @poly@.
foreign import ccall "fmpz_poly.h _fmpz_poly_nth_derivative"
  _fmpz_poly_nth_derivative :: Ptr CFmpz -> Ptr CFmpz -> CULong -> CLong -> IO ()

-- | /fmpz_poly_nth_derivative/ /res/ /poly/ /n/ 
-- 
-- Sets @res@ to the nth derivative of @poly@.
foreign import ccall "fmpz_poly.h fmpz_poly_nth_derivative"
  fmpz_poly_nth_derivative :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- Evaluation ------------------------------------------------------------------

-- | /_fmpz_poly_evaluate_divconquer_fmpz/ /res/ /poly/ /len/ /a/ 
-- 
-- Evaluates the polynomial @(poly, len)@ at the integer \(a\) using a
-- divide and conquer approach. Assumes that the length of the polynomial
-- is at least one. Allows zero padding. Does not allow aliasing between
-- @res@ and @x@.
foreign import ccall "fmpz_poly.h _fmpz_poly_evaluate_divconquer_fmpz"
  _fmpz_poly_evaluate_divconquer_fmpz :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> IO ()

-- | /fmpz_poly_evaluate_divconquer_fmpz/ /res/ /poly/ /a/ 
-- 
-- Evaluates the polynomial @poly@ at the integer \(a\) using a divide and
-- conquer approach.
-- 
-- Aliasing between @res@ and @a@ is supported, however, @res@ may not be
-- part of @poly@.
foreign import ccall "fmpz_poly.h fmpz_poly_evaluate_divconquer_fmpz"
  fmpz_poly_evaluate_divconquer_fmpz :: Ptr CFmpz -> Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- | /_fmpz_poly_evaluate_horner_fmpz/ /res/ /f/ /len/ /a/ 
-- 
-- Evaluates the polynomial @(f, len)@ at the integer \(a\) using Horner\'s
-- rule, and sets @res@ to the result. Aliasing between @res@ and \(a\) or
-- any of the coefficients of \(f\) is not supported.
foreign import ccall "fmpz_poly.h _fmpz_poly_evaluate_horner_fmpz"
  _fmpz_poly_evaluate_horner_fmpz :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> IO ()

-- | /fmpz_poly_evaluate_horner_fmpz/ /res/ /f/ /a/ 
-- 
-- Evaluates the polynomial \(f\) at the integer \(a\) using Horner\'s
-- rule, and sets @res@ to the result.
-- 
-- As expected, aliasing between @res@ and @a@ is supported. However, @res@
-- may not be aliased with a coefficient of \(f\).
foreign import ccall "fmpz_poly.h fmpz_poly_evaluate_horner_fmpz"
  fmpz_poly_evaluate_horner_fmpz :: Ptr CFmpz -> Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- | /_fmpz_poly_evaluate_fmpz/ /res/ /f/ /len/ /a/ 
-- 
-- Evaluates the polynomial @(f, len)@ at the integer \(a\) and sets @res@
-- to the result. Aliasing between @res@ and \(a\) or any of the
-- coefficients of \(f\) is not supported.
foreign import ccall "fmpz_poly.h _fmpz_poly_evaluate_fmpz"
  _fmpz_poly_evaluate_fmpz :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> IO ()

-- | /fmpz_poly_evaluate_fmpz/ /res/ /f/ /a/ 
-- 
-- Evaluates the polynomial \(f\) at the integer \(a\) and sets @res@ to
-- the result.
-- 
-- As expected, aliasing between @res@ and \(a\) is supported. However,
-- @res@ may not be aliased with a coefficient of \(f\).
foreign import ccall "fmpz_poly.h fmpz_poly_evaluate_fmpz"
  fmpz_poly_evaluate_fmpz :: Ptr CFmpz -> Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- | /_fmpz_poly_evaluate_divconquer_fmpq/ /rnum/ /rden/ /f/ /len/ /anum/ /aden/ 
-- 
-- Evaluates the polynomial @(f, len)@ at the rational @(anum, aden)@ using
-- a divide and conquer approach, and sets @(rnum, rden)@ to the result in
-- lowest terms. Assumes that the length of the polynomial is at least one.
-- 
-- Aliasing between @(rnum, rden)@ and @(anum, aden)@ or any of the
-- coefficients of \(f\) is not supported.
foreign import ccall "fmpz_poly.h _fmpz_poly_evaluate_divconquer_fmpq"
  _fmpz_poly_evaluate_divconquer_fmpq :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> Ptr CFmpz -> IO ()

-- | /fmpz_poly_evaluate_divconquer_fmpq/ /res/ /f/ /a/ 
-- 
-- Evaluates the polynomial \(f\) at the rational \(a\) using a divide and
-- conquer approach, and sets @res@ to the result.
foreign import ccall "fmpz_poly.h fmpz_poly_evaluate_divconquer_fmpq"
  fmpz_poly_evaluate_divconquer_fmpq :: Ptr CFmpq -> Ptr CFmpzPoly -> Ptr CFmpq -> IO ()

-- | /_fmpz_poly_evaluate_horner_fmpq/ /rnum/ /rden/ /f/ /len/ /anum/ /aden/ 
-- 
-- Evaluates the polynomial @(f, len)@ at the rational @(anum, aden)@ using
-- Horner\'s rule, and sets @(rnum, rden)@ to the result in lowest terms.
-- 
-- Aliasing between @(rnum, rden)@ and @(anum, aden)@ or any of the
-- coefficients of \(f\) is not supported.
foreign import ccall "fmpz_poly.h _fmpz_poly_evaluate_horner_fmpq"
  _fmpz_poly_evaluate_horner_fmpq :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> Ptr CFmpz -> IO ()

-- | /fmpz_poly_evaluate_horner_fmpq/ /res/ /f/ /a/ 
-- 
-- Evaluates the polynomial \(f\) at the rational \(a\) using Horner\'s
-- rule, and sets @res@ to the result.
foreign import ccall "fmpz_poly.h fmpz_poly_evaluate_horner_fmpq"
  fmpz_poly_evaluate_horner_fmpq :: Ptr CFmpq -> Ptr CFmpzPoly -> Ptr CFmpq -> IO ()

-- | /_fmpz_poly_evaluate_fmpq/ /rnum/ /rden/ /f/ /len/ /anum/ /aden/ 
-- 
-- Evaluates the polynomial @(f, len)@ at the rational @(anum, aden)@ and
-- sets @(rnum, rden)@ to the result in lowest terms.
-- 
-- Aliasing between @(rnum, rden)@ and @(anum, aden)@ or any of the
-- coefficients of \(f\) is not supported.
foreign import ccall "fmpz_poly.h _fmpz_poly_evaluate_fmpq"
  _fmpz_poly_evaluate_fmpq :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> Ptr CFmpz -> IO ()

-- | /fmpz_poly_evaluate_fmpq/ /res/ /f/ /a/ 
-- 
-- Evaluates the polynomial \(f\) at the rational \(a\), and sets @res@ to
-- the result.
foreign import ccall "fmpz_poly.h fmpz_poly_evaluate_fmpq"
  fmpz_poly_evaluate_fmpq :: Ptr CFmpq -> Ptr CFmpzPoly -> Ptr CFmpq -> IO ()

-- -- | /fmpz_poly_evaluate_mpq/ /res/ /f/ /a/ 
-- -- 
-- -- Evaluates the polynomial \(f\) at the rational \(a\) and sets @res@ to
-- -- the result.
-- foreign import ccall "fmpz_poly.h fmpz_poly_evaluate_mpq"
--   fmpz_poly_evaluate_mpq :: Ptr CMpq -> Ptr CFmpzPoly -> Ptr CMpq -> IO ()

-- | /_fmpz_poly_evaluate_mod/ /poly/ /len/ /a/ /n/ /ninv/ 
-- 
-- Evaluates @(poly, len)@ at the value \(a\) modulo \(n\) and returns the
-- result. The last argument @ninv@ must be set to the precomputed inverse
-- of \(n\), which can be obtained using the function @n_preinvert_limb@.
foreign import ccall "fmpz_poly.h _fmpz_poly_evaluate_mod"
  _fmpz_poly_evaluate_mod :: Ptr CFmpz -> CLong -> CMpLimb -> CMpLimb -> CMpLimb -> IO CMpLimb

-- | /fmpz_poly_evaluate_mod/ /poly/ /a/ /n/ 
-- 
-- Evaluates @poly@ at the value \(a\) modulo \(n\) and returns the result.
foreign import ccall "fmpz_poly.h fmpz_poly_evaluate_mod"
  fmpz_poly_evaluate_mod :: Ptr CFmpzPoly -> CMpLimb -> CMpLimb -> IO CMpLimb

-- | /fmpz_poly_evaluate_fmpz_vec/ /res/ /f/ /a/ /n/ 
-- 
-- Evaluates @f@ at the \(n\) values given in the vector @f@, writing the
-- results to @res@.
foreign import ccall "fmpz_poly.h fmpz_poly_evaluate_fmpz_vec"
  fmpz_poly_evaluate_fmpz_vec :: Ptr CFmpz -> Ptr CFmpzPoly -> Ptr CFmpz -> CLong -> IO ()

-- | /_fmpz_poly_evaluate_horner_d/ /poly/ /n/ /d/ 
-- 
-- Evaluate @(poly, n)@ at the double \(d\). No attempt is made to do this
-- efficiently or in a numerically stable way. It is currently only used in
-- Flint for quick and dirty evaluations of polynomials with all
-- coefficients positive.
foreign import ccall "fmpz_poly.h _fmpz_poly_evaluate_horner_d"
  _fmpz_poly_evaluate_horner_d :: Ptr CFmpz -> CLong -> CDouble -> IO CDouble

-- | /fmpz_poly_evaluate_horner_d/ /poly/ /d/ 
-- 
-- Evaluate @poly@ at the double \(d\). No attempt is made to do this
-- efficiently or in a numerically stable way. It is currently only used in
-- Flint for quick and dirty evaluations of polynomials with all
-- coefficients positive.
foreign import ccall "fmpz_poly.h fmpz_poly_evaluate_horner_d"
  fmpz_poly_evaluate_horner_d :: Ptr CFmpzPoly -> CDouble -> IO CDouble

-- | /_fmpz_poly_evaluate_horner_d_2exp/ /exp/ /poly/ /n/ /d/ 
-- 
-- Evaluate @(poly, n)@ at the double \(d\). Return the result as a double
-- and an exponent @exp@ combination. No attempt is made to do this
-- efficiently or in a numerically stable way. It is currently only used in
-- Flint for quick and dirty evaluations of polynomials with all
-- coefficients positive.
foreign import ccall "fmpz_poly.h _fmpz_poly_evaluate_horner_d_2exp"
  _fmpz_poly_evaluate_horner_d_2exp :: Ptr CLong -> Ptr CFmpz -> CLong -> CDouble -> IO CDouble

-- | /fmpz_poly_evaluate_horner_d_2exp/ /exp/ /poly/ /d/ 
-- 
-- Evaluate @poly@ at the double \(d\). Return the result as a double and
-- an exponent @exp@ combination. No attempt is made to do this efficiently
-- or in a numerically stable way. It is currently only used in Flint for
-- quick and dirty evaluations of polynomials with all coefficients
-- positive.
foreign import ccall "fmpz_poly.h fmpz_poly_evaluate_horner_d_2exp"
  fmpz_poly_evaluate_horner_d_2exp :: Ptr CLong -> Ptr CFmpzPoly -> CDouble -> IO CDouble

-- | /_fmpz_poly_evaluate_horner_d_2exp2/ /exp/ /poly/ /n/ /d/ /dexp/ 
-- 
-- Evaluate @poly@ at @d*2^dexp@. Return the result as a double and an
-- exponent @exp@ combination. No attempt is made to do this efficiently or
-- in a numerically stable way. It is currently only used in Flint for
-- quick and dirty evaluations of polynomials with all coefficients
-- positive.
foreign import ccall "fmpz_poly.h _fmpz_poly_evaluate_horner_d_2exp2"
  _fmpz_poly_evaluate_horner_d_2exp2 :: Ptr CLong -> Ptr CFmpz -> CLong -> CDouble -> CLong -> IO CDouble

-- Newton basis ----------------------------------------------------------------

-- | /_fmpz_poly_monomial_to_newton/ /poly/ /roots/ /n/ 
-- 
-- Converts @(poly, n)@ in-place from its coefficients given in the
-- standard monomial basis to the Newton basis for the roots
-- \(r_0, r_1, \ldots, r_{n-2}\). In other words, this determines output
-- coefficients \(c_i\) such that
-- \(c_0 + c_1(x-r_0) + c_2(x-r_0)(x-r_1) + \ldots + c_{n-1}(x-r_0)(x-r_1)\cdots(x-r_{n-2})\)
-- is equal to the input polynomial. Uses repeated polynomial division.
foreign import ccall "fmpz_poly.h _fmpz_poly_monomial_to_newton"
  _fmpz_poly_monomial_to_newton :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /_fmpz_poly_newton_to_monomial/ /poly/ /roots/ /n/ 
-- 
-- Converts @(poly, n)@ in-place from its coefficients given in the Newton
-- basis for the roots \(r_0, r_1, \ldots, r_{n-2}\) to the standard
-- monomial basis. In other words, this evaluates
-- \(c_0 + c_1(x-r_0) + c_2(x-r_0)(x-r_1) + \ldots + c_{n-1}(x-r_0)(x-r_1)\cdots(x-r_{n-2})\)
-- where \(c_i\) are the input coefficients for @poly@. Uses Horner\'s
-- rule.
foreign import ccall "fmpz_poly.h _fmpz_poly_newton_to_monomial"
  _fmpz_poly_newton_to_monomial :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- Interpolation ---------------------------------------------------------------

-- | /fmpz_poly_interpolate_fmpz_vec/ /poly/ /xs/ /ys/ /n/ 
-- 
-- Sets @poly@ to the unique interpolating polynomial of degree at most
-- \(n - 1\) satisfying \(f(x_i) = y_i\) for every pair \(x_i, y_u\) in
-- @xs@ and @ys@, assuming that this polynomial has integer coefficients.
-- 
-- If an interpolating polynomial with integer coefficients does not exist,
-- a @FLINT_INEXACT@ exception is thrown.
-- 
-- It is assumed that the \(x\) values are distinct.
foreign import ccall "fmpz_poly.h fmpz_poly_interpolate_fmpz_vec"
  fmpz_poly_interpolate_fmpz_vec :: Ptr CFmpzPoly -> Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- Composition -----------------------------------------------------------------

-- | /_fmpz_poly_compose_horner/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Sets @res@ to the composition of @(poly1, len1)@ and @(poly2, len2)@.
-- 
-- Assumes that @res@ has space for @(len1-1)*(len2-1) + 1@ coefficients.
-- Assumes that @poly1@ and @poly2@ are non-zero polynomials. Does not
-- support aliasing between any of the inputs and the output.
foreign import ccall "fmpz_poly.h _fmpz_poly_compose_horner"
  _fmpz_poly_compose_horner :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_compose_horner/ /res/ /poly1/ /poly2/ 
-- 
-- Sets @res@ to the composition of @poly1@ and @poly2@. To be more
-- precise, denoting @res@, @poly1@, and @poly2@ by \(f\), \(g\), and
-- \(h\), sets \(f(t) = g(h(t))\).
-- 
-- This implementation uses Horner\'s method.
foreign import ccall "fmpz_poly.h fmpz_poly_compose_horner"
  fmpz_poly_compose_horner :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_compose_divconquer/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Computes the composition of @(poly1, len1)@ and @(poly2, len2)@ using a
-- divide and conquer approach and places the result into @res@, assuming
-- @res@ can hold the output of length @(len1 - 1) * (len2 - 1) + 1@.
-- 
-- Assumes @len1, len2 > 0@. Does not support aliasing between @res@ and
-- any of @(poly1, len1)@ and @(poly2, len2)@.
foreign import ccall "fmpz_poly.h _fmpz_poly_compose_divconquer"
  _fmpz_poly_compose_divconquer :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_compose_divconquer/ /res/ /poly1/ /poly2/ 
-- 
-- Sets @res@ to the composition of @poly1@ and @poly2@. To be precise
-- about the order of composition, denoting @res@, @poly1@, and @poly2@ by
-- \(f\), \(g\), and \(h\), respectively, sets \(f(t) = g(h(t))\).
foreign import ccall "fmpz_poly.h fmpz_poly_compose_divconquer"
  fmpz_poly_compose_divconquer :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- | /_fmpz_poly_compose/ /res/ /poly1/ /len1/ /poly2/ /len2/ 
-- 
-- Sets @res@ to the composition of @(poly1, len1)@ and @(poly2, len2)@.
-- 
-- Assumes that @res@ has space for @(len1-1)*(len2-1) + 1@ coefficients.
-- Assumes that @poly1@ and @poly2@ are non-zero polynomials. Does not
-- support aliasing between any of the inputs and the output.
foreign import ccall "fmpz_poly.h _fmpz_poly_compose"
  _fmpz_poly_compose :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_compose/ /res/ /poly1/ /poly2/ 
-- 
-- Sets @res@ to the composition of @poly1@ and @poly2@. To be precise
-- about the order of composition, denoting @res@, @poly1@, and @poly2@ by
-- \(f\), \(g\), and \(h\), respectively, sets \(f(t) = g(h(t))\).
foreign import ccall "fmpz_poly.h fmpz_poly_compose"
  fmpz_poly_compose :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- Inflation and deflation -----------------------------------------------------

-- | /fmpz_poly_inflate/ /result/ /input/ /inflation/ 
-- 
-- Sets @result@ to the inflated polynomial \(p(x^n)\) where \(p\) is given
-- by @input@ and \(n\) is given by @inflation@.
foreign import ccall "fmpz_poly.h fmpz_poly_inflate"
  fmpz_poly_inflate :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- | /fmpz_poly_deflate/ /result/ /input/ /deflation/ 
-- 
-- Sets @result@ to the deflated polynomial \(p(x^{1/n})\) where \(p\) is
-- given by @input@ and \(n\) is given by @deflation@. Requires \(n > 0\).
foreign import ccall "fmpz_poly.h fmpz_poly_deflate"
  fmpz_poly_deflate :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CULong -> IO ()

-- | /fmpz_poly_deflation/ /input/ 
-- 
-- Returns the largest integer by which @input@ can be deflated. As special
-- cases, returns 0 if @input@ is the zero polynomial and 1 of @input@ is a
-- constant polynomial.
foreign import ccall "fmpz_poly.h fmpz_poly_deflation"
  fmpz_poly_deflation :: Ptr CFmpzPoly -> IO CULong

-- Taylor shift ----------------------------------------------------------------

-- | /_fmpz_poly_taylor_shift_horner/ /poly/ /c/ /n/ 
-- 
-- Performs the Taylor shift composing @poly@ by \(x+c\) in-place. Uses an
-- efficient version Horner\'s rule.
foreign import ccall "fmpz_poly.h _fmpz_poly_taylor_shift_horner"
  _fmpz_poly_taylor_shift_horner :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_taylor_shift_horner/ /g/ /f/ /c/ 
-- 
-- Performs the Taylor shift composing @f@ by \(x+c\).
foreign import ccall "fmpz_poly.h fmpz_poly_taylor_shift_horner"
  fmpz_poly_taylor_shift_horner :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- | /_fmpz_poly_taylor_shift_divconquer/ /poly/ /c/ /n/ 
-- 
-- Performs the Taylor shift composing @poly@ by \(x+c\) in-place. Uses the
-- divide-and-conquer polynomial composition algorithm.
foreign import ccall "fmpz_poly.h _fmpz_poly_taylor_shift_divconquer"
  _fmpz_poly_taylor_shift_divconquer :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_taylor_shift_divconquer/ /g/ /f/ /c/ 
-- 
-- Performs the Taylor shift composing @f@ by \(x+c\). Uses the
-- divide-and-conquer polynomial composition algorithm.
foreign import ccall "fmpz_poly.h fmpz_poly_taylor_shift_divconquer"
  fmpz_poly_taylor_shift_divconquer :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- | /_fmpz_poly_taylor_shift_multi_mod/ /poly/ /c/ /n/ 
-- 
-- Performs the Taylor shift composing @poly@ by \(x+c\) in-place. Uses a
-- multimodular algorithm, distributing the computation across
-- @flint_get_num_threads@ threads.
foreign import ccall "fmpz_poly.h _fmpz_poly_taylor_shift_multi_mod"
  _fmpz_poly_taylor_shift_multi_mod :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_taylor_shift_multi_mod/ /g/ /f/ /c/ 
-- 
-- Performs the Taylor shift composing @f@ by \(x+c\). Uses a multimodular
-- algorithm, distributing the computation across @flint_get_num_threads@
-- threads.
foreign import ccall "fmpz_poly.h fmpz_poly_taylor_shift_multi_mod"
  fmpz_poly_taylor_shift_multi_mod :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- | /_fmpz_poly_taylor_shift/ /poly/ /c/ /n/ 
-- 
-- Performs the Taylor shift composing @poly@ by \(x+c\) in-place.
foreign import ccall "fmpz_poly.h _fmpz_poly_taylor_shift"
  _fmpz_poly_taylor_shift :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_taylor_shift/ /g/ /f/ /c/ 
-- 
-- Performs the Taylor shift composing @f@ by \(x+c\).
foreign import ccall "fmpz_poly.h fmpz_poly_taylor_shift"
  fmpz_poly_taylor_shift :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> IO ()

-- Power series composition ----------------------------------------------------

-- | /_fmpz_poly_compose_series_horner/ /res/ /poly1/ /len1/ /poly2/ /len2/ /n/ 
-- 
-- Sets @res@ to the composition of @poly1@ and @poly2@ modulo \(x^n\),
-- where the constant term of @poly2@ is required to be zero.
-- 
-- Assumes that @len1, len2, n > 0@, that @len1, len2 \<= n@, and that
-- @(len1-1) * (len2-1) + 1 \<= n@, and that @res@ has space for @n@
-- coefficients. Does not support aliasing between any of the inputs and
-- the output.
-- 
-- This implementation uses the Horner scheme.
foreign import ccall "fmpz_poly.h _fmpz_poly_compose_series_horner"
  _fmpz_poly_compose_series_horner :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_compose_series_horner/ /res/ /poly1/ /poly2/ /n/ 
-- 
-- Sets @res@ to the composition of @poly1@ and @poly2@ modulo \(x^n\),
-- where the constant term of @poly2@ is required to be zero.
-- 
-- This implementation uses the Horner scheme.
foreign import ccall "fmpz_poly.h fmpz_poly_compose_series_horner"
  fmpz_poly_compose_series_horner :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_compose_series_brent_kung/ /res/ /poly1/ /len1/ /poly2/ /len2/ /n/ 
-- 
-- Sets @res@ to the composition of @poly1@ and @poly2@ modulo \(x^n\),
-- where the constant term of @poly2@ is required to be zero.
-- 
-- Assumes that @len1, len2, n > 0@, that @len1, len2 \<= n@, and that
-- @(len1-1) * (len2-1) + 1 \<= n@, and that @res@ has space for @n@
-- coefficients. Does not support aliasing between any of the inputs and
-- the output.
-- 
-- This implementation uses Brent-Kung algorithm 2.1 < [BrentKung1978]>.
foreign import ccall "fmpz_poly.h _fmpz_poly_compose_series_brent_kung"
  _fmpz_poly_compose_series_brent_kung :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_compose_series_brent_kung/ /res/ /poly1/ /poly2/ /n/ 
-- 
-- Sets @res@ to the composition of @poly1@ and @poly2@ modulo \(x^n\),
-- where the constant term of @poly2@ is required to be zero.
-- 
-- This implementation uses Brent-Kung algorithm 2.1 < [BrentKung1978]>.
foreign import ccall "fmpz_poly.h fmpz_poly_compose_series_brent_kung"
  fmpz_poly_compose_series_brent_kung :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_compose_series/ /res/ /poly1/ /len1/ /poly2/ /len2/ /n/ 
-- 
-- Sets @res@ to the composition of @poly1@ and @poly2@ modulo \(x^n\),
-- where the constant term of @poly2@ is required to be zero.
-- 
-- Assumes that @len1, len2, n > 0@, that @len1, len2 \<= n@, and that
-- @(len1-1) * (len2-1) + 1 \<= n@, and that @res@ has space for @n@
-- coefficients. Does not support aliasing between any of the inputs and
-- the output.
-- 
-- This implementation automatically switches between the Horner scheme and
-- Brent-Kung algorithm 2.1 depending on the size of the inputs.
foreign import ccall "fmpz_poly.h _fmpz_poly_compose_series"
  _fmpz_poly_compose_series :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_compose_series/ /res/ /poly1/ /poly2/ /n/ 
-- 
-- Sets @res@ to the composition of @poly1@ and @poly2@ modulo \(x^n\),
-- where the constant term of @poly2@ is required to be zero.
-- 
-- This implementation automatically switches between the Horner scheme and
-- Brent-Kung algorithm 2.1 depending on the size of the inputs.
foreign import ccall "fmpz_poly.h fmpz_poly_compose_series"
  fmpz_poly_compose_series :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- Power series reversion ------------------------------------------------------

-- | /_fmpz_poly_revert_series_lagrange/ /Qinv/ /Q/ /Qlen/ /n/ 
-- 
-- Sets @Qinv@ to the compositional inverse or reversion of @(Q, Qlen)@ as
-- a power series, i.e. computes \(Q^{-1}\) such that
-- \(Q(Q^{-1}(x)) = Q^{-1}(Q(x)) = x \bmod x^n\). The arguments may not be
-- aliased, and @Qlen@ must be at least 2. It is required that \(Q_0 = 0\)
-- and \(Q_1 = \pm 1\).
-- 
-- This implementation uses the Lagrange inversion formula.
foreign import ccall "fmpz_poly.h _fmpz_poly_revert_series_lagrange"
  _fmpz_poly_revert_series_lagrange :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_revert_series_lagrange/ /Qinv/ /Q/ /n/ 
-- 
-- Sets @Qinv@ to the compositional inverse or reversion of @Q@ as a power
-- series, i.e. computes \(Q^{-1}\) such that
-- \(Q(Q^{-1}(x)) = Q^{-1}(Q(x)) = x \bmod x^n\). It is required that
-- \(Q_0 = 0\) and \(Q_1 = \pm 1\).
-- 
-- This implementation uses the Lagrange inversion formula.
foreign import ccall "fmpz_poly.h fmpz_poly_revert_series_lagrange"
  fmpz_poly_revert_series_lagrange :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_revert_series_lagrange_fast/ /Qinv/ /Q/ /Qlen/ /n/ 
-- 
-- Sets @Qinv@ to the compositional inverse or reversion of @(Q, Qlen)@ as
-- a power series, i.e. computes \(Q^{-1}\) such that
-- \(Q(Q^{-1}(x)) = Q^{-1}(Q(x)) = x \bmod x^n\). The arguments may not be
-- aliased, and @Qlen@ must be at least 2. It is required that \(Q_0 = 0\)
-- and \(Q_1 = \pm 1\).
-- 
-- This implementation uses a reduced-complexity implementation of the
-- Lagrange inversion formula.
foreign import ccall "fmpz_poly.h _fmpz_poly_revert_series_lagrange_fast"
  _fmpz_poly_revert_series_lagrange_fast :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_revert_series_lagrange_fast/ /Qinv/ /Q/ /n/ 
-- 
-- Sets @Qinv@ to the compositional inverse or reversion of @Q@ as a power
-- series, i.e. computes \(Q^{-1}\) such that
-- \(Q(Q^{-1}(x)) = Q^{-1}(Q(x)) = x \bmod x^n\). It is required that
-- \(Q_0 = 0\) and \(Q_1 = \pm 1\).
-- 
-- This implementation uses a reduced-complexity implementation of the
-- Lagrange inversion formula.
foreign import ccall "fmpz_poly.h fmpz_poly_revert_series_lagrange_fast"
  fmpz_poly_revert_series_lagrange_fast :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_revert_series_newton/ /Qinv/ /Q/ /Qlen/ /n/ 
-- 
-- Sets @Qinv@ to the compositional inverse or reversion of @Q@ as a power
-- series, i.e. computes \(Q^{-1}\) such that
-- \(Q(Q^{-1}(x)) = Q^{-1}(Q(x)) = x \bmod x^n\). The arguments may not be
-- aliased, and @Qlen@ must be at least 2. It is required that \(Q_0 = 0\)
-- and \(Q_1 = \pm 1\).
-- 
-- This implementation uses Newton iteration < [BrentKung1978]>.
foreign import ccall "fmpz_poly.h _fmpz_poly_revert_series_newton"
  _fmpz_poly_revert_series_newton :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_revert_series_newton/ /Qinv/ /Q/ /n/ 
-- 
-- Sets @Qinv@ to the compositional inverse or reversion of @Q@ as a power
-- series, i.e. computes \(Q^{-1}\) such that
-- \(Q(Q^{-1}(x)) = Q^{-1}(Q(x)) = x \bmod x^n\). It is required that
-- \(Q_0 = 0\) and \(Q_1 = \pm 1\).
-- 
-- This implementation uses Newton iteration < [BrentKung1978]>.
foreign import ccall "fmpz_poly.h fmpz_poly_revert_series_newton"
  fmpz_poly_revert_series_newton :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_revert_series/ /Qinv/ /Q/ /Qlen/ /n/ 
-- 
-- Sets @Qinv@ to the compositional inverse or reversion of @Q@ as a power
-- series, i.e. computes \(Q^{-1}\) such that
-- \(Q(Q^{-1}(x)) = Q^{-1}(Q(x)) = x \bmod x^n\). The arguments may not be
-- aliased, and @Qlen@ must be at least 2. It is required that \(Q_0 = 0\)
-- and \(Q_1 = \pm 1\).
-- 
-- This implementation defaults to the fast version of Lagrange
-- interpolation.
foreign import ccall "fmpz_poly.h _fmpz_poly_revert_series"
  _fmpz_poly_revert_series :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_revert_series/ /Qinv/ /Q/ /n/ 
-- 
-- Sets @Qinv@ to the compositional inverse or reversion of @Q@ as a power
-- series, i.e. computes \(Q^{-1}\) such that
-- \(Q(Q^{-1}(x)) = Q^{-1}(Q(x)) = x \bmod x^n\). It is required that
-- \(Q_0 = 0\) and \(Q_1 = \pm 1\).
-- 
-- This implementation defaults to the fast version of Lagrange
-- interpolation.
foreign import ccall "fmpz_poly.h fmpz_poly_revert_series"
  fmpz_poly_revert_series :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- Square root -----------------------------------------------------------------

-- | /_fmpz_poly_sqrtrem_classical/ /res/ /r/ /poly/ /len/ 
-- 
-- Returns 1 if @(poly, len)@ can be written in the form \(A^2 + R\) where
-- deg\`(R) \< deg(@\`poly@), otherwise returns \(0\). If it can be so
-- written, @(res, m - 1)@ is set to \(A\) and @(res, m)@ is set to \(R\),
-- where \(m =\) deg\`(@\`poly@)\/2 + 1.
-- 
-- For efficiency reasons, @r@ must have room for @len@ coefficients, and
-- may alias @poly@.
foreign import ccall "fmpz_poly.h _fmpz_poly_sqrtrem_classical"
  _fmpz_poly_sqrtrem_classical :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> IO CInt

-- | /fmpz_poly_sqrtrem_classical/ /b/ /r/ /a/ 
-- 
-- If \(a\) can be written as \(b^2 + r\) with deg\`(r) \< deg(a)\/2\`,
-- return \(1\) and set \(b\) and \(r\) appropriately. Otherwise return
-- \(0\).
foreign import ccall "fmpz_poly.h fmpz_poly_sqrtrem_classical"
  fmpz_poly_sqrtrem_classical :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO CInt

-- | /_fmpz_poly_sqrtrem_divconquer/ /res/ /r/ /poly/ /len/ /temp/ 
-- 
-- Returns 1 if @(poly, len)@ can be written in the form \(A^2 + R\) where
-- deg\`(R) \< deg(@\`poly@), otherwise returns \(0\). If it can be so
-- written, @(res, m - 1)@ is set to \(A\) and @(res, m)@ is set to \(R\),
-- where \(m =\) deg\`(@\`poly@)\/2 + 1.
-- 
-- For efficiency reasons, @r@ must have room for @len@ coefficients, and
-- may alias @poly@. Temporary space of @len@ coefficients is required.
foreign import ccall "fmpz_poly.h _fmpz_poly_sqrtrem_divconquer"
  _fmpz_poly_sqrtrem_divconquer :: Ptr CFmpz -> Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> IO CInt

-- | /fmpz_poly_sqrtrem_divconquer/ /b/ /r/ /a/ 
-- 
-- If \(a\) can be written as \(b^2 + r\) with deg\`(r) \< deg(a)\/2\`,
-- return \(1\) and set \(b\) and \(r\) appropriately. Otherwise return
-- \(0\).
foreign import ccall "fmpz_poly.h fmpz_poly_sqrtrem_divconquer"
  fmpz_poly_sqrtrem_divconquer :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO CInt

-- | /_fmpz_poly_sqrt_classical/ /res/ /poly/ /len/ /exact/ 
-- 
-- If @exact@ is \(1\) and @(poly, len)@ is a perfect square, sets
-- @(res, len \/ 2 + 1)@ to the square root of @poly@ with positive leading
-- coefficient and returns 1. Otherwise returns 0.
-- 
-- If @exact@ is \(0\), allows a remainder after the square root, which is
-- not computed.
-- 
-- This function first uses various tests to detect nonsquares quickly.
-- Then, it computes the square root iteratively from top to bottom,
-- requiring \(O(n^2)\) coefficient operations.
foreign import ccall "fmpz_poly.h _fmpz_poly_sqrt_classical"
  _fmpz_poly_sqrt_classical :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CInt -> IO CInt

-- | /fmpz_poly_sqrt_classical/ /b/ /a/ 
-- 
-- If @a@ is a perfect square, sets @b@ to the square root of @a@ with
-- positive leading coefficient and returns 1. Otherwise returns 0.
foreign import ccall "fmpz_poly.h fmpz_poly_sqrt_classical"
  fmpz_poly_sqrt_classical :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO CInt

-- | /_fmpz_poly_sqrt_KS/ /res/ /poly/ /len/ 
-- 
-- Heuristic square root. If the return value is \(-1\), the function
-- failed, otherwise it succeeded and the following applies.
-- 
-- If @(poly, len)@ is a perfect square, sets @(res, len \/ 2 + 1)@ to the
-- square root of @poly@ with positive leading coefficient and returns 1.
-- Otherwise returns 0.
-- 
-- This function first uses various tests to detect nonsquares quickly.
-- Then, it computes the square root iteratively from top to bottom.
foreign import ccall "fmpz_poly.h _fmpz_poly_sqrt_KS"
  _fmpz_poly_sqrt_KS :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO CInt

-- | /fmpz_poly_sqrt_KS/ /b/ /a/ 
-- 
-- Heuristic square root. If the return value is \(-1\), the function
-- failed, otherwise it succeeded and the following applies.
-- 
-- If @a@ is a perfect square, sets @b@ to the square root of @a@ with
-- positive leading coefficient and returns 1. Otherwise returns 0.
foreign import ccall "fmpz_poly.h fmpz_poly_sqrt_KS"
  fmpz_poly_sqrt_KS :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO CInt

-- | /_fmpz_poly_sqrt_divconquer/ /res/ /poly/ /len/ /exact/ 
-- 
-- If @exact@ is \(1\) and @(poly, len)@ is a perfect square, sets
-- @(res, len \/ 2 + 1)@ to the square root of @poly@ with positive leading
-- coefficient and returns 1. Otherwise returns 0.
-- 
-- If @exact@ is \(0\), allows a remainder after the square root, which is
-- not computed.
-- 
-- This function first uses various tests to detect nonsquares quickly.
-- Then, it computes the square root iteratively from top to bottom.
foreign import ccall "fmpz_poly.h _fmpz_poly_sqrt_divconquer"
  _fmpz_poly_sqrt_divconquer :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CInt -> IO CInt

-- | /fmpz_poly_sqrt_divconquer/ /b/ /a/ 
-- 
-- If @a@ is a perfect square, sets @b@ to the square root of @a@ with
-- positive leading coefficient and returns 1. Otherwise returns 0.
foreign import ccall "fmpz_poly.h fmpz_poly_sqrt_divconquer"
  fmpz_poly_sqrt_divconquer :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO CInt

-- | /_fmpz_poly_sqrt/ /res/ /poly/ /len/ 
-- 
-- If @(poly, len)@ is a perfect square, sets @(res, len \/ 2 + 1)@ to the
-- square root of @poly@ with positive leading coefficient and returns 1.
-- Otherwise returns 0.
foreign import ccall "fmpz_poly.h _fmpz_poly_sqrt"
  _fmpz_poly_sqrt :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO CInt

-- | /fmpz_poly_sqrt/ /b/ /a/ 
-- 
-- If @a@ is a perfect square, sets @b@ to the square root of @a@ with
-- positive leading coefficient and returns 1. Otherwise returns 0.
foreign import ccall "fmpz_poly.h fmpz_poly_sqrt"
  fmpz_poly_sqrt :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO CInt

-- | /_fmpz_poly_sqrt_series/ /res/ /poly/ /len/ /n/ 
-- 
-- Set @(res, n)@ to the square root of the series @(poly, n)@, if it
-- exists, and return \(1\), otherwise, return \(0\).
-- 
-- If the valuation of @poly@ is not zero, @res@ is zero padded to make up
-- for the fact that the square root may not be known to precision \(n\).
foreign import ccall "fmpz_poly.h _fmpz_poly_sqrt_series"
  _fmpz_poly_sqrt_series :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CLong -> IO CInt

-- | /fmpz_poly_sqrt_series/ /b/ /a/ /n/ 
-- 
-- Set @b@ to the square root of the series @a@, where the latter is taken
-- to be a series of precision \(n\). If such a square root exists, return
-- \(1\), otherwise, return \(0\).
-- 
-- Note that if the valuation of @a@ is not zero, @b@ will not have
-- precision @n@. It is given only to the precision to which the square
-- root can be computed.
foreign import ccall "fmpz_poly.h fmpz_poly_sqrt_series"
  fmpz_poly_sqrt_series :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO CInt

-- Power sums ------------------------------------------------------------------

-- | /_fmpz_poly_power_sums_naive/ /res/ /poly/ /len/ /n/ 
-- 
-- Compute the (truncated) power sums series of the monic polynomial
-- @(poly,len)@ up to length \(n\) using Newton identities.
foreign import ccall "fmpz_poly.h _fmpz_poly_power_sums_naive"
  _fmpz_poly_power_sums_naive :: Ptr CFmpz -> Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /fmpz_poly_power_sums_naive/ /res/ /poly/ /n/ 
-- 
-- Compute the (truncated) power sum series of the monic polynomial @poly@
-- up to length \(n\) using Newton identities.
foreign import ccall "fmpz_poly.h fmpz_poly_power_sums_naive"
  fmpz_poly_power_sums_naive :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /fmpz_poly_power_sums/ /res/ /poly/ /n/ 
-- 
-- Compute the (truncated) power sums series of the monic polynomial @poly@
-- up to length \(n\). That is the power series whose coefficient of degree
-- \(i\) is the sum of the \(i\)-th power of all (complex) roots of the
-- polynomial @poly@.
foreign import ccall "fmpz_poly.h fmpz_poly_power_sums"
  fmpz_poly_power_sums :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> IO ()

-- | /_fmpz_poly_power_sums_to_poly/ /res/ /poly/ /len/ 
-- 
-- Compute the (monic) polynomial given by its power sums series
-- @(poly,len)@.
foreign import ccall "fmpz_poly.h _fmpz_poly_power_sums_to_poly"
  _fmpz_poly_power_sums_to_poly :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_power_sums_to_poly/ /res/ /Q/ 
-- 
-- Compute the (monic) polynomial given its power sums series @(Q)@.
foreign import ccall "fmpz_poly.h fmpz_poly_power_sums_to_poly"
  fmpz_poly_power_sums_to_poly :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> IO ()

-- Signature -------------------------------------------------------------------

-- | /_fmpz_poly_signature/ /r1/ /r2/ /poly/ /len/ 
-- 
-- Computes the signature \((r_1, r_2)\) of the polynomial @(poly, len)@.
-- Assumes that the polynomial is squarefree over \(\mathbb{Q}\).
foreign import ccall "fmpz_poly.h _fmpz_poly_signature"
  _fmpz_poly_signature :: Ptr CLong -> Ptr CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_signature/ /r1/ /r2/ /poly/ 
-- 
-- Computes the signature \((r_1, r_2)\) of the polynomial @poly@, which is
-- assumed to be square-free over \(\mathbb{Q}\). The values of \(r_1\) and
-- \(2 r_2\) are the number of real and complex roots of the polynomial,
-- respectively. For convenience, the zero polynomial is allowed, in which
-- case the output is \((0, 0)\).
-- 
-- If the polynomial is not square-free, the behaviour is undefined and an
-- exception may be raised.
-- 
-- This function uses the algorithm described in [Algorithm
-- 4.1.11]< [Coh1996]>.
foreign import ccall "fmpz_poly.h fmpz_poly_signature"
  fmpz_poly_signature :: Ptr CLong -> Ptr CLong -> Ptr CFmpzPoly -> IO ()

-- Hensel lifting --------------------------------------------------------------

-- | /fmpz_poly_hensel_build_tree/ /link/ /v/ /w/ /fac/ 
-- 
-- Initialises and builds a Hensel tree consisting of two arrays \(v\),
-- \(w\) of polynomials an array of links, called @link@.
-- 
-- The caller supplies a set of \(r\) local factors (in the factor
-- structure @fac@) of some polynomial \(F\) over \(\mathbf{Z}\). They also
-- supply two arrays of initialised polynomials \(v\) and \(w\), each of
-- length \(2r - 2\) and an array @link@, also of length \(2r - 2\).
-- 
-- We will have five arrays: a \(v\) of @fmpz_poly_t@\'s and a \(V\) of
-- @nmod_poly_t@\'s and also a \(w\) and a \(W\) and @link@. Here\'s the
-- idea: we sort each leaf and node of a factor tree by degree, in fact
-- choosing to multiply the two smallest factors, then the next two
-- smallest (factors or products) etc.until a tree is made. The tree will
-- be stored in the \(v\)\'s. The first two elements of \(v\) will be the
-- smallest modular factors, the last two elements of \(v\) will multiply
-- to form \(F\) itself. Since \(v\) will be rearranging the original
-- factors we will need to be able to recover the original order. For this
-- we use the array @link@ which has nonnegative even numbers and negative
-- numbers. It is an array of @slong@\'s which aligns with \(V\) and \(v\)
-- if @link@ has a negative number in spot \(j\) that means \(V_j\) is an
-- original modular factor which has been lifted, if @link[j]@ is a
-- nonnegative even number then \(V_j\) stores a product of the two entries
-- at @V[link[j]]@ and @V[link[j]+1]@. \(W\) and \(w\) play the role of the
-- extended GCD, at \(V_0\), \(V_2\), \(V_4\), etc.we have a new product,
-- \(W_0\), \(W_2\), \(W_4\), etc.are the XGCD cofactors of the \(V\)\'s.
-- For example, \(V_0 W_0 + V_1 W_1 \equiv 1 \pmod{p^{\ell}}\) for some
-- \(\ell\). These will be lifted along with the entries in \(V\). It is
-- not enough to just lift each factor, we have to lift the entire tree and
-- the tree of XGCD cofactors.
foreign import ccall "fmpz_poly.h fmpz_poly_hensel_build_tree"
  fmpz_poly_hensel_build_tree :: Ptr CLong -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CNModPolyFactor -> IO ()

-- | /fmpz_poly_hensel_lift/ /G/ /H/ /A/ /B/ /f/ /g/ /h/ /a/ /b/ /p/ /p1/ 
-- 
-- This is the main Hensel lifting routine, which performs a Hensel step
-- from polynomials mod \(p\) to polynomials mod \(P = p p_1\). One starts
-- with polynomials \(f\), \(g\), \(h\) such that \(f = gh \pmod p\). The
-- polynomials \(a\), \(b\) satisfy \(ag + bh = 1 \pmod p\).
-- 
-- The lifting formulae are
-- 
-- \[`\]
-- \[G = \biggl( \bigl( \frac{f-gh}{p} \bigr) b \bmod g \biggr) p + g\]
-- \[H = \biggl( \bigl( \frac{f-gh}{p} \bigr) a \bmod h \biggr) p + h\]
-- \[B = \biggl( \bigl( \frac{1-aG-bH}{p} \bigr) b \bmod g \biggr) p + b\]
-- \[A = \biggl( \bigl( \frac{1-aG-bH}{p} \bigr) a \bmod h \biggr) p + a\]
-- 
-- Upon return we have \(A G + B H = 1 \pmod P\) and \(f = G H \pmod P\),
-- where \(G = g \pmod p\) etc.
-- 
-- We require that \(1 < p_1 \leq p\) and that the input polynomials
-- \(f, g, h\) have degree at least \(1\) and that the input polynomials
-- \(a\) and \(b\) are non-zero.
-- 
-- The output arguments \(G, H, A, B\) may only be aliased with the input
-- arguments \(g, h, a, b\), respectively.
foreign import ccall "fmpz_poly.h fmpz_poly_hensel_lift"
  fmpz_poly_hensel_lift :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> Ptr CFmpz -> IO ()

-- | /fmpz_poly_hensel_lift_without_inverse/ /Gout/ /Hout/ /f/ /g/ /h/ /a/ /b/ /p/ /p1/ 
-- 
-- Given polynomials such that \(f = gh \pmod p\) and
-- \(ag + bh = 1 \pmod p\), lifts only the factors \(g\) and \(h\) modulo
-- \(P = p p_1\).
-- 
-- See @fmpz_poly_hensel_lift@.
foreign import ccall "fmpz_poly.h fmpz_poly_hensel_lift_without_inverse"
  fmpz_poly_hensel_lift_without_inverse :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> Ptr CFmpz -> IO ()

-- | /fmpz_poly_hensel_lift_only_inverse/ /Aout/ /Bout/ /G/ /H/ /a/ /b/ /p/ /p1/ 
-- 
-- Given polynomials such that \(f = gh \pmod p\) and
-- \(ag + bh = 1 \pmod p\), lifts only the cofactors \(a\) and \(b\) modulo
-- \(P = p p_1\).
-- 
-- See @fmpz_poly_hensel_lift@.
foreign import ccall "fmpz_poly.h fmpz_poly_hensel_lift_only_inverse"
  fmpz_poly_hensel_lift_only_inverse :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> Ptr CFmpz -> IO ()

-- | /fmpz_poly_hensel_lift_tree_recursive/ /link/ /v/ /w/ /f/ /j/ /inv/ /p0/ /p1/ 
-- 
-- Takes a current Hensel tree @(link, v, w)@ and a pair \((j,j+1)\) of
-- entries in the tree and lifts the tree from mod \(p_0\) to mod
-- \(P = p_0 p_1\), where \(1 < p_1 \leq p_0\).
-- 
-- Set @inv@ to \(-1\) if restarting Hensel lifting, \(0\) if stopping and
-- \(1\) otherwise.
-- 
-- Here \(f = g h\) is the polynomial whose factors we are trying to lift.
-- We will have that @v[j]@ is the product of @v[link[j]]@ and
-- @v[link[j] + 1]@ as described above.
-- 
-- Does support aliasing of \(f\) with one of the polynomials in the lists
-- \(v\) and \(w\). But the polynomials in these two lists are not allowed
-- to be aliases of each other.
foreign import ccall "fmpz_poly.h fmpz_poly_hensel_lift_tree_recursive"
  fmpz_poly_hensel_lift_tree_recursive :: Ptr CLong -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> CLong -> Ptr CFmpz -> Ptr CFmpz -> IO ()

-- | /fmpz_poly_hensel_lift_tree/ /link/ /v/ /w/ /f/ /r/ /p/ /e0/ /e1/ /inv/ 
-- 
-- Computes \(p_0 = p^{e_0}\) and \(p_1 = p^{e_1 - e_0}\) for a small prime
-- \(p\) and \(P = p^{e_1}\).
-- 
-- If we aim to lift to \(p^b\) then \(f\) is the polynomial whose factors
-- we wish to lift, made monic mod \(p^b\). As usual, @(link, v, w)@ is an
-- initialised tree.
-- 
-- This starts the recursion on lifting the /product tree/ for lifting from
-- \(p^{e_0}\) to \(p^{e_1}\). The value of @inv@ corresponds to that given
-- for the function @fmpz_poly_hensel_lift_tree_recursive@. We set \(r\) to
-- the number of local factors of \(f\).
-- 
-- In terms of the notation, above \(P = p^{e_1}\), \(p_0 = p^{e_0}\) and
-- \(p_1 = p^{e_1-e_0}\).
-- 
-- Assumes that \(f\) is monic.
-- 
-- Assumes that \(1 < p_1 \leq p_0\), that is, \(0 < e_1 \leq e_0\).
foreign import ccall "fmpz_poly.h fmpz_poly_hensel_lift_tree"
  fmpz_poly_hensel_lift_tree :: Ptr CLong -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> Ptr CFmpz -> CLong -> CLong -> CLong -> IO ()

-- | /_fmpz_poly_hensel_start_lift/ /lifted_fac/ /link/ /v/ /w/ /f/ /local_fac/ /N/ 
-- 
-- This function takes the local factors in @local_fac@ and Hensel lifts
-- them until they are known mod \(p^N\), where \(N \geq 1\).
-- 
-- These lifted factors will be stored (in the same ordering) in
-- @lifted_fac@. It is assumed that @link@, @v@, and @w@ are initialized
-- arrays @fmpz_poly_t@\'s with at least \(2*r - 2\) entries and that
-- \(r \geq 2\). This is done outside of this function so that you can keep
-- them for restarting Hensel lifting later. The product of local factors
-- must be squarefree.
-- 
-- The return value is an exponent which must be passed to the function
-- @_fmpz_poly_hensel_continue_lift@ as @prev_exp@ if the Hensel lifting is
-- to be resumed.
-- 
-- Currently, supports the case when \(N = 1\) for convenience, although it
-- is preferable in this case to simple iterate over the local factors and
-- convert them to polynomials over \(\mathbf{Z}\).
foreign import ccall "fmpz_poly.h _fmpz_poly_hensel_start_lift"
  _fmpz_poly_hensel_start_lift :: Ptr CFmpzPolyFactor -> Ptr CLong -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CNModPolyFactor -> CLong -> IO CLong

-- | /_fmpz_poly_hensel_continue_lift/ /lifted_fac/ /link/ /v/ /w/ /f/ /prev/ /curr/ /N/ /p/ 
-- 
-- This function restarts a stopped Hensel lift.
-- 
-- It lifts from @curr@ to \(N\). It also requires @prev@ (to lift the
-- cofactors) given as the return value of the function
-- @_fmpz_poly_hensel_start_lift@ or the function
-- @_fmpz_poly_hensel_continue_lift@. The current lifted factors are
-- supplied in @lifted_fac@ and upon return are updated there. As usual
-- @link@, @v@, and @w@ describe the current Hensel tree, \(r\) is the
-- number of local factors and \(p\) is the small prime modulo whose power
-- we are lifting to. It is required that @curr@ be at least \(1\) and that
-- @N > curr@.
-- 
-- Currently, supports the case when @prev@ and @curr@ are equal.
foreign import ccall "fmpz_poly.h _fmpz_poly_hensel_continue_lift"
  _fmpz_poly_hensel_continue_lift :: Ptr CFmpzPolyFactor -> Ptr CLong -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpzPoly -> CLong -> CLong -> CLong -> Ptr CFmpz -> IO CLong

-- | /fmpz_poly_hensel_lift_once/ /lifted_fac/ /f/ /local_fac/ /N/ 
-- 
-- This function does a Hensel lift.
-- 
-- It lifts local factors stored in @local_fac@ of \(f\) to \(p^N\), where
-- \(N \geq 2\). The lifted factors will be stored in @lifted_fac@. This
-- lift cannot be restarted. This function is a convenience function
-- intended for end users. The product of local factors must be squarefree.
foreign import ccall "fmpz_poly.h fmpz_poly_hensel_lift_once"
  fmpz_poly_hensel_lift_once :: Ptr CFmpzPolyFactor -> Ptr CFmpzPoly -> Ptr CNModPolyFactor -> CLong -> IO ()

-- Input and output ------------------------------------------------------------

-- The functions in this section are not intended to be particularly fast.
-- They are intended mainly as a debugging aid.
--
-- For the string output functions there are two variants. The first uses a
-- simple string representation of polynomials which prints only the length
-- of the polynomial and the integer coefficients, whilst the latter
-- variant, appended with @_pretty@, uses a more traditional string
-- representation of polynomials which prints a variable name as part of
-- the representation.
--
-- The first string representation is given by a sequence of integers, in
-- decimal notation, separated by white space. The first integer gives the
-- length of the polynomial; the remaining integers are the coefficients.
-- For example \(5x^3 - x + 1\) is represented by the string
-- @\"4  1 -1 0 5\"@, and the zero polynomial is represented by @\"0\"@.
-- The coefficients may be signed and arbitrary precision.
--
-- The string representation of the functions appended by @_pretty@
-- includes only the non-zero terms of the polynomial, starting with the
-- one of highest degree. Each term starts with a coefficient, prepended
-- with a sign, followed by the character @*@, followed by a variable name,
-- which must be passed as a string parameter to the function, followed by
-- a caret @^@ followed by a non-negative exponent.
--
-- If the sign of the leading coefficient is positive, it is omitted. Also
-- the exponents of the degree 1 and 0 terms are omitted, as is the
-- variable and the @*@ character in the case of the degree 0 coefficient.
-- If the coefficient is plus or minus one, the coefficient is omitted,
-- except for the sign.
--
-- Some examples of the @_pretty@ representation are:
--



-- | /_fmpz_poly_print/ /poly/ /len/ 
-- 
-- Prints the polynomial @(poly, len)@ to @stdout@.
-- 
-- In case of success, returns a positive value. In case of failure,
-- returns a non-positive value.
foreign import ccall "fmpz_poly.h _fmpz_poly_print"
  _fmpz_poly_print :: Ptr CFmpz -> CLong -> IO CInt

-- | /fmpz_poly_print/ /poly/ 
-- 
-- Prints the polynomial to @stdout@.
-- 
-- In case of success, returns a positive value. In case of failure,
-- returns a non-positive value.
fmpz_poly_print :: Ptr CFmpzPoly -> IO CInt
fmpz_poly_print poly = printCStr fmpz_poly_get_str poly

-- | /_fmpz_poly_print_pretty/ /poly/ /len/ /x/ 
-- 
-- Prints the pretty representation of @(poly, len)@ to @stdout@, using the
-- string @x@ to represent the indeterminate.
-- 
-- In case of success, returns a positive value. In case of failure,
-- returns a non-positive value.
foreign import ccall "fmpz_poly.h _fmpz_poly_print_pretty"
  _fmpz_poly_print_pretty :: Ptr CFmpz -> CLong -> CString -> IO CInt

-- | /fmpz_poly_print_pretty/ /poly/ /x/ 
-- 
-- Prints the pretty representation of @poly@ to @stdout@, using the string
-- @x@ to represent the indeterminate.
-- 
-- In case of success, returns a positive value. In case of failure,
-- returns a non-positive value.
fmpz_poly_print_pretty poly var =
  printCStr (flip fmpz_poly_get_str_pretty var) poly

-- | /_fmpz_poly_fprint/ /file/ /poly/ /len/ 
-- 
-- Prints the polynomial @(poly, len)@ to the stream @file@.
-- 
-- In case of success, returns a positive value. In case of failure,
-- returns a non-positive value.
foreign import ccall "fmpz_poly.h _fmpz_poly_fprint"
  _fmpz_poly_fprint :: Ptr CFile -> Ptr CFmpz -> CLong -> IO CInt

-- | /fmpz_poly_fprint/ /file/ /poly/ 
-- 
-- Prints the polynomial to the stream @file@.
-- 
-- In case of success, returns a positive value. In case of failure,
-- returns a non-positive value.
foreign import ccall "fmpz_poly.h fmpz_poly_fprint"
  fmpz_poly_fprint :: Ptr CFile -> Ptr CFmpzPoly -> IO CInt

-- | /_fmpz_poly_fprint_pretty/ /file/ /poly/ /len/ /x/ 
-- 
-- Prints the pretty representation of @(poly, len)@ to the stream @file@,
-- using the string @x@ to represent the indeterminate.
-- 
-- In case of success, returns a positive value. In case of failure,
-- returns a non-positive value.
foreign import ccall "fmpz_poly.h _fmpz_poly_fprint_pretty"
  _fmpz_poly_fprint_pretty :: Ptr CFile -> Ptr CFmpz -> CLong -> CString -> IO CInt

-- | /fmpz_poly_fprint_pretty/ /file/ /poly/ /x/ 
-- 
-- Prints the pretty representation of @poly@ to the stream @file@, using
-- the string @x@ to represent the indeterminate.
-- 
-- In case of success, returns a positive value. In case of failure,
-- returns a non-positive value.
foreign import ccall "fmpz_poly.h fmpz_poly_fprint_pretty"
  fmpz_poly_fprint_pretty :: Ptr CFile -> Ptr CFmpzPoly -> CString -> IO CInt

-- | /fmpz_poly_read/ /poly/ 
-- 
-- Reads a polynomial from @stdin@, storing the result in @poly@.
-- 
-- In case of success, returns a positive number. In case of failure,
-- returns a non-positive value.
foreign import ccall "fmpz_poly.h fmpz_poly_read"
  fmpz_poly_read :: Ptr CFmpzPoly -> IO CInt

-- | /fmpz_poly_read_pretty/ /poly/ /x/ 
-- 
-- Reads a polynomial in pretty format from @stdin@.
-- 
-- For further details, see the documentation for the function
-- @fmpz_poly_fread_pretty@.
foreign import ccall "fmpz_poly.h fmpz_poly_read_pretty"
  fmpz_poly_read_pretty :: Ptr CFmpzPoly -> Ptr (Ptr CChar) -> IO CInt

-- | /fmpz_poly_fread/ /file/ /poly/ 
-- 
-- Reads a polynomial from the stream @file@, storing the result in @poly@.
-- 
-- In case of success, returns a positive number. In case of failure,
-- returns a non-positive value.
foreign import ccall "fmpz_poly.h fmpz_poly_fread"
  fmpz_poly_fread :: Ptr CFile -> Ptr CFmpzPoly -> IO CInt

-- | /fmpz_poly_fread_pretty/ /file/ /poly/ /x/ 
-- 
-- Reads a polynomial from the file @file@ and sets @poly@ to this
-- polynomial. The string @*x@ is set to the variable name that is used in
-- the input.
-- 
-- Returns a positive value, equal to the number of characters read from
-- the file, in case of success. Returns a non-positive value in case of
-- failure, which could either be a read error or the indicator of a
-- malformed input.
foreign import ccall "fmpz_poly.h fmpz_poly_fread_pretty"
  fmpz_poly_fread_pretty :: Ptr CFile -> Ptr CFmpzPoly -> Ptr (Ptr CChar) -> IO CInt

-- Modular reduction and reconstruction ----------------------------------------

-- | /fmpz_poly_get_nmod_poly/ /Amod/ /A/ 
-- 
-- Sets the coefficients of @Amod@ to the coefficients in @A@, reduced by
-- the modulus of @Amod@.
foreign import ccall "fmpz_poly.h fmpz_poly_get_nmod_poly"
  fmpz_poly_get_nmod_poly :: Ptr CNModPoly -> Ptr CFmpzPoly -> IO ()

-- | /fmpz_poly_set_nmod_poly/ /A/ /Amod/ 
-- 
-- Sets the coefficients of @A@ to the residues in @Amod@, normalised to
-- the interval \(-m/2 \le r < m/2\) where \(m\) is the modulus.
foreign import ccall "fmpz_poly.h fmpz_poly_set_nmod_poly"
  fmpz_poly_set_nmod_poly :: Ptr CFmpzPoly -> Ptr CNModPoly -> IO ()

-- | /fmpz_poly_set_nmod_poly_unsigned/ /A/ /Amod/ 
-- 
-- Sets the coefficients of @A@ to the residues in @Amod@, normalised to
-- the interval \(0 \le r < m\) where \(m\) is the modulus.
foreign import ccall "fmpz_poly.h fmpz_poly_set_nmod_poly_unsigned"
  fmpz_poly_set_nmod_poly_unsigned :: Ptr CFmpzPoly -> Ptr CNModPoly -> IO ()

-- | /_fmpz_poly_CRT_ui_precomp/ /res/ /poly1/ /len1/ /m1/ /poly2/ /len2/ /m2/ /m2inv/ /m1m2/ /c/ /sign/ 
-- 
-- Sets the coefficients in @res@ to the CRT reconstruction modulo
-- \(m_1m_2\) of the residues @(poly1, len1)@ and @(poly2, len2)@ which are
-- images modulo \(m_1\) and \(m_2\) respectively. The caller must supply
-- the precomputed product of the input moduli as \(m_1m_2\), the inverse
-- of \(m_1\) modulo \(m_2\) as \(c\), and the precomputed inverse of
-- \(m_2\) (in the form computed by @n_preinvert_limb@) as @m2inv@.
-- 
-- If @sign@ = 0, residues \(0 <= r < m_1 m_2\) are computed, while if
-- @sign@ = 1, residues \(-m_1 m_2/2 <= r < m_1 m_2/2\) are computed.
-- 
-- Coefficients of @res@ are written up to the maximum of @len1@ and
-- @len2@.
foreign import ccall "fmpz_poly.h _fmpz_poly_CRT_ui_precomp"
  _fmpz_poly_CRT_ui_precomp :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> Ptr CMp -> CLong -> CMpLimb -> CMpLimb -> Ptr CFmpz -> CMpLimb -> CInt -> IO ()

-- | /_fmpz_poly_CRT_ui/ /res/ /poly1/ /len1/ /m1/ /poly2/ /len2/ /m2/ /m2inv/ /sign/ 
-- 
-- This function is identical to @_fmpz_poly_CRT_ui_precomp@, apart from
-- automatically computing \(m_1m_2\) and \(c\). It also aborts if \(c\)
-- cannot be computed.
foreign import ccall "fmpz_poly.h _fmpz_poly_CRT_ui"
  _fmpz_poly_CRT_ui :: Ptr CFmpz -> Ptr CFmpz -> CLong -> Ptr CFmpz -> Ptr CMp -> CLong -> CMpLimb -> CMpLimb -> CInt -> IO ()

-- | /fmpz_poly_CRT_ui/ /res/ /poly1/ /m/ /poly2/ /sign/ 
-- 
-- Given @poly1@ with coefficients modulo @m@ and @poly2@ with modulus
-- \(n\), sets @res@ to the CRT reconstruction modulo \(mn\) with
-- coefficients satisfying \(-mn/2 \le c < mn/2\) (if sign = 1) or
-- \(0 \le c < mn\) (if sign = 0).
foreign import ccall "fmpz_poly.h fmpz_poly_CRT_ui"
  fmpz_poly_CRT_ui :: Ptr CFmpzPoly -> Ptr CFmpzPoly -> Ptr CFmpz -> Ptr CNModPoly -> CInt -> IO ()

-- Products --------------------------------------------------------------------

-- | /_fmpz_poly_product_roots_fmpz_vec/ /poly/ /xs/ /n/ 
-- 
-- Sets @(poly, n + 1)@ to the monic polynomial which is the product of
-- \((x - x_0)(x - x_1) \cdots (x - x_{n-1})\), the roots \(x_i\) being
-- given by @xs@.
-- 
-- Aliasing of the input and output is not allowed.
foreign import ccall "fmpz_poly.h _fmpz_poly_product_roots_fmpz_vec"
  _fmpz_poly_product_roots_fmpz_vec :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_product_roots_fmpz_vec/ /poly/ /xs/ /n/ 
-- 
-- Sets @poly@ to the monic polynomial which is the product of
-- \((x - x_0)(x - x_1) \cdots (x - x_{n-1})\), the roots \(x_i\) being
-- given by @xs@.
foreign import ccall "fmpz_poly.h fmpz_poly_product_roots_fmpz_vec"
  fmpz_poly_product_roots_fmpz_vec :: Ptr CFmpzPoly -> Ptr CFmpz -> CLong -> IO ()

-- | /_fmpz_poly_product_roots_fmpq_vec/ /poly/ /xs/ /n/ 
-- 
-- Sets @(poly, n + 1)@ to the product of
-- \((q_0 x - p_0)(q_1 x - p_1) \cdots (q_{n-1} x - p_{n-1})\), the roots
-- \(p_i/q_i\) being given by @xs@.
foreign import ccall "fmpz_poly.h _fmpz_poly_product_roots_fmpq_vec"
  _fmpz_poly_product_roots_fmpq_vec :: Ptr CFmpz -> Ptr CFmpq -> CLong -> IO ()

-- | /fmpz_poly_product_roots_fmpq_vec/ /poly/ /xs/ /n/ 
-- 
-- Sets @poly@ to the polynomial which is the product of
-- \((q_0 x - p_0)(q_1 x - p_1) \cdots (q_{n-1} x - p_{n-1})\), the roots
-- \(p_i/q_i\) being given by @xs@.
foreign import ccall "fmpz_poly.h fmpz_poly_product_roots_fmpq_vec"
  fmpz_poly_product_roots_fmpq_vec :: Ptr CFmpzPoly -> Ptr CFmpq -> CLong -> IO ()

-- Roots -----------------------------------------------------------------------

-- | /_fmpz_poly_bound_roots/ /bound/ /poly/ /len/ 
-- 
-- Computes a nonnegative integer @bound@ that bounds the absolute value of
-- all complex roots of @poly@. Uses Fujiwara\'s bound
-- 
-- \[`\]
-- \[2 \max \left(
--     \left|\frac{a_{n-1}}{a_n}\right|,
--     \left|\frac{a_{n-2}}{a_n}\right|^{\frac{1}{2}}, \dotsc
--     \left|\frac{a_1}{a_n}\right|^{\frac{1}{n-1}},
--     \left|\frac{a_0}{2a_n}\right|^{\frac{1}{n}}
-- \right)\]
-- 
-- where the coefficients of the polynomial are \(a_0, \ldots, a_n\).
foreign import ccall "fmpz_poly.h _fmpz_poly_bound_roots"
  _fmpz_poly_bound_roots :: Ptr CFmpz -> Ptr CFmpz -> CLong -> IO ()

-- | /_fmpz_poly_num_real_roots_sturm/ /n_neg/ /n_pos/ /pol/ /len/ 
-- 
-- Sets @n_neg@ and @n_pos@ to the number of negative and positive roots of
-- the polynomial @(pol, len)@ using Sturm sequence. The Sturm sequence is
-- computed via subresultant remainders obtained by repeated call to the
-- function @_fmpz_poly_pseudo_rem_cohen@.
-- 
-- The polynomial is assumed to be squarefree, of degree larger than 1 and
-- with non-zero constant coefficient.
foreign import ccall "fmpz_poly.h _fmpz_poly_num_real_roots_sturm"
  _fmpz_poly_num_real_roots_sturm :: Ptr CLong -> Ptr CLong -> Ptr CFmpz -> CLong -> IO ()

-- | /fmpz_poly_num_real_roots_sturm/ /pol/ 
-- 
-- Returns the number of real roots of the squarefree polynomial @pol@
-- using Sturm sequence.
-- 
-- The polynomial is assumed to be squarefree.
foreign import ccall "fmpz_poly.h fmpz_poly_num_real_roots_sturm"
  fmpz_poly_num_real_roots_sturm :: Ptr CFmpzPoly -> IO CLong

-- | /_fmpz_poly_num_real_roots/ /pol/ /len/ 
-- 
-- Returns the number of real roots of the squarefree polynomial
-- @(pol, len)@.
-- 
-- The polynomial is assumed to be squarefree.
foreign import ccall "fmpz_poly.h _fmpz_poly_num_real_roots"
  _fmpz_poly_num_real_roots :: Ptr CFmpz -> CLong -> IO CLong

-- | /fmpz_poly_num_real_roots/ /pol/ 
-- 
-- Returns the number of real roots of the squarefree polynomial @pol@.
-- 
-- The polynomial is assumed to be squarefree.
foreign import ccall "fmpz_poly.h fmpz_poly_num_real_roots"
  fmpz_poly_num_real_roots :: Ptr CFmpzPoly -> IO CLong

-- Minimal polynomials ---------------------------------------------------------

-- | /_fmpz_poly_cyclotomic/ /a/ /n/ /factors/ /num_factors/ /phi/ 
-- 
-- Sets @a@ to the lower half of the cyclotomic polynomial \(\Phi_n(x)\),
-- given \(n \ge 3\) which must be squarefree.
-- 
-- A precomputed array containing the prime factors of \(n\) must be
-- provided, as well as the value of the Euler totient function \(\phi(n)\)
-- as @phi@. If \(n\) is even, 2 must be the first factor in the list.
-- 
-- The degree of \(\Phi_n(x)\) is exactly \(\phi(n)\). Only the low
-- \((\phi(n) + 1) / 2\) coefficients are written; the high coefficients
-- can be obtained afterwards by copying the low coefficients in reverse
-- order, since \(\Phi_n(x)\) is a palindrome for \(n \ne 1\).
-- 
-- We use the sparse power series algorithm described as Algorithm 4
-- < [ArnoldMonagan2011]>. The algorithm is based on the identity
-- 
-- \[`\]
-- \[\Phi_n(x) = \prod_{d|n} (x^d - 1)^{\mu(n/d)}.\]
-- 
-- Treating the polynomial as a power series, the multiplications and
-- divisions can be done very cheaply using repeated additions and
-- subtractions. The complexity is \(O(2^k \phi(n))\) where \(k\) is the
-- number of prime factors in \(n\).
-- 
-- To improve efficiency for small \(n\), we treat the @fmpz@ coefficients
-- as machine integers when there is no risk of overflow. The following
-- bounds are given in Table 6 of < [ArnoldMonagan2011]>:
-- 
-- For \(n < 10163195\), the largest coefficient in any \(\Phi_n(x)\) has
-- 27 bits, so machine arithmetic is safe on 32 bits.
-- 
-- For \(n < 169828113\), the largest coefficient in any \(\Phi_n(x)\) has
-- 60 bits, so machine arithmetic is safe on 64 bits.
-- 
-- Further, the coefficients are always \(\pm 1\) or 0 if there are exactly
-- two prime factors, so in this case machine arithmetic can be used as
-- well.
-- 
-- Finally, we handle two special cases: if there is exactly one prime
-- factor \(n = p\), then \(\Phi_n(x) = 1 + x + x^2 + \ldots + x^{n-1}\),
-- and if \(n = 2m\), we use \(\Phi_n(x) = \Phi_m(-x)\) to fall back to the
-- case when \(n\) is odd.
foreign import ccall "fmpz_poly.h _fmpz_poly_cyclotomic"
  _fmpz_poly_cyclotomic :: Ptr CFmpz -> CULong -> Ptr CMp -> CLong -> CULong -> IO ()

-- | /fmpz_poly_cyclotomic/ /poly/ /n/ 
-- 
-- Sets @poly@ to the \(n\)-th cyclotomic polynomial, defined as
-- \(\Phi_n(x) = \prod_{\omega} (x-\omega)\) where \(\omega\) runs over all
-- the \(n\)-th primitive roots of unity.
-- 
-- We factor \(n\) into \(n = qs\) where \(q\) is squarefree, and compute
-- \(\Phi_q(x)\). Then \(\Phi_n(x) = \Phi_q(x^s)\).
foreign import ccall "fmpz_poly.h fmpz_poly_cyclotomic"
  fmpz_poly_cyclotomic :: Ptr CFmpzPoly -> CULong -> IO ()

-- | /_fmpz_poly_is_cyclotomic/ /poly/ /len/ 
-- 
-- If @poly@ is a cyclotomic polynomial, returns the index \(n\) of this
-- cyclotomic polynomial. If @poly@ is not a cyclotomic polynomial, returns
-- 0.
foreign import ccall "fmpz_poly.h _fmpz_poly_is_cyclotomic"
  _fmpz_poly_is_cyclotomic :: Ptr CFmpz -> CLong -> IO CULong

-- | /_fmpz_poly_cos_minpoly/ /coeffs/ /n/ 
-- 
-- Sets @poly@ to the minimal polynomial of \(2 \cos(2 \pi / n)\). For
-- suitable choice of \(n\), this gives the minimal polynomial of
-- \(2 \cos(a \pi)\) or \(2 \sin(a \pi)\) for any rational \(a\).
-- 
-- The cosine is multiplied by a factor two since this gives a monic
-- polynomial with integer coefficients. One can obtain the minimal
-- polynomial for \(\cos(2 \pi / n)\) by making the substitution
-- \(x \to x / 2\).
-- 
-- For \(n > 2\), the degree of the polynomial is \(\varphi(n) / 2\). For
-- \(n = 1, 2\), the degree is 1. For \(n = 0\), we define the output to be
-- the constant polynomial 1.
foreign import ccall "fmpz_poly.h _fmpz_poly_cos_minpoly"
  _fmpz_poly_cos_minpoly :: Ptr CFmpz -> CULong -> IO ()

-- | /_fmpz_poly_swinnerton_dyer/ /coeffs/ /n/ 
-- 
-- Sets @poly@ to the Swinnerton-Dyer polynomial \(S_n\), defined as the
-- integer polynomial
-- \(S_n = \prod (x \pm \sqrt{2} \pm \sqrt{3} \pm \sqrt{5} \pm \ldots \pm \sqrt{p_n})\)
-- where \(p_n\) denotes the \(n\)-th prime number and all combinations of
-- signs are taken. This polynomial has degree \(2^n\) and is irreducible
-- over the integers (it is the minimal polynomial of
-- \(\sqrt{2} + \ldots + \sqrt{p_n}\)).
foreign import ccall "fmpz_poly.h _fmpz_poly_swinnerton_dyer"
  _fmpz_poly_swinnerton_dyer :: Ptr CFmpz -> CULong -> IO ()

-- Orthogonal polynomials ------------------------------------------------------

-- | /_fmpz_poly_chebyshev_t/ /coeffs/ /n/ 
-- 
-- Sets @poly@ to the Chebyshev polynomial of the first kind \(T_n(x)\),
-- defined by \(T_n(x) = \cos(n \cos^{-1}(x))\), for \(n\ge0\). The
-- coefficients are calculated using a hypergeometric recurrence.
foreign import ccall "fmpz_poly.h _fmpz_poly_chebyshev_t"
  _fmpz_poly_chebyshev_t :: Ptr CFmpz -> CULong -> IO ()

-- | /_fmpz_poly_chebyshev_u/ /coeffs/ /n/ 
-- 
-- Sets @poly@ to the Chebyshev polynomial of the first kind \(U_n(x)\),
-- defined by \((n+1) U_n(x) = T'_{n+1}(x)\), for \(n\ge0\). The
-- coefficients are calculated using a hypergeometric recurrence.
foreign import ccall "fmpz_poly.h _fmpz_poly_chebyshev_u"
  _fmpz_poly_chebyshev_u :: Ptr CFmpz -> CULong -> IO ()

-- | /_fmpz_poly_legendre_pt/ /coeffs/ /n/ 
-- 
-- Sets @coeffs@ to the coefficient array of the shifted Legendre
-- polynomial \(\tilde{P_n}(x)\), defined by
-- \(\tilde{P_n}(x) = P_n(2x-1)\), for \(n\ge0\). The coefficients are
-- calculated using a hypergeometric recurrence. The length of the array
-- will be @n+1@. See @fmpq_poly@ for the Legendre polynomials.
foreign import ccall "fmpz_poly.h _fmpz_poly_legendre_pt"
  _fmpz_poly_legendre_pt :: Ptr CFmpz -> CULong -> IO ()

-- | /fmpz_poly_legendre_pt/ /poly/ /n/ 
-- 
-- Sets @poly@ to the shifted Legendre polynomial \(\tilde{P_n}(x)\),
-- defined by \(\tilde{P_n}(x) = P_n(2x-1)\), for \(n\ge0\). The
-- coefficients are calculated using a hypergeometric recurrence. See
-- @fmpq_poly@ for the Legendre polynomials.
foreign import ccall "fmpz_poly.h fmpz_poly_legendre_pt"
  fmpz_poly_legendre_pt :: Ptr CFmpzPoly -> CULong -> IO ()

-- | /_fmpz_poly_hermite_h/ /coeffs/ /n/ 
-- 
-- Sets @coeffs@ to the coefficient array of the Hermite polynomial
-- \(H_n(x)\), defined by \(H'_n(x) = 2nH_{n-1}(x)\), for \(n\ge0\). The
-- coefficients are calculated using a hypergeometric recurrence. The
-- length of the array will be @n+1@.
foreign import ccall "fmpz_poly.h _fmpz_poly_hermite_h"
  _fmpz_poly_hermite_h :: Ptr CFmpz -> CULong -> IO ()

-- | /fmpz_poly_hermite_h/ /poly/ /n/ 
-- 
-- Sets @poly@ to the Hermite polynomial \(H_n(x)\), defined by
-- \(H'_n(x) = 2nH_{n-1}(x)\), for \(n\ge0\). The coefficients are
-- calculated using a hypergeometric recurrence.
foreign import ccall "fmpz_poly.h fmpz_poly_hermite_h"
  fmpz_poly_hermite_h :: Ptr CFmpzPoly -> CULong -> IO ()

-- | /_fmpz_poly_hermite_he/ /coeffs/ /n/ 
-- 
-- Sets @coeffs@ to the coefficient array of the Hermite polynomial
-- \(He_n(x)\), defined by
-- \(He_n(x) = 2^{-\tfrac{n}{2}}H_n\left(\frac{x}{\sqrt2}\right)\), for
-- \(n\ge0\). The coefficients are calculated using a hypergeometric
-- recurrence. The length of the array will be @n+1@.
foreign import ccall "fmpz_poly.h _fmpz_poly_hermite_he"
  _fmpz_poly_hermite_he :: Ptr CFmpz -> CULong -> IO ()

-- | /fmpz_poly_hermite_he/ /poly/ /n/ 
-- 
-- Sets @poly@ to the Hermite polynomial \(He_n(x)\), defined by
-- \(He_n(x) = 2^{-\tfrac{n}{2}}H_n\left(\frac{x}{\sqrt2}\right)\), for
-- \(n\ge0\). The coefficients are calculated using a hypergeometric
-- recurrence.
foreign import ccall "fmpz_poly.h fmpz_poly_hermite_he"
  fmpz_poly_hermite_he :: Ptr CFmpzPoly -> CULong -> IO ()

-- Fibonacci polynomials -------------------------------------------------------

-- | /_fmpz_poly_fibonacci/ /coeffs/ /n/ 
-- 
-- Sets @coeffs@ to the coefficient array of the \(n\)-th Fibonacci
-- polynomial. The coefficients are calculated using a hypergeometric
-- recurrence.
foreign import ccall "fmpz_poly.h _fmpz_poly_fibonacci"
  _fmpz_poly_fibonacci :: Ptr CFmpz -> CULong -> IO ()

-- | /fmpz_poly_fibonacci/ /poly/ /n/ 
-- 
-- Sets @poly@ to the \(n\)-th Fibonacci polynomial. The coefficients are
-- calculated using a hypergeometric recurrence.
foreign import ccall "fmpz_poly.h fmpz_poly_fibonacci"
  fmpz_poly_fibonacci :: Ptr CFmpzPoly -> CULong -> IO ()

-- THIS DOES NOT SEEM TO EXIST IN THE ACTUAL IMPLEMENTATION --------------------

-- -- Eulerian numbers and polynomials --------------------------------------------

-- -- Eulerian numbers are the coefficients to the Eulerian polynomials
-- --
-- -- \[`\]
-- -- \[A_n(x) = \sum_{m = 0}^{n} A(n, m) x^m,\]
-- --
-- -- where the Eulerian polynomials are defined by the exponential generating
-- -- function
-- --
-- -- \[`\]
-- -- \[\frac{x - 1}{x - e^{(x - 1) t}}
-- -- = \sum_{n = 0}^{\infty} A_n(x) \frac{t^n}{n!}.\]
-- --
-- -- The Eulerian numbers can be expressed explicitly via the formula ..
-- -- math::\` A(n, m) = s< um>{k = 0}^{m + 1} (-1)^k binom{n + 1}{k} (m + 1 -
-- -- k)^n.
-- --
-- -- Note: Not to be confused with Euler numbers and polynomials.
-- --
-- -- | /arith_eulerian_polynomial/ /res/ /n/ 
-- -- 
-- -- Sets @res@ to the Eulerian polynomial \(A_n(x)\), where we define
-- -- \(A_0(x) = 1\). The polynomial is calculated via a recursive relation.
-- foreign import ccall "fmpz_poly.h arith_eulerian_polynomial"
--   arith_eulerian_polynomial :: Ptr CFmpzPoly -> CULong -> IO ()

-- Modular forms and q-series --------------------------------------------------

-- | /_fmpz_poly_eta_qexp/ /f/ /r/ /len/ 
-- 
-- Sets \(f\) to the \(q\)-expansion to length \(n\) of the Dedekind eta
-- function (without the leading factor \(q^{1/24}\)) raised to the power
-- \(r\), i.e.
-- \((q^{-1/24} \eta(q))^r = \prod_{k=1}^{\infty} (1 - q^k)^r\).
-- 
-- In particular, \(r = -1\) gives the generating function of the partition
-- function \(p(k)\), and \(r = 24\) gives, after multiplication by \(q\),
-- the modular discriminant \(\Delta(q)\) which generates the Ramanujan tau
-- function \(\tau(k)\).
-- 
-- This function uses sparse formulas for \(r = 1, 2, 3, 4, 6\) and
-- otherwise reduces to one of those cases using power series arithmetic.
foreign import ccall "fmpz_poly.h _fmpz_poly_eta_qexp"
  _fmpz_poly_eta_qexp :: Ptr CFmpz -> CLong -> CLong -> IO ()

-- | /_fmpz_poly_theta_qexp/ /f/ /r/ /len/ 
-- 
-- Sets \(f\) to the \(q\)-expansion to length \(n\) of the Jacobi theta
-- function raised to the power \(r\), i.e. \(\vartheta(q)^r\) where
-- \(\vartheta(q) = 1 + 2 \sum_{k=1}^{\infty} q^{k^2}\).
-- 
-- This function uses sparse formulas for \(r = 1, 2\) and otherwise
-- reduces to those cases using power series arithmetic.
foreign import ccall "fmpz_poly.h _fmpz_poly_theta_qexp"
  _fmpz_poly_theta_qexp :: Ptr CFmpz -> CLong -> CLong -> IO ()

-- CLD bounds ------------------------------------------------------------------

-- | /fmpz_poly_CLD_bound/ /res/ /f/ /n/ 
-- 
-- Compute a bound on the \(n\) coefficient of \(fg'/g\) where \(g\) is any
-- factor of \(f\).
foreign import ccall "fmpz_poly.h fmpz_poly_CLD_bound"
  fmpz_poly_CLD_bound :: Ptr CFmpz -> Ptr CFmpzPoly -> CLong -> IO ()
