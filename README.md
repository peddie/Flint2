# Flint2
**Flint2** provides a thin Haskell wrapper for [Flint](https://flintlib.org) C-library. 

## Installation

As long as Flint2 is not available from Stackage (Hackage) this requires specification of
the location of Flint2 in the global stack.yaml file which might be either a local directory
or github commit. See the [stack](https://docs.haskellstack.org/en/stable/GUIDE/) documentation for details.

```bash
stack install Flint2
stack haddock Flint2
```

This will install a binary **flint_test** in **~/.local/bin** which is just shows the basic functionality of the current Flint2 wrapper.

If you just want to clone it and see the functionality use 

```bash
git clone https://github.com/monien/Flint2.git
```

then goto to the Flint2 directory and use

```bash
stack install
stack haddock
```

Have a look at the **Main.hs** in the **app** directory first and then use

```bash
stack ghci
```
for Flint2 in a haskell shell. 

## Quick Start

A simple program using the thin wrapper would be

```haskell
import Data.Number.Flint

main = do 
  x <- newFmpz
  y <- newFmpz
  withFmpz x $ \x -> do
    withFmpz y $ \y -> do
      fmpz_set_ui x 7
      fmpz_set_ui y 6
      fmpz_mul x x y
      fmpz_print x  
```

which will print the numerical value 42.

In the app directory more practical information on how to use the thin wrapper can be found. 
The above example simplifies to 

```haskell
include Fmpz

main = do
  let x = 7 :: Fmpz 
      y = 6 :: Fmpz
  print $ x*y
  print $ factor (42 :: Fmpz)
  
```

which prints 

```
42 
[(2,1),(3,1),(7,1)]
```
