-- 1. Change the query shown so that it displays Nobel prizes for 1950.

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
Submit SQLRestore default

-- 2. Show who won the 1962 prize for literature.

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature'

-- 3. Show the year and subject that won 'Albert Einstein' his prize.

SELECT yr,subject from nobel
WHERE winner = 'Albert Einstein'

-- 4. Give the name of the 'peace' winners since the year 2000, including 2000.

SELECT winner from nobel
WHERE yr >= 2000 AND subject = 'peace'

-- 5. Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive.

SELECT * FROM nobel 
WHERE yr BETWEEN 1980 AND 1989 AND subject = 'literature'

-- 6. Show all details of the presidential winners:

-- Theodore Roosevelt
-- Thomas Woodrow Wilson
-- Jimmy Carter
-- Barack Obama

SELECT * FROM nobel
 WHERE winner IN ('Barack Obama',
                  'Jimmy Carter',
                  'Woodrow Wilson',
                   'Theodore Roosevelt')

-- 7. Show the winners with first name John

select winner from nobel
where winner LIKE 'John %'

-- 8. Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984.

select * from nobel
where yr = 1980 AND subject = 'physics'
OR yr = 1984 AND subject = 'chemistry'

-- 9. Show the year, subject, and name of winners for 1980 excluding chemistry and medicine

SELECT yr,subject,winner FROM nobel
WHERE yr = 1980 AND subject NOT IN('chemistry','medicine')

-- 10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

SELECT * FROM nobel
WHERE subject = 'Medicine'
AND yr < 1910
OR subject = 'Literature' AND yr >= 2004

-- 11. Find all details of the prize won by PETER GRÜNBERG

-- Non-ASCII characters

SELECT * FROM nobel 
WHERE winner = 'PETER GRÜNBERG'

-- 12. Find all details of the prize won by EUGENE O'NEILL

Escaping single quotes
SELECT * FROM nobel
WHERE winner = 'Eugene O''Neill'

-- 13. Knights in order

-- List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

SELECT winner,yr,subject from nobel
WHERE winner LIKE 'Sir %'

-- 14. The expression subject IN ('chemistry','physics') can be used as a value - it will be 0 or 1.

SELECT winner,subject
FROM nobel
WHERE yr = 1984
ORDER BY
CASE WHEN subject IN ('Physics','Chemistry') THEN 1 ELSE 0 END,subject,winner