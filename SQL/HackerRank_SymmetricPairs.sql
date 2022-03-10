-- https://www.hackerrank.com/challenges/symmetric-pairs/problem

-- Given a table of tuples (X1, Y1), (X2, Y2), ..., (Xn, Yn)
-- Symmetric pair --> Xi = Yj AND Yi = Xj
-- Also include --> Xi < Yi
-- Need to self join to find the combinations of (Xi, Yi) to (Xj, Yj)
-- Note due to self join, need to condition on the fact that there is (Xi, Yi) to (Xi, Yi)

SELECT A.X, A.Y
FROM Functions A, Functions B
WHERE A.X = B.Y AND B.X = A.Y
GROUP BY A.x, A.y  -- Using group by for using having only
HAVING COUNT(A.x) > 1 OR A.x < A.y -- If it's not only matched to itself then it should have more than 1
ORDER BY A.X, A.Y