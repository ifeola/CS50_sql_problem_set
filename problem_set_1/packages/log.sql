
-- *** The Lost Letter ***
SELECT "address", "type" FROM "addresses"
WHERE "id" = (
	SELECT "address_id" FROM "scans"
	WHERE "action" = 'Drop' and "package_id" IN (
		SELECT "id" FROM "packages"
		WHERE "from_address_id" = (
			SELECT "id" FROM "addresses"
			WHERE "address" = '900 Somerville Avenue'
		) AND "contents" LIKE '%Congratulatory%'
	)
);

-- SELECT * FROM "scans"
-- WHERE "action" = 'Drop' and "package_id" IN (
-- 	SELECT "id" FROM "packages"
-- 	WHERE "from_address_id" = (
-- 		SELECT "id" FROM "addresses"
-- 		WHERE "address" = '900 Somerville Avenue'
-- 	) AND "contents" LIKE '%Congratulatory%'
-- );

-- SELECT * FROM "packages"
-- WHERE "from_address_id" = (
-- 	SELECT "id" FROM "addresses"
-- 	WHERE "address" = '900 Somerville Avenue'
-- ) AND "contents" LIKE '%Congratulatory%';

-- SELECT * FROM "addresses"
-- WHERE "address" = '900 Somerville Avenue';

-- *** The Devious Delivery ***
SELECT * FROM "addresses"
WHERE "id" = (
	SELECT "address_id" FROM "scans"
	WHERE "package_id" = (
		SELECT "id" FROM "packages"
		WHERE "contents" Like '%Duck%' AND "from_address_id" IS NULL
	) AND "action" = 'Drop'
);

SELECT  * FROM "packages"
WHERE "contents" Like '%Duck%' AND "from_address_id" IS NULL;

-- *** The Forgotten Gift ***

SELECT * FROM "drivers"
WHERE "id" = (
	SELECT "driver_id" FROM "scans"
	WHERE "package_id" = (
		SELECT "id" FROM "packages"
		WHERE "from_address_id" = (
			SELECT "id" FROM "addresses"
			WHERE "address" = '109 Tileston Street'
		)
	) ORDER BY "timestamp" DESC LIMIT 1
);