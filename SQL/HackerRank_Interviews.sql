SELECT
    Contests.contest_id,
    Contests.hacker_id,
    Contests.name,
    SUM(Submission_Stats.total_submissions),
    SUM(Submission_Stats.total_accepted_submissions),
    SUM(View_Stats.total_views),
    SUM(View_Stats.total_unique_views)
FROM Contests
JOIN Colleges ON Contests.contest_id = Colleges.contest_id
JOIN Challenges ON Colleges.college_id = Challenges.college_id
LEFT JOIN View_Stats ON Challenges.challenge_id = View_Stats.challenge_id
LEFT JOIN Submission_Stats ON Challenges.challenge_id = Submission_Stats.challenge_id
GROUP BY Contests.contest_id, Contests.hacker_id, Contests.name
HAVING SUM(Submission_Stats.total_submissions) != 0 OR SUM(Submission_Stats.total_accepted_submissions) != 0 OR SUM(View_Stats.total_views) != 0 OR SUM(View_Stats.total_unique_views) != 0
ORDER BY Contests.contest_id;
