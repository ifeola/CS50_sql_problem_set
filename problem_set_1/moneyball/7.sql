/* SELECT "players"."first_name", "players"."last_name", SUM("salaries"."salary") 
AS "salary" FROM "salaries"
JOIN "players"
WHERE "players"."id" = "salaries"."player_id"
GROUP BY "salaries"."player_id"
ORDER BY "salaries"."salary" DESC;
 */

SELECT "players"."first_name", "players"."last_name" FROM "salaries"
JOIN "players"
WHERE "players"."id" = "salaries"."player_id"
ORDER BY "salaries"."salary" DESC
LIMIT 1;