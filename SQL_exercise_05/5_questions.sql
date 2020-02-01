-- https://en.wikibooks.org/wiki/SQL_Exercises/Pieces_and_providers
-- 5.1 Select the name of all the pieces. 
SELECT Name FROM Pieces;
-- 5.2  Select all the providers' data. 
SELECT * FROM Providers;
-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).
SELECT Piece, AVG(Price) FROM Provides GROUP BY Piece;
-- 5.4  Obtain the names of all providers who supply piece 1.
SELECT providers.Name FROM provides INNER JOIN providers ON provides.provider = providers.code WHERE provides.piece = 1;
-- 5.5 Select the name of pieces provided by provider with code "HAL".
SELECT pieces.name 
FROM pieces 
WHERE code IN (
	SELECT piece FROM provides WHERE Provider = "HAL"
);
-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Interesting and important one.
-- For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).
SELECT Providers.Name, Pieces.Name, MAX(Provides.Price)
	FROM Provides INNER JOIN Providers ON Provides.Provider = Providers.Code
				  INNER JOIN Pieces ON Provides.Piece = Pieces.Code
	GROUP BY Provides.Piece;
 
-- ---------------------------------------------
-- 5.7 Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
INSERT INTO Provides VALUES (1, "TNBC", 7);
-- 5.8 Increase all prices by one cent.
UPDATE Provides 
SET Price = Price + 1;
-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
DELETE FROM Provides
WHERE Provider = "RBT" AND Piece = 4;
-- 5.10 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
    -- (the provider should still remain in the database).
DELETE FROM Provides
WHERE Provider = "RBT";
