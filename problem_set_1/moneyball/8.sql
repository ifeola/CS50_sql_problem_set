SELECT "salaries"."salary" FROM "performances"
JOIN "players", "salaries"
WHERE "players"."id" = "performances"."player_id"
AND "salaries"."year" = 2001
AND "performances"."player_id" = "salaries"."player_id"
ORDER BY "performances"."HR" DESC
LIMIT 1;