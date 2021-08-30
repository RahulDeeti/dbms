#Question 1
SELECT DISTINCT
    city, tate, zip
FROM
    customer;
    

#Question 2
SELECT 
    empname, department, email, phone
FROM
    employee
WHERE
    phone LIKE '3-%' ;


#Question 3
SELECT 
    *
FROM
    resourcetbl
WHERE
    rate BETWEEN 10 AND 20;


#Question 4
select
	evntno, dateauth, status
from
	eventrequest
where 
	status != 'pending'
    and ( (month(dateauth) = 07) and (year(dateauth) = 2018));


#Question 5
SELECT 
    locno, locname
FROM
    location
WHERE
    facno = (SELECT 
				facno
			FROM
				facility
			WHERE
				facname = 'basketball arena');

#Qeustion 6
SELECT 
    planno, COUNT(lineno), SUM(numberFLD)
FROM
    eventplanline
GROUP BY planno;



    

