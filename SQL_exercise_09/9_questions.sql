-- 9.1 give the total number of recordings in this table
SELECT COUNT(*)
FROM Log;
-- 9.2 the number of packages listed in this table?
SELECT COUNT(DISTINCT package)
FROM Log;
-- 9.3 How many times the package "Rcpp" was downloaded?
SELECT COUNT(*)
FROM Log
WHERE package = "Rcpp";
-- 9.4 How many recordings are from China ("CN")?
SELECT COUNT(*)
FROM Log
WHERE country = "CN";
-- 9.5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
SELECT package, COUNT(*)
FROM Log
GROUP BY package
ORDER BY 2 DESC
LIMIT 10;
-- 9.6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM
SELECT package, COUNT(*)
  FROM 
(SELECT * 
	FROM Log
	WHERE substr(time, 1, 5) < "11:00"
		AND substr(time, 1, 5) > "09:00")
  GROUP BY package
  ORDER BY 2 DESC
  LIMIT 10;
-- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
SELECT COUNT(*)
  FROM Log
  WHERE country = "CN"
    OR country = "JP"
    OR country = "SG";
-- 9.8 Print the countries whose downloaded are more than the downloads from China ("CN")
SELECT country
  FROM 
(SELECT country, COUNT(*) AS download
  FROM Log
  GROUP BY country
)
  WHERE download >
(SELECT COUNT(*)
  FROM Log
  WHERE country = "CN"
);
-- 9.9 Print the average length of the package name of all the UNIQUE packages
SELECT AVG(LENGTH(package))
  FROM 
(SELECT DISTINCT package
  FROM Log
);
-- 9.10 Get the package whose downloading count ranks 2nd (print package name and it's download count).
SELECT package, download
FROM
(SELECT package, COUNT(*) AS download
FROM Log
GROUP BY package
ORDER BY download DESC
LIMIT 2)
ORDER BY download
LIMIT 1;
-- 9.11 Print the name of the package whose download count is bigger than 1000.
SELECT package
FROM 
(SELECT package, COUNT(*) AS download
FROM Log
GROUP BY package
)
WHERE download > 1000;
-- 9.12 The field "r_os" is the operating system of the users.
    -- 	Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage).
SELECT SUBSTR(r_os, 1, 5) AS OS,
	COUNT(*) AS [Download Count],
	SUBSTR(COUNT(*)/((SELECT COUNT(*) FROM log)*1.0)*100, 1, 4) || "%" AS Proportion
  FROM Log
  GROUP BY OS;

