-- 1. DDl work with Table like deleted, alter, drop
-- CREATE TABLE person(
    -- fullname text,
    -- age integer
    -- car boolean
-- );
-- ALTER TABLE table_name
--ADD column_name datatype;
-- DROP TAble table_name;

-- DML work with information in Table like  insert, update, delete;
-- INSERT INTO table_name (column 1, 2, 3...)
-- VALUES (1,2,3..);
-- UPDATE table_name
-- SET column 1 = value1...
-- WHERE condition;

--DELETE FROM table_name WHere condition;


-- 2.
CREATE TABLE cusstomers(
    id integer primary key,
    full_name varchar(50) not null,
    timestamp timestamp not null,
    delivery_address text not null
);
CREATE TABLE orders(
    code integer primary key,
    customer_id integer references cusstomers(id),
    total_sum double precision not null check (total_sum > 0),
    is_paid boolean not null
);

CREATE TABLE products(
    id varchar primary key,
    name varchar not null unique,
    description text,
    price double precision not null check (price > 0)
);
CREATE TABLE order_items(
    order_code integer references orders(code),
    product_id varchar references products(id),
    quantity integer not null,
    primary key (order_code, product_id)
);

INSERT INTO products values('111','rubber', 'blue', 13.3);
UPDATE products set name= 'black' where description = 'blue';
DELETE FROM products where price = 13.3;

