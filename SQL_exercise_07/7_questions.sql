-- https://en.wikibooks.org/wiki/SQL_Exercises/Planet_Express 
-- 7.1 Who receieved a 1.5kg package?
    -- The result is "Al Gore's Head".
SELECT Client.Name
FROM Package INNER JOIN Client ON Client.AccountNumber = Package.Recipient
WHERE Package.Weight = 1.5;
-- 7.2 What is the total weight of all the packages that he sent?
SELECT SUM(Weight)
FROM Package
WHERE Sender = (
	SELECT Client.AccountNumber
	FROM Package INNER JOIN Client ON Client.AccountNumber = Package.Recipient
	WHERE Package.Weight = 1.5
);