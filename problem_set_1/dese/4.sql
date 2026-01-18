SELECT "city", COUNT("name") AS 'number of public schools' FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "district_id"
ORDER BY "number of public schools" DESC, "city" ASC
LIMIT 10;