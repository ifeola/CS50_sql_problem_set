CREATE TABLE passangers(
	id INTEGER,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	age INTEGER,
	PRIMARY KEY(id)
);

CREATE TABLE checkins(
	passanger_id INTEGER,
	flight_id INTEGER,
	createdAt DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY(passanger_id) REFERENCES "passangers"("id"),
	FOREIGN KEY(flight_id) REFERENCES "flights"("id")
);

CREATE TABLE airlines(
	id INTEGER,
	name TEXT NOT NULL,
	concourse TEXT NOT NULL CHECK(concourse IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
	PRIMARY KEY(id)
);

CREATE TABLE flights(
	id INTEGER,
	flight_number INTEGER NOT NULL,
	airline_id INTEGER,
	departed_code TEXT NOT NULL,
	heading_code TEXT NOT NULL,
	departure NUMERIC NOT NULL,
	arrival NUMERIC NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(airline_id) REFERENCES airlines(id)
);