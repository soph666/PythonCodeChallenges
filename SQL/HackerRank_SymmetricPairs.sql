-- https://www.hackerrank.com/challenges/symmetric-pairs/problem

-- Given a table of tuples (X1, Y1), (X2, Y2), ..., (Xn, Yn)
-- Symmetric pair --> Xi = Yj AND Yi = Xj
-- Also include --> Xi < Yi
-- Need to self join to find the combinations of (Xi, Yi) to (Xj, Yj)
-- Note due to self join, need to condition on the fact that there is (Xi, Yi) to (Xi, Yi)

-- CREATE SAMPLE
CREATE TABLE Functions
  (
     x INT,y INT
  );
INSERT INTO Functions
VALUES      (20,20),
            (20,20),
            (20,21),
            (23,22),
            (22,23),
            (21,20);

-- SOLUTION
SELECT A.x,
       A.y
FROM   functions A,
       functions B
WHERE  A.x = B.y
       AND B.x = A.y
GROUP  BY A.x,
          A.y -- Using group by for using having only
HAVING Count(A.x) > 1
        OR A.x < A.y
-- If it's not only matched to itself then it should have more than 1
ORDER  BY A.x,
          A.y