SELECT "schools"."name" FROM "schools"
JOIN "districts" 
WHERE "schools"."district_id" = "districts"."id" AND "districts"."name" LIKE 'Cambridge';