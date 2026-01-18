SELECT "districts"."name", "expenditures"."pupils" FROM "expenditures"
JOIN "districts" WHERE "districts"."id" = "expenditures"."district_id";