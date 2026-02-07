-- SMH 😞
SELECT "players"."first_name", "players"."last_name", 
(SUM("salaries"."salary") / "performances"."H") AS 'dollars per hit'
FROM "salaries"
JOIN "players", "performances"
WHERE "players"."id" = "salaries"."player_id"
	AND "players"."id" = "performances"."player_id"
	AND "salaries"."year" = 2001
	AND "performances"."year" = 2001
GROUP BY "players"."id"
HAVING "dollars per hit" IS NOT NULL
ORDER BY "dollars per hit" ASC, 
"players"."first_name" ASC, 
"players"."last_name" ASC
LIMIT 10;

-- Good 😄
SELECT p.first_name, p.last_name, 
(SUM(s.salary) / SUM(pe.H)) AS "dollar_per_hit"
FROM players p
JOIN salaries s
	ON s.player_id = p.id 
JOIN performances pe
	ON pe.player_id = p.id
WHERE s.year = 2001 AND pe.year = 2001
GROUP BY p.id
HAVING SUM(pe.H) > 0
ORDER BY dollar_per_hit ASC,
	p.first_name ASC,
	p.last_name ASC
LIMIT 10;