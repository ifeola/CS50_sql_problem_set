SELECT "districts"."name" FROM "expenditures"
JOIN "districts" 
WHERE "districts"."id" = "expenditures"."district_id"
ORDER BY "expenditures"."pupils" ASC
LIMIT 1;