SELECT p.first_name, p.last_name
FROM players p
WHERE p.id IN (
	SELECT player_id FROM (
		SELECT s.player_id
		FROM salaries s
		JOIN performances pe
		ON s.player_id = pe.player_id
		WHERE s.year = 2001 AND pe.year = 2001
		GROUP BY s.player_id
		HAVING SUM(pe.H) > 0
		ORDER BY SUM(s.salary) / SUM(pe.H)
		LIMIT 10
	)
	INTERSECT
	SELECT player_id FROM (
		SELECT s.player_id 
		FROM salaries s
		JOIN performances pe
		ON s.player_id = pe.player_id
		WHERE s.year = 2001 AND pe.year = 2001
		GROUP BY s.player_id
		HAVING SUM(pe.RBI) > 0
		ORDER BY SUM(s.salary) / SUM(pe.RBI)
		LIMIT 10
	)
)
ORDER BY p.last_name;






/* SELECT "players"."first_name", "players"."last_name" FROM "players" WHERE "players"."id" IN (
	SELECT "players"."id"
	FROM "players"
	JOIN "salaries"
		ON "players"."id" = "salaries"."player_id"
	JOIN "performances"
		ON "players"."id" = "performances"."player_id"
	WHERE "salaries"."year" = 2001
		AND "performances"."year" = 2001
	GROUP BY "players"."id"
	HAVING SUM("performances"."H") > 0
	ORDER BY 
		(SUM("salaries"."salary") / SUM("performances"."H")) ASC
	LIMIT 10
) 
INTERSECT
SELECT "players"."first_name", "players"."last_name" FROM "players" WHERE "players"."id" IN (
	SELECT "players"."id"
	FROM "players"
	JOIN "salaries"
		ON "players"."id" = "salaries"."player_id"
	JOIN "performances"
		ON "players"."id" = "performances"."player_id"
	WHERE "salaries"."year" = 2001
		AND "performances"."year" = 2001
	GROUP BY "players"."id"
	HAVING SUM("performances"."RBI") > 0
	ORDER BY 
		(SUM("salaries"."salary") / SUM("performances"."RBI")) ASC
	LIMIT 10
) 
ORDER BY "players"."last_name" ASC; */



SELECT p.first_name, p.last_name
FROM players p
WHERE p.id IN (
    SELECT player_id
    FROM (
        SELECT s.player_id
        FROM salaries s
        JOIN performances pe ON s.player_id = pe.player_id
        WHERE s.year = 2001 AND pe.year = 2001
        GROUP BY s.player_id
        HAVING SUM(pe.H) > 0
        ORDER BY SUM(s.salary) / SUM(pe.H)
        LIMIT 10
    )
    INTERSECT
    SELECT player_id
    FROM (
        SELECT s.player_id
        FROM salaries s
        JOIN performances pe ON s.player_id = pe.player_id
        WHERE s.year = 2001 AND pe.year = 2001
        GROUP BY s.player_id
        HAVING SUM(pe.RBI) > 0
        ORDER BY SUM(s.salary) / SUM(pe.RBI)
        LIMIT 10
    )
)
ORDER BY p.last_name;
