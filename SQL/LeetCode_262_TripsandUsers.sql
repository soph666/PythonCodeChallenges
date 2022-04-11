SELECT
T.request_at AS "Day",
ROUND(SUM(CASE WHEN T.status != 'completed' THEN 1 ELSE 0 END)/COUNT(T.request_at), 2) AS "Cancellation Rate"
FROM Trips T LEFT JOIN Users U1 ON T.client_id = U1.users_id
LEFT JOIN Users U2 ON T.driver_id = U2.users_id
WHERE U1.banned = 'No' AND U2.banned = 'No' AND T.request_at between '2013-10-01' and '2013-10-03'
GROUP BY T.request_at