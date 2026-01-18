SELECT "districts"."name", "expenditures"."per_pupil_expenditure" FROM "expenditures"
JOIN "districts" WHERE "districts"."id" = "expenditures"."district_id" AND "districts"."type" = 'Public School District'
ORDER BY "expenditures"."per_pupil_expenditure" DESC
LIMIT 10;