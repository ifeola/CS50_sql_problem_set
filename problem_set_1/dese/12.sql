SELECT "districts"."name", "expenditures"."per_pupil_expenditure", 
"staff_evaluations"."exemplary" FROM "districts"
JOIN "expenditures", "staff_evaluations" 
WHERE "districts"."type" = 'Public School District' 
AND "districts"."id" = "expenditures"."district_id" 
AND "districts"."id" = "staff_evaluations"."district_id" 
AND "expenditures"."per_pupil_expenditure" > (
	SELECT AVG("expenditures"."per_pupil_expenditure") 
	FROM "expenditures"
) AND "staff_evaluations"."exemplary" > (
	SELECT AVG("staff_evaluations"."exemplary") 
	FROM "staff_evaluations"
) ORDER BY "staff_evaluations"."exemplary" DESC,
"expenditures"."per_pupil_expenditure" DESC;