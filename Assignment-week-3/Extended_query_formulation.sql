#problem 1
SELECT
  er.evntNo,
  er.dateHeld,
  count(*) AS totalPlanCount
FROM EventRequest AS er
  INNER JOIN EventPlan AS ep ON er.evntNo = ep.evntNo
WHERE ep.workDate BETWEEN '2018-12-01' AND '2018-12-31'
GROUP BY er.evntNo
HAVING totalPlanCount > 1;

#Question 2
SELECT
  ep.planNo,
  ep.evntNo,
  ep.workDate,
  ep.activity
FROM EventPlan AS ep
  INNER JOIN EventRequest AS er ON ep.evntNo = er.evntNo
  INNER JOIN Facility AS f ON er.facNo = f.facNo
WHERE (f.facName = 'Basketball arena') AND (ep.workDate BETWEEN '2018-12-01' AND '2018-12-31');

#Question 3
SELECT
  er.evntNo,
  er.dateHeld,
  er.dateReq,
  er.estCost,
  er.status
FROM EventRequest AS er
  INNER JOIN EventPlan AS ep ON er.evntNo = ep.evntNo
  INNER JOIN Employee AS e ON ep.empNo = e.empNo
  INNER JOIN Facility AS f ON er.facNo = f.facNo
WHERE (f.facName = 'Basketball arena') AND (er.dateHeld BETWEEN '2018-10-01' AND '2018-12-31') AND
      (e.empName = 'Mary Manager');

#Question 4
SELECT
  epl.planNo,
  epl.lineNo,
  epl.numberFLD AS 'Number',
  epl.timeStart,
  epl.timeEnd,
  l.locName     AS 'Location name',
  r.resName     AS 'Resource name'
FROM EventPlanLine AS epl
  INNER JOIN EventPlan AS ep ON epl.planNo = ep.planNo
  INNER JOIN Location AS l ON epl.locNo = l.locNo
  INNER JOIN ResourceTbl AS r ON epl.resNo = r.resNo
  INNER JOIN Facility AS f ON l.facNo = f.facNo
WHERE (f.facName = 'Basketball arena') AND (ep.activity = 'Operation') AND
      (ep.workDate BETWEEN '2018-10-01' AND '2018-12-31')
ORDER BY epl.planNo;

#insert statements
#Question 1
INSERT INTO Facility (facNo, facName) VALUES ('F104', 'Swimming Pool');

#Question 2
INSERT INTO Location (locNo, facNo, locName) VALUES ('L107', 'F104', 'Door');

#Question 3
INSERT INTO Location (locNo, facNo, locName) VALUES ('L108', 'F104', 'Locker Room');

#Question 4
UPDATE Location
SET locName = 'Gate'
WHERE locNo = 'L107';

#Question 5
DELETE FROM Location
WHERE locNo = 'L108';