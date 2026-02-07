SELECT "teams"."name", ROUND(AVG("salaries"."salary"), 2) AS 'average salary' FROM "salaries"
JOIN "teams"
WHERE "salaries"."team_id" = "teams"."id"
AND "salaries"."year" = 2001
GROUP BY "salaries"."team_id"
ORDER BY "average salary" ASC
LIMIT 5;