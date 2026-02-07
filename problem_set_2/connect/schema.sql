CREATE TABLE users(
	id INTEGER,
	username TEXT NOT NULL UNIQUE,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	user_password TEXT NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE schools(
	id INTEGER,
	school_name TEXT NOT NULL,
	school_type TEXT NOT NULL,
	school_location TEXT NOT NULL,
	year_founded INTEGER NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE companies(
	id INTEGER,
	company_name TEXT NOT NULL,
	company_industry TEXT NOT NULL,
	company_location TEXT NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE connections_with_people(
	user_id INTEGER NOT NULL,
    connected_user_id INTEGER NOT NULL,
    connected_at DATE DEFAULT CURRENT_DATE,

	PRIMARY KEY(user_id, connected_user_id),

	FOREIGN KEY(user_id) REFERENCES "users"("id") ON DELETE CASCADE,
	FOREIGN KEY(connected_user_id) REFERENCES "users"("id") ON DELETE CASCADE,

	CHECK (user_id <> connected_user_id)
);

CREATE TABLE connections_with_schools(
	id INTEGER,
	user_id INTEGER,
	school_id INTEGER,
	start_date DATE NOT NULL,
	end_date DATE,
	type_of_degree TEXT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(user_id) REFERENCES "users"("id") ON DELETE CASCADE,
	FOREIGN KEY(school_id) REFERENCES "schools"("id") ON DELETE CASCADE
);

CREATE TABLE connections_with_companies(
	id INTEGER,
	user_id INTEGER,
	company_id INTEGER,
	start_date DATE NOT NULL,
	end_date DATE,
	job_title TEXT NOT NULL,

	PRIMARY KEY(id),
	FOREIGN KEY(user_id) REFERENCES "users"("id") ON DELETE CASCADE,
	FOREIGN KEY(company_id) REFERENCES "companies"("id") ON DELETE CASCADE
);