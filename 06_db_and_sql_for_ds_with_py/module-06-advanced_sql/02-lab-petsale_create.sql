CREATE DATABASE pet_db;
USE pet_db;

DROP TABLE IF EXISTS PETSALE;

CREATE TABLE PETSALE (
	ID INTEGER NOT NULL,
	ANIMAL VARCHAR(20),
	SALEPRICE DECIMAL(6,2),
	SALEDATE DATE,
	QUANTITY INTEGER,
	PRIMARY KEY (ID)
	);


INSERT INTO PETSALE VALUES
(1,'Cat',450.09,'2018-05-29',9),
(2,'Dog',666.66,'2018-06-01',3),
(3,'Parrot',50.00,'2018-06-04',2),
(4,'Hamster',60.60,'2018-06-11',6),
(5,'Goldfish',48.48,'2018-06-14',24);

SELECT * FROM PETSALE;



-- Stored Procedure: Exercise 1
DELIMITER @			-- instead of @, double slash can be used //
CREATE PROCEDURE retrieve_all()
BEGIN
   SELECT * FROM petsale;
END @
DELIMITER ;

CALL retrieve_all;

DROP PROCEDURE retrieve_all;




-- Stored Procedure: Exercise 2
DELIMITER @
CREATE PROCEDURE UPDATE_SALE_PRICE(IN Animal_ID INT, IN Animal_Health VARCHAR(5))
BEGIN
	IF Animal_Health = 'BAD' THEN
		UPDATE petsale
			SET saleprice = saleprice * 0.75
            WHERE id = Animal_ID;
	ELSEIF Animal_Health = 'WORSE' THEN
		UPDATE petsale
			SET saleprice = saleprice * 0.5
            WHERE id = Animal_id;
	ELSE
		UPDATE petsale
			SET saleprice = saleprice
            WHERE id = Animal_ID;
	END IF;
END @
DELIMITER ;

CALL UPDATE_SALE_PRICE(3, 'BAD');

SELECT * FROM petsale;



