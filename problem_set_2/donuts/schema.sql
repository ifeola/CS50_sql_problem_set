CREATE TABLE ingredients(
	id INTEGER,
	ingredient TEXT NOT NULL,
	unit TEXT NOT NULL,
	price_per_unit REAL NOT NULL CHECK(price_per_unit > 0),
	PRIMARY KEY(id)
);

-- ===================================
-- DONUT INGREDIENTS (junction table)
-- ===================================
CREATE TABLE donut_ingredients (
    donut_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    quantity REAL NOT NULL,           -- amount of ingredient used

    PRIMARY KEY (donut_id, ingredient_id),
    FOREIGN KEY (donut_id) REFERENCES donuts(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
);

CREATE TABLE donuts(
	id INTEGER,
	name TEXT NOT NULL,
	gluten_free NUMERIC NOT NULL CHECK(gluten_free IN (0, 1)),
	price REAL NOT NULL
	PRIMARY KEY(id)
);

CREATE TABLE orders(
	id INTEGER,
	customer_id INTEGER NOT NULL,
	order_date NUMERIC DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY(customer_id) REFERENCES "customers"("id") ON DELETE CASCADE
);

CREATE TABLE customers(
	id INTEGER,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	FOREIGN KEY(order_id) REFERENCES "order"("id") ON DELETE CASCADE
);

-- =============================
-- ORDER DONUT (junction table)
-- =============================
CREATE TABLE order_donuts(
	customer_id INTEGER,
	order_id INTEGER,
	quantity INTEGER NOT NULL CHECK (quantity > 0),

	PRIMARY KEY(customer_id, order_id),
	FOREIGN KEY(order_id) REFERENCES "orders"("id") ON DELETE CASCADE,
	FOREIGN KEY(customer_id) REFERENCES "customers"("id") ON DELETE CASCADE
)
