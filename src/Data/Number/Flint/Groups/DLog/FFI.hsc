module Data.Number.Flint.Groups.DLog.FFI (
  -- * Discrete logarithms mod ulong primes
  -- * Single evaluation
    dlog_once
  -- * Precomputations
  , DLogPrecomp (..)
  , CDLogPrecomp (..)
  -- *
  , dlog_precomp_n_init
  , dlog_precomp
  , dlog_precomp_clear
  , dlog_precomp_modpe_init
  , dlog_precomp_p_init
  , dlog_precomp_pe_init
  , dlog_precomp_small_init
  -- * Vector evaluations
  , dlog_vec_fill
  , dlog_vec_set_not_found
  , dlog_vec
  , dlog_vec_add
  , dlog_vec_loop
  , dlog_vec_loop_add
  , dlog_vec_eratos
  , dlog_vec_eratos_add
  , dlog_vec_sieve_add
  , dlog_vec_sieve
  -- * Internal discrete logarithm strategies
  -- * Complete table
  , DLogTable (..)
  , CDLogTable (..)
  , dlog_table_init
  , dlog_table_clear
  , dlog_table
  -- * Baby-step giant-step table
  , DLogBSGS (..)
  , CDLogBSGS (..)
  , dlog_bsgs_init
  , dlog_bsgs_clear
  , dlog_bsgs
  -- * Prime-power modulus decomposition
  , DLogModpe (..)
  , CDLogModpe (..)
  , dlog_modpe_init
  , dlog_modpe_clear
  , dlog_modpe
  -- * CRT decomposition
  , DLogCRT (..)
  , CDLogCRT (..)
  , dlog_crt_init
  , dlog_crt_clear
  , dlog_crt
  -- * padic decomposition
  , DLogPower (..)
  , CDLogPower (..)
  , dlog_power_init
  , dlog_power_clear
  , dlog_power
  -- * Pollard rho method
  , DLogRho (..)
  , CDLogRho (..)
  , dlog_rho_init
  , dlog_rho_clear
  , dlog_rho
  
) where

-- Discrete logarithms mod ulong primes ----------------------------------------

import Foreign.Ptr
import Foreign.ForeignPtr
import Foreign.C.Types
import Foreign.Storable

import Data.Number.Flint.Flint
import Data.Number.Flint.NMod

#define DLOG_INLINES_C
#include <flint/dlog.h>

-- Single evaluation -----------------------------------------------------------

-- | /dlog_once/ /b/ /a/ /mod/ /n/ 
--
-- Return \(x\) such that \(b = a^x\) in
-- \((\mathbb Z/mod \mathbb Z)^\times\), where /a/ is known to have order
-- /n/.
foreign import ccall "dlog.h dlog_once"
  dlog_once :: CULong -> CULong -> Ptr CNMod -> CULong -> IO CULong

-- Precomputations -------------------------------------------------------------

data DLogPrecomp = DLogPrecomp {-# UNPACK #-} !(ForeignPtr CDLogPrecomp)
type CDLogPrecomp = CFlint DLogPrecomp

-- | /dlog_precomp_n_init/ /pre/ /a/ /mod/ /n/ /num/ 
--
-- Precompute data for /num/ discrete logarithms evaluations in the
-- subgroup generated by /a/ modulo /mod/, where /a/ is known to have order
-- /n/.
foreign import ccall "dlog.h dlog_precomp_n_init"
  dlog_precomp_n_init :: Ptr CDLogPrecomp -> CULong -> CULong -> CULong -> CULong -> IO ()

-- | /dlog_precomp/ /pre/ /b/ 
--
-- Return \(\log(b)\) for the group described in /pre/.
foreign import ccall "dlog.h dlog_precomp"
  dlog_precomp :: Ptr CDLogPrecomp -> CULong -> IO CULong

-- | /dlog_precomp_clear/ /pre/ 
--
-- Clears /t/.
foreign import ccall "dlog.h dlog_precomp_clear"
  dlog_precomp_clear :: Ptr CDLogPrecomp -> IO ()

-- Specialized versions of @dlog_precomp_n_init@ are available when
-- specific information is known about the group:
--
-- | /dlog_precomp_modpe_init/ /pre/ /a/ /p/ /e/ /pe/ /num/ 
--
-- Assume that /a/ generates the group of residues modulo /pe/ equal
-- \(p^e\) for prime /p/.
foreign import ccall "dlog.h dlog_precomp_modpe_init"
  dlog_precomp_modpe_init :: Ptr CDLogPrecomp -> CULong -> CULong -> CULong -> CULong -> CULong -> IO ()

-- | /dlog_precomp_p_init/ /pre/ /a/ /mod/ /p/ /num/ 
--
-- Assume that /a/ has prime order /p/.
foreign import ccall "dlog.h dlog_precomp_p_init"
  dlog_precomp_p_init :: Ptr CDLogPrecomp -> CULong -> CULong -> CULong -> CULong -> IO ()

-- | /dlog_precomp_pe_init/ /pre/ /a/ /mod/ /p/ /e/ /pe/ /num/ 
--
-- Assume that /a/ has primepower order /pe/ \(p^e\).
foreign import ccall "dlog.h dlog_precomp_pe_init"
  dlog_precomp_pe_init :: Ptr CDLogPrecomp -> CULong -> CULong -> CULong -> CULong -> CULong -> CULong -> IO ()

-- | /dlog_precomp_small_init/ /pre/ /a/ /mod/ /n/ /num/ 
--
-- Make a complete lookup table of size /n/. If /mod/ is small, this is
-- done using an element-indexed array (see @dlog_table_t@), otherwise with
-- a sorted array allowing binary search.
foreign import ccall "dlog.h dlog_precomp_small_init"
  dlog_precomp_small_init :: Ptr CDLogPrecomp -> CULong -> CULong -> CULong -> CULong -> IO ()

-- Vector evaluations ----------------------------------------------------------

-- These functions compute all logarithms of successive integers
-- \(1\dots n\).
--
-- | /dlog_vec_fill/ /v/ /nv/ /x/ 
--
-- Sets values /v[k]/ to /x/ for all /k/ less than /nv/.
foreign import ccall "dlog.h dlog_vec_fill"
  dlog_vec_fill :: Ptr CULong -> CULong -> CULong -> IO ()

-- | /dlog_vec_set_not_found/ /v/ /nv/ /mod/ 
--
-- Sets values /v[k]/ to @DLOG_NONE@ for all /k/ not coprime to /mod/.
foreign import ccall "dlog.h dlog_vec_set_not_found"
  dlog_vec_set_not_found :: Ptr CULong -> CULong -> Ptr CNMod -> IO ()

-- | /dlog_vec/ /v/ /nv/ /a/ /va/ /mod/ /na/ /order/ 
--
-- Sets /v[k]/ to \(\log(k,a)\) times value /va/ for \(0\leq k < nv\),
-- where /a/ has order /na/. /va/ should be /1/ for usual log computation.
foreign import ccall "dlog.h dlog_vec"
  dlog_vec :: Ptr CULong -> CULong -> CULong -> CULong -> Ptr CNMod -> CULong -> Ptr CNMod -> IO ()

-- | /dlog_vec_add/ /v/ /nv/ /a/ /va/ /mod/ /na/ /order/ 
--
-- Same parameters as before, but adds \(\log(k,a)\times v_a\) to /v[k]/
-- and reduce modulo /order/ instead of replacing the value. Indices /k/
-- such that /v[k]/ equals /DLOG_NONE/ are ignored.
foreign import ccall "dlog.h dlog_vec_add"
  dlog_vec_add :: Ptr CULong -> CULong -> CULong -> CULong -> Ptr CNMod -> CULong -> Ptr CNMod -> IO ()

-- Depending on the relative size of /nv/ and /na/, these two /dlog_vec/
-- functions call one of the following functions.
--
-- | /dlog_vec_loop/ /v/ /nv/ /a/ /va/ /mod/ /na/ /order/ 
--
foreign import ccall "dlog.h dlog_vec_loop"
  dlog_vec_loop :: Ptr CULong -> CULong -> CULong -> CULong -> Ptr CNMod -> CULong -> Ptr CNMod -> IO ()

-- | /dlog_vec_loop_add/ /v/ /nv/ /a/ /va/ /mod/ /na/ /order/ 
--
-- Perform a complete loop of size /na/ on powers of /a/ to fill the
-- logarithm values, discarding powers outside the bounds of /v/. This
-- requires no discrete logarithm computation.
foreign import ccall "dlog.h dlog_vec_loop_add"
  dlog_vec_loop_add :: Ptr CULong -> CULong -> CULong -> CULong -> Ptr CNMod -> CULong -> Ptr CNMod -> IO ()

-- | /dlog_vec_eratos/ /v/ /nv/ /a/ /va/ /mod/ /na/ /order/ 
--
foreign import ccall "dlog.h dlog_vec_eratos"
  dlog_vec_eratos :: Ptr CULong -> CULong -> CULong -> CULong -> Ptr CNMod -> CULong -> Ptr CNMod -> IO ()

-- | /dlog_vec_eratos_add/ /v/ /nv/ /a/ /va/ /mod/ /na/ /order/ 
--
-- Compute discrete logarithms of prime numbers less than /nv/ and
-- propagate to composite numbers.
foreign import ccall "dlog.h dlog_vec_eratos_add"
  dlog_vec_eratos_add :: Ptr CULong -> CULong -> CULong -> CULong -> Ptr CNMod -> CULong -> Ptr CNMod -> IO ()

-- | /dlog_vec_sieve_add/ /v/ /nv/ /a/ /va/ /mod/ /na/ /order/ 
--
foreign import ccall "dlog.h dlog_vec_sieve_add"
  dlog_vec_sieve_add :: Ptr CULong -> CULong -> CULong -> CULong -> Ptr CNMod -> CULong -> Ptr CNMod -> IO ()

-- | /dlog_vec_sieve/ /v/ /nv/ /a/ /va/ /mod/ /na/ /order/ 
--
-- Compute the discrete logarithms of the first few prime numbers, then use
-- them as a factor base to obtain the logarithms of larger primes by
-- sieving techniques.
-- 
-- In the the present implementation, the full index-calculus method is not
-- implemented.
foreign import ccall "dlog.h dlog_vec_sieve"
  dlog_vec_sieve :: Ptr CULong -> CULong -> CULong -> CULong -> Ptr CNMod -> CULong -> Ptr CNMod -> IO ()

-- Internal discrete logarithm strategies --------------------------------------


foreign import ccall "flint.h flint_free"
  flint_free :: Ptr () -> IO ()
  
-- Complete table --------------------------------------------------------------

data DLogTable = DLogTable {-# UNPACK #-} !(ForeignPtr CDLogTable)
data CDLogTable = CDLogTable CULong (Ptr CULong)

instance Storable CDLogTable where
  sizeOf _ = #{size dlog_table_t}
  alignment _ = #{alignment dlog_table_t}
  peek ptr = CDLogTable
    <$> #{peek dlog_table_struct, mod  } ptr
    <*> #{peek dlog_table_struct, table} ptr
  poke = undefined

-- | /dlog_table_init/ /t/ /a/ /mod/ 
--
-- Initialize a table of powers of /a/ modulo /mod/, storing all elements
-- in an array of size /mod/.
foreign import ccall "dlog.h dlog_table_init"
  dlog_table_init :: Ptr CDLogTable -> CULong -> CULong -> IO CULong

-- | /dlog_table_clear/ /t/ 
--
-- Clears /t/.
dlog_table_clear :: Ptr CDLogTable -> IO ()
dlog_table_clear x = do
  CDLogTable mod table <- peek x
  flint_free $ castPtr table
  
-- | /dlog_table/ /t/ /b/ 
--
-- Return \(\log(b,a)\) using the precomputed data /t/.
foreign import ccall "dlog.h dlog_table"
  dlog_table :: Ptr CDLogTable -> CULong -> IO CULong

-- Baby-step giant-step table --------------------------------------------------

data CAPow = CAPow CULong CULong

data DLogBSGS = DLogBSGS {-# UNPACK #-} !(ForeignPtr CDLogBSGS)
data CDLogBSGS = CDLogBSGS (Ptr CNMod) CULong CULong CULong (Ptr CAPow)

instance Storable CDLogBSGS where
  sizeOf    _ = #{size      dlog_bsgs_t}
  alignment _ = #{alignment dlog_bsgs_t}
  peek ptr = CDLogBSGS
    <$> #{peek dlog_bsgs_struct, mod  } ptr
    <*> #{peek dlog_bsgs_struct, m    } ptr
    <*> #{peek dlog_bsgs_struct, am   } ptr
    <*> #{peek dlog_bsgs_struct, g    } ptr
    <*> #{peek dlog_bsgs_struct, table} ptr
  poke = undefined

-- | /dlog_bsgs_init/ /t/ /a/ /mod/ /n/ /m/ 
--
-- Initialize /t/ and store the first /m/ powers of /a/ in a sorted array.
-- The return value is a rought measure of the cost of each logarithm using
-- this table. The user should take \(m\approx\sqrt{kn}\) to compute k
-- logarithms in a group of size n.
foreign import ccall "dlog.h dlog_bsgs_init"
  dlog_bsgs_init :: Ptr CDLogBSGS -> CULong -> CULong -> CULong -> CULong -> IO CULong

-- | /dlog_bsgs_clear/ /t/ 
--
-- Clears /t/.
-- foreign import ccall "dlog.h dlog_bsgs_clear"
dlog_bsgs_clear :: Ptr CDLogBSGS -> IO ()
dlog_bsgs_clear x = do
  CDLogBSGS mod m am g table <- peek x
  flint_free $ castPtr table
  
-- | /dlog_bsgs/ /t/ /b/ 
--
-- Return \(\log(b,a)\) using the precomputed data /t/.
foreign import ccall "dlog.h dlog_bsgs"
  dlog_bsgs :: Ptr CDLogBSGS -> CULong -> IO CULong

-- Prime-power modulus decomposition -------------------------------------------

data CDLog1Modpe = CDLog1Modpe CULong CULong

data DLogModpe = DLogModpe {-# UNPACK #-} !(ForeignPtr CDLogModpe)
data CDLogModpe = CDLogModpe CULong CULong CULong CULong (Ptr CNMod) (Ptr CDLogPrecomp) (Ptr CDLog1Modpe)

instance Storable CDLogModpe where
  sizeOf    _ = #{size      dlog_modpe_t}
  alignment _ = #{alignment dlog_modpe_t}
  peek ptr = CDLogModpe
    <$> #{peek dlog_modpe_struct, p    } ptr
    <*> #{peek dlog_modpe_struct, e    } ptr
    <*> #{peek dlog_modpe_struct, pe1  } ptr
    <*> #{peek dlog_modpe_struct, inva } ptr
    <*> #{peek dlog_modpe_struct, pe   } ptr
    <*> #{peek dlog_modpe_struct, modp } ptr
    <*> #{peek dlog_modpe_struct, modpe} ptr
  poke = undefined
  
-- | /dlog_modpe_init/ /t/ /a/ /p/ /e/ /pe/ /num/ 
--
foreign import ccall "dlog.h dlog_modpe_init"
  dlog_modpe_init :: Ptr CDLogModpe -> CULong -> CULong -> CULong -> CULong -> CULong -> IO CULong

-- | /dlog_modpe_clear/ /t/ 
--
-- Clears /t/.
-- foreign import ccall "dlog.h dlog_modpe_clear"
dlog_modpe_clear :: Ptr CDLogModpe -> IO ()
dlog_modpe_clear x = do
  CDLogModpe _ _ _ _ _ modp modpe <- peek x
  dlog_precomp_clear modp
  flint_free $ castPtr modp

-- | /dlog_modpe/ /t/ /b/ 
--
-- Return \(\log(b,a)\) using the precomputed data /t/.
foreign import ccall "dlog.h dlog_modpe"
  dlog_modpe :: Ptr CDLogModpe -> CULong -> IO CULong

-- CRT decomposition -----------------------------------------------------------


data DLogCRT = DLogCRT {-# UNPACK #-} !(ForeignPtr CDLogCRT)
type CDLogCRT = CFlint DLogCRT

-- | /dlog_crt_init/ /t/ /a/ /mod/ /n/ /num/ 
--
-- Precompute data for /num/ evaluations of discrete logarithms in base /a/
-- modulo /mod/, where /a/ has composite order /n/, using chinese remainder
-- decomposition.
foreign import ccall "dlog.h dlog_crt_init"
  dlog_crt_init :: Ptr CDLogCRT -> CULong -> CULong -> CULong -> CULong -> IO CULong

-- | /dlog_crt_clear/ /t/ 
--
-- Clears /t/.
foreign import ccall "dlog.h dlog_crt_clear"
  dlog_crt_clear :: Ptr CDLogCRT -> IO ()

-- | /dlog_crt/ /t/ /b/ 
--
-- Return \(\log(b,a)\) using the precomputed data /t/.
foreign import ccall "dlog.h dlog_crt"
  dlog_crt :: Ptr CDLogCRT -> CULong -> IO CULong

-- padic decomposition ---------------------------------------------------------

data DLogPower = DLogPower {-# UNPACK #-} !(ForeignPtr CDLogPower)
type CDLogPower = CFlint DLogPower

-- | /dlog_power_init/ /t/ /a/ /mod/ /p/ /e/ /num/ 
--
-- Precompute data for /num/ evaluations of discrete logarithms in base /a/
-- modulo /mod/, where /a/ has prime power order /pe/ equals \(p^e\), using
-- decomposition in base /p/.
foreign import ccall "dlog.h dlog_power_init"
  dlog_power_init :: Ptr CDLogPower -> CULong -> CULong -> CULong -> CULong -> CULong -> IO CULong

-- | /dlog_power_clear/ /t/ 
--
-- Clears /t/.
-- foreign import ccall "dlog.h dlog_power_clear"
dlog_power_clear :: Ptr CDLogPower -> IO ()
dlog_power_clear x = error "not implmented."

-- | /dlog_power/ /t/ /b/ 
--
-- Return \(\log(b,a)\) using the precomputed data /t/.
foreign import ccall "dlog.h dlog_power"
  dlog_power :: Ptr CDLogPower -> CULong -> IO CULong

-- Pollard rho method ----------------------------------------------------------

data DLogRho = DLogRho {-# UNPACK #-} !(ForeignPtr CDLogRho)
type CDLogRho = CFlint DLogRho

-- | /dlog_rho_init/ /t/ /a/ /mod/ /n/ /num/ 
--
-- Initialize random walks for evaluations of discrete logarithms in base
-- /a/ modulo /mod/, where /a/ has order /n/.
foreign import ccall "dlog.h dlog_rho_init"
  dlog_rho_init :: Ptr CDLogRho -> CULong -> CULong -> CULong -> CULong -> IO CULong

-- | /dlog_rho_clear/ /t/ 
--
-- Clears /t/.
-- foreign import ccall "dlog.h dlog_rho_clear"
dlog_rho_clear :: Ptr CDLogRho -> IO ()
dlog_rho_clear x = error "not implmented."

-- | /dlog_rho/ /t/ /b/ 
--
-- Return \(\log(b,a)\) by the rho method in the group described by /t/.
foreign import ccall "dlog.h dlog_rho"
  dlog_rho :: Ptr CDLogRho -> CULong -> IO CULong

