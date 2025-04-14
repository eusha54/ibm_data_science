CREATE DATABASE shoeshop_db;
USE shoeshop_db;


-- Bank account data creation

DROP TABLE IF EXISTS BankAccounts;

CREATE TABLE BankAccounts (
    AccountNumber VARCHAR(5) NOT NULL,
    AccountName VARCHAR(25) NOT NULL,
    Balance DECIMAL(8,2) CHECK(Balance>=0) NOT NULL,
    PRIMARY KEY (AccountNumber)
    );
    
INSERT INTO BankAccounts VALUES
('B001','Rose',300),
('B002','James',1345),
('B003','Shoe Shop',124200),
('B004','Corner Shop',76000);

-- Retrieve all records from the table

SELECT * FROM BankAccounts;



-- Shoe Shop Data creation

DROP TABLE IF EXISTS ShoeShop;

CREATE TABLE ShoeShop (
    Product VARCHAR(25) NOT NULL,
    Stock INTEGER NOT NULL,
    Price DECIMAL(8,2) CHECK(Price>0) NOT NULL,
    PRIMARY KEY (Product)
    );

INSERT INTO ShoeShop VALUES
('Boots',11,200),
('High heels',8,600),
('Brogues',10,150),
('Trainers',14,300);

SELECT * FROM ShoeShop;



-- Sample Exercise

DELIMITER @
CREATE PROCEDURE TRANSACTION_ROSE()
BEGIN
	DECLARE EXIT handler for SQLEXCEPTION
    BEGIN
		ROLLBACK;
        RESIGNAL;
	END;
    
    START TRANSACTION;
    
    SET SQL_SAFE_UPDATES = 0;

    UPDATE BankAccounts
		SET Balance = Balance - 200
        WHERE AccountName = "Rose";
    
    UPDATE BankAccounts
		SET Balance = Balance + 200
        WHERE AccountName = "Shoe Shop";
	
    UPDATE ShoeShop
		SET stock = stock - 1
        WHERE Product = "Boots";
	
	UPDATE BankAccounts
		SET Balance = Balance - 300
        WHERE AccountName = "Rose";

	SET SQL_SAFE_UPDATES = 1;
    
	COMMIT;
    
END @

DELIMITER ;


SELECT * FROM BankAccounts
	WHERE AccountName in ("Rose", "Shoe Shop");

SELECT * FROM ShoeShop;

SET SQL_SAFE_UPDATES = 0;
CALL transaction_rose;
SET SQL_SAFE_UPDATES = 1;


SELECT * FROM BankAccounts
	WHERE AccountName in ("Rose", "Shoe Shop");

SELECT * FROM ShoeShop;







