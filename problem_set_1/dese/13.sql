SELECT "schools"."name", "graduation_rates"."graduated", "expenditures"."per_pupil_expenditure" FROM "schools" 
JOIN "graduation_rates", "expenditures"
WHERE "schools"."id" = "graduation_rates"."school_id" 
AND "schools"."district_id" = "expenditures"."district_id"
ORDER BY "expenditures"."per_pupil_expenditure" DESC, "schools"."name" ASC;