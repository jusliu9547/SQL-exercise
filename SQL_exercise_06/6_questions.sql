-- https://en.wikibooks.org/wiki/SQL_Exercises/Scientists
-- 6.1 List all the scientists' names, their projects' names, 
    -- and the hours worked by that scientist on each project, 
    -- in alphabetical order of project name, then scientist name.
SELECT Scientists.Name AS Scientist, Projects.Name AS Project, Projects.Hours
FROM Scientists INNER JOIN AssignedTo ON Scientists.SSN = AssignedTo.Scientist
                INNER JOIN Projects ON AssignedTo.Project = Projects.Code
ORDER BY Projects.Name, Scientists.Name;
-- 6.2 Select the project names which are not assigned yet
SELECT Name 
FROM Projects 
WHERE Name NOT IN (
SELECT Projects.Name
FROM Projects INNER JOIN AssignedTo ON Projects.Code = AssignedTo.Project);
