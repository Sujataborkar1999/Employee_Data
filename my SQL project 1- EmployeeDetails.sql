create table EmployeeDetail
( EmployeeID int , FirstName varchar(50),LastName varchar(50),Salary int , JoiningDate DATETIME , Department varchar(50),
Gender varchar(50)
);
select * from EmployeeDetail
 
SELECT UPPER (FirstName) as [First Name] FROM EmployeeDetail;

SELECT LOWER (FirstName) as [First Name] FROM EmployeeDetail;

SELECT FirstName+''+LastName  AS [Name] FROM EmployeeDetail;

SELECT * FROM  EmployeeDetail
WHERE FirstName = 'Vikas';

SELECT * FROM EmployeeDetail
WHERE FirstName LIKE 'a%';

SELECT * FROM EmployeeDetail
WHERE FirstName LIKE '%h';

SELECT * FROM EmployeeDetail
WHERE FirstName  BETWEEN 'A' AND 'P';



SELECT * FROM EmployeeDetail
WHERE FirstName NOT BETWEEN 'A' AND 'P';

SELECT * FROM EmployeeDetail
WHERE FirstName LIKE '%[%]%';

SELECT  * FROM EmployeeDetail
WHERE Gender LIKE '__le%'  ;

SELECT  * FROM EmployeeDetail
WHERE FirstName LIKE '%A____';

SELECT  * FROM EmployeeDetail
WHERE FirstName LIKE '%';

SELECT  DISTINCT Department  FROM EmployeeDetail

SELECT MAX(Salary)
FROM EmployeeDetail

SELECT MIN(Salary)
FROM EmployeeDetail

select FORMAT (JoiningDate, 'dd MMM yyyy')AS Joining_Date
FROM EmployeeDetail;

select FORMAT (JoiningDate, 'yyy/mm/dd')AS Joining_Date
FROM EmployeeDetail;

select GETDATE() Joining_Date, CAST( GETDATE() AS Time) Time_part;
 

SELECT YEAR(JoiningDate)  AS Year_part FROM EmployeeDetail;
 
SELECT MONTH(JoiningDate)  AS Month_part FROM EmployeeDetail;

SELECT GETDATE();

SELECT GETUTCDATE();

SELECT FirstName, JoiningDate , DATEDIFF (month,JoiningDate,GETDATE()) AS Month_part FROM EmployeeDetail;

SELECT FirstName, JoiningDate , DATEDIFF (day,JoiningDate,GETDATE()) AS Day_part FROM EmployeeDetail;

 SELECT * FROM EmployeeDetail
where year (JoiningDate) = '2013';

SELECT * FROM EmployeeDetail
where month (JoiningDate) = '02';

SELECT COUNT(EmployeeID) AS Number_of_employees FROM EmployeeDetail; 

SELECT TOP 1 * FROM EmployeeDetail ;

SELECT * FROM [EmployeeDetail]
WHERE FirstName IN('Vikas','Ashish','Nikhil');

SELECT * FROM [EmployeeDetail]
WHERE FirstName NOT IN('Vikas','Ashish','Nikhil');

SELECT RTRIM (FirstName) AS FirstName FROM EmployeeDetail

SELECT lTRIM (FirstName) AS FirstName FROM EmployeeDetail

SELECT FirstName , CASE WHEN Gender = 'Male' THEN 'M'
WHEN Gender = 'Female' THEN 'F' END 
FROM EmployeeDetail;

SELECT 'Hello ' + FirstName FROM EmployeeDetail

SELECT * FROM EmployeeDetail
WHERE Salary> 600000; 

SELECT * FROM EmployeeDetail
WHERE Salary< 700000;

SELECT * FROM EmployeeDetail
WHERE Salary BETWEEN 500000 AND 600000; 

CREATE TABLE ProjectDetail 
( ProjectDetailID int ,EmployeeDetailID int , ProjectName varchar (50)
);

SELECT Department ,
SUM (Salary) AS Total_Salary 
FROM EmployeeDetail
GROUP BY Department;

SELECT Department ,
SUM (Salary) AS Total_Salary 
FROM EmployeeDetail
GROUP BY Department
ORDER BY SUM (Salary) ASC;

