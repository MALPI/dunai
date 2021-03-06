{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE TypeFamilies           #-}
{-# LANGUAGE UndecidableInstances   #-}
{-# OPTIONS_GHC -fno-warn-orphans   #-}
module Data.VectorSpace.Fractional where

-- VectorSpace instances for Num/Fractional types. These sometimes clash with
-- user-defined instances.
-- (See https://github.com/ivanperez-keera/dunai/issues/11, where this
-- module used to be called Data.VectorSpace.Instances)

import Data.VectorSpace

instance Num a => RModule a where
    type Groundring a = a
    zeroVector     = 0
    a *^ x         = a * x
    negateVector x = -x
    x1 ^+^ x2      = x1 + x2
    x1 ^-^ x2      = x1 - x2

instance Fractional a => VectorSpace a where
    a ^/ x = a / x

instance Num a => InnerProductSpace a where
    x1 `dot` x2 = x1 * x2
