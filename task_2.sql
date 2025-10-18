-- ===========================================
-- DATABASE: alx_book_store
-- ===========================================
-- Use the database
USE alx_book_store;
"""Authors", "author_id ", "author_name"""
-- ===========================================
-- 1️⃣ AUTHORS TABLE
-- ===========================================
CREATE TABLE IF NOT EXISTS AUTHORS (
    AUTHOR_ID INT AUTO_INCREMENT PRIMARY KEY,
    AUTHOR_NAME VARCHAR(215) NOT NULL
);

-- ===========================================
-- 2️⃣ BOOKS TABLE
-- ===========================================
CREATE TABLE IF NOT EXISTS BOOKS (
    BOOK_ID INT AUTO_INCREMENT PRIMARY KEY,
    TITLE VARCHAR(130) NOT NULL,
    AUTHOR_ID INT,
    PRICE DOUBLE NOT NULL,
    PUBLICATION_DATE DATE,
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHORS(AUTHOR_ID)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- ===========================================
-- 3️⃣ CUSTOMERS TABLE
-- ===========================================
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    CUSTOMER_ID INT AUTO_INCREMENT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(215) NOT NULL,
    EMAIL VARCHAR(215) UNIQUE NOT NULL,
    ADDRESS TEXT
);

-- ===========================================
-- 4️⃣ ORDERS TABLE
-- ===========================================
CREATE TABLE IF NOT EXISTS ORDERS (
    ORDER_ID INT AUTO_INCREMENT PRIMARY KEY,
    CUSTOMER_ID INT,
    ORDER_DATE DATE NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- ===========================================
-- 5️⃣ ORDER_DETAILS TABLE
-- ===========================================
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    ORDERDETAILID INT AUTO_INCREMENT PRIMARY KEY,
    ORDER_ID INT,
    BOOK_ID INT,
    QUANTITY DOUBLE NOT NULL CHECK (QUANTITY > 0),
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
