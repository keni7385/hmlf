-- Linear Regression module
module LinearReg where

-- | Dot product for lists of Doubles, used as hypothesis for linear regressions
dotProduct :: [Double] -> [Double] -> Double
dotProduct ds ds' = sum $ prdLists ds ds'

-- | Sum of two lists
sumLists xs ys = zipWith (+) xs ys

-- | Difference of two lists
difLists xs ys = zipWith (-) xs ys

-- | Product of two lists
prdLists xs ys = zipWith (*) xs ys

costDerivative :: ([Double] -> Double) -- ^ The hypothesis function
               -> [[Double]]           -- ^ Records of training examples
               -> [Double]             -- ^ y TODO: name this
               -> [Double]             -- ^ List of derivatives TODO: name this
costDerivative h xss y = let m = length xss
                             magicV = difLists (map h xss) y
                         in
                           map (\der -> der / (fromIntegral m)) $
                           foldl sumLists (replicate m 0.0) $
                           map (prdLists magicV) xss

