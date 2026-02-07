SELECT "players"."first_name", "players"."last_name", "salaries"."salary", "performances"."HR", "salaries"."year"
FROM "players"
JOIN "salaries", "performances"
WHERE "players"."id" = "salaries"."player_id"
AND "players"."id" = "performances"."player_id"
AND "salaries"."year" = "performances"."year"
ORDER BY "players"."id" ASC, "salaries"."year" DESC, "performances"."HR" DESC, "salaries"."salary" DESC;