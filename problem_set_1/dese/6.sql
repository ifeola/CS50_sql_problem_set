SELECT "name" FROM "schools"
JOIN "graduation_rates" WHERE "schools"."id" = "graduation_rates"."school_id" AND "graduated" = 100;
