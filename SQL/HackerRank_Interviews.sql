-- https://www.hackerrank.com/challenges/interviews/problem

-- Given tables of stats on challenges, notice that as it joins to challenges table duplicates are created
-- Not all challenges will have both the submission stats and view stats so it was important to handle the nulls
-- JOIN was used since there is supposed to be 1-1 with contest to college

-- CREATE EXAMPLE
CREATE TABLE contests
  (
     contest_id INT,hacker_id INT,NAME VARCHAR(200)
  );

INSERT INTO contests
            (contest_id,hacker_id,NAME)
VALUES      (66406,17973,"rose"),
            (66556,79153,"angela"),
            (94828,80275,"frank");

CREATE TABLE colleges
  (
     college_id INT,contest_id INT
  );

INSERT INTO colleges
            (college_id,contest_id)
VALUES      (11219,66406),
            (32473,66556),
            (56685,94828);

CREATE TABLE challenges
  (
     challenge_id INT,college_id INT
  );

INSERT INTO challenges
            (challenge_id,college_id)
VALUES      (18765,11219),
            (47127,11219),
            (60292,32473),
            (72974,56685);

CREATE TABLE view_stats
  (
     challenge_id INT,total_views INT,total_unique_views INT
  );

INSERT INTO view_stats
            (challenge_id,total_views,total_unique_views)
VALUES      (47127,26,19),
            (47127,15,14),
            (18765,43,10),
            (18765,72,13),
            (75516,35,17),
            (60292,11,10),
            (72974,41,15),
            (75516,75,11);

CREATE TABLE submission_stats
  (
     challenge_id INT,total_submissions INT,total_accepted_submissions INT
  );

INSERT INTO submission_stats
            (challenge_id,total_submissions,total_accepted_submissions)
VALUES      (75516,34,12),
            (47127,27,10),
            (47127,56,18),
            (75516,74,12),
            (75516,83,8),
            (72974,68,24),
            (72974,82,14),
            (47127,28,11);


-- SOLUTION
SELECT C.contest_id,C.hacker_id,C.NAME,Sum(COALESCE(total_submissions, 0))
                                       total_submissions,
       Sum(COALESCE(total_accepted_submissions, 0)) total_accepted_submissions,
       Sum(COALESCE(total_views, 0)) total_views,Sum(
       COALESCE(total_unique_views, 0)) total_unique_views
FROM   contests C
       JOIN colleges K
         ON C.contest_id = K.contest_id
       LEFT JOIN challenges G
              ON K.college_id = G.college_id
       LEFT JOIN (SELECT
                                             challenge_id,Sum(total_views)
                                                          total_views,
                                                       Sum(total_unique_views)
                                                       total_unique_views
                  FROM   view_stats
                  GROUP  BY challenge_id) V
              ON G.challenge_id = V.challenge_id
       LEFT JOIN (SELECT challenge_id,Sum(total_submissions) total_submissions,
                         Sum(
                 total_accepted_submissions
                 )
                 total_accepted_submissions
                 FROM   submission_stats
                 GROUP  BY challenge_id) S
              ON G.challenge_id = S.challenge_id
GROUP  BY C.contest_id,C.hacker_id,C.NAME
HAVING Sum(total_accepted_submissions)
       + Sum(total_submissions)
       + Sum(total_unique_views) + Sum(total_views) > 0;