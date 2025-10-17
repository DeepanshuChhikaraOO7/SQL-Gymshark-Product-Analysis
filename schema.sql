-- Drop the table if it already exists to ensure a fresh start
DROP TABLE IF EXISTS gymshark_products;

-- Create the table structure for the Gymshark product catalog
CREATE TABLE gymshark_products (
    title VARCHAR(150),
    product_type VARCHAR(150),
    vendor VARCHAR(150),
    tags TEXT,
    handle VARCHAR(150),
    variant_title VARCHAR(100),
    sku VARCHAR(150),
    price NUMERIC(10, 2),
    image_src TEXT
);