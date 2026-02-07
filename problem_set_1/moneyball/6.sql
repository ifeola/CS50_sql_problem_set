SELECT "teams"."name", SUM("performances"."H") AS "total hits" FROM "performances"
JOIN "teams", "players"
WHERE "performances"."team_id" = "teams"."id"
AND "players"."id" = "performances"."player_id"
AND "performances"."year" = 2001
GROUP BY "performances"."team_id"
ORDER BY "total hits" DESC
LIMIT 5;
