
-- Linear Regression module
module LinearReg where

-- |Dot product for lists of Doubles, used as hypothesis for linear regressions
dotProduct :: [Double] -> [Double] -> Double
dotProduct ds ds' = sum $ prdLists ds ds'

-- |Sum of two lists
sumLists xs ys = zipWith (+) xs ys

-- |Difference of two lists
difLists xs ys = zipWith (-) xs ys

-- |Product of two lists
prdLists xs ys = zipWith (*) xs ys

costDerivative :: ([Double] -> Double) -- ^ The hypothesis function
               -> [[Double]]           -- ^ Records of training examples
               -> [Double]             -- ^ y TODO: name this
               -> [Double]             -- ^ List of derivatives TODO: name this
costDerivative h xss ys = let m = length xss
                              magicV = difLists (map h xss) ys
                          in
                            map (\der -> der / (fromIntegral m)) $
                            foldl sumLists (replicate m 0.0) $
                            map (prdLists magicV) xss

-- |(Multi)linear regression training function
-- Compute the hypothesis coefficient using gradient descent. The xss parameter must be a list of lists, where the i-th list represents the value of i-th feauture for every dataset record.
updateHypCoeff :: Integer    -- ^ Number of iterations
               -> [Double]   -- ^ Actual hypothesis coefficients
               -> Double     -- ^ Learning rate
               -> [[Double]] -- ^ Records of training examples
               -> [Double]   -- ^ y TODO: name this
               -> [Double]   -- ^ updated hypothesis coefficients
updateHypCoeff niter thetas alpha xss ys
  | niter > 0 = updateHypCoeff (niter-1) thetas' alpha xss ys
  | otherwise = thetas
  where
    thetas' = zipWith (\a b -> a - alpha * b) thetas $
              costDerivative (dotProduct thetas) xss ys