SELECT Department ,
SUM (Salary) AS Total_Salary 
FROM EmployeeDetail
GROUP BY Department
ORDER BY SUM (Salary) DESC;

SELECT Department ,
COUNT (*) AS Department_Counts, 
SUM (Salary) AS Total_Salary 
FROM EmployeeDetail
GROUP BY Department;
;

SELECT Department ,
AVG (Salary) AS Average_Salary
FROM EmployeeDetail
GROUP BY Department
ORDER BY AVG (Salary);

SELECT Department ,
MAX (Salary) AS Maximum_Salary
FROM EmployeeDetail
GROUP BY Department
ORDER BY AVG (Salary);

SELECT Department ,
MIN (Salary) AS Minimum_Salary
FROM EmployeeDetail
GROUP BY Department
ORDER BY MIN (Salary);

SELECT FirstName,ProjectName 
FROM EmployeeDetail A
INNER JOIN ProjectDetail B
ON A.EmployeeID=B.EmployeeDetailID
ORDER BY FirstName;

SELECT FirstName,ProjectName 
FROM EmployeeDetail A
LEFT OUTER JOIN ProjectDetail B
ON A.EmployeeID=B.EmployeeDetailID
ORDER BY FirstName;

SELECT FirstName,
ISNULL (ProjectName, '-No Project Assigned') as ProjectName
FROM [EmployeeDetail] A
LEFT OUTER JOIN [ProjectDetail] B
ON A.EmployeeID=B.EmployeeDetailID
ORDER BY FirstName;

SELECT FirstName, ProjectName 
FROM EmployeeDetail A 
RIGHT OUTER JOIN ProjectDetail B 
ON A.EmployeeID=B.EmployeeDetailID
ORDER BY FirstName;

SELECT FirstName, ProjectName 
FROM EmployeeDetail A
FULL OUTER JOIN ProjectDetail B
ON A.EmployeeID=B.EmployeeDetailID
ORDER BY FirstName

SELECT EmployeeID, FirstName , ProjectName
FROM [EmployeeDetail] E
INNER JOIN [ProjectDetail] P
ON E.EmployeeID=P.ProjectDetailID
WHERE EmployeeID IN (SELECT EmployeeDetailID
FROM [ProjectDetail] GROUP BY EmployeeDetailID
HAVING COUNT (*)>1);

SELECT P.ProjectName,E.FirstName
FROM ProjectDetail P INNER JOIN EmployeeDetail E
ON P.ProjectDetailID=E.EmployeeID
WHERE P.ProjectName IN (SELECT ProjectName FROM ProjectDetail
GROUP BY ProjectName HAVING COUNT (1)>1)

SELECT * FROM EmployeeDetail CROSS JOIN ProjectDetail

SELECT UPPER(SUBSTRING(FirstName,1,1))+LOWER(SUBSTRING(FirstName,2,LEN (FirstName)-1)) AS FirstName  
FROM EmployeeDetail;


SELECT STUFF((SELECT ' ,'+ E.FirstName FROM [EmployeeDetail] 
AS E FOR XML PATH('')),1,2,'') AS [All_Emp_Name ];

SELECT ProjectName,
STUFF((SELECT ' , '+FirstName 
FROM EmployeeDetail E1 INNER JOIN ProjectDetail P1
ON E1.EmployeeID =P1.EmployeeDetailID
WHERE P1.ProjectNAME =P2.ProjectName FOR XML PATH ('')),1,2,'')
AS EmployeeName FROM EmployeeDetail E2
INNER JOIN ProjectDetail P2 ON E2.EmployeeID = P2.EmployeeDetailID
GROUP BY ProjectName

Create TABLE FuelDetail
( ID int , Fuel int , Date_ DATETIME);

SELECT C1.Fuel AS [Fuel quantity now],C1.[Date_],C.Fuel AS [Fuel quantity before],
C.[Date_] FROM FuelDetail C
JOIN FuelDetail C1 ON C1.[Date_]=(SELECT MIN([Date_]) 
FROM FuelDetail WHERE [Date_]>C.[Date_])
WHERE C1.Fuel>C.Fuel

 












