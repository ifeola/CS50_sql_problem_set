SELECT "teams"."name" FROM "teams"
WHERE "teams"."id" IN (
	SELECT "team_id" FROM "performances"
	WHERE "player_id" = (
		SELECT "id" FROM "players"
		WHERE "first_name" = 'Satchel'
		AND "last_name" = 'Paige'
	)
);

/* SELECT "teams"."name" FROM "teams"
JOIN "salaries", "players"
WHERE "teams"."id" = "salaries"."team_id"
AND "salaries"."player_id" = (
	SELECT "id" FROM "players"
	WHERE "first_name" = 'Satchel'
	AND "last_name" = 'Paige'
); */