-- 1. List the films where the yr is 1962 [Show id, title]

SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2. Give year of 'Citizen Kane'.

select yr FROM movie
WHERE title = 'Citizen Kane'

-- 3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.

SELECT id,title,yr From movie
WHERE title LIKE 'Star Trek%'
order by yr

-- 4. What id number does the actor 'Glenn Close' have?

SELECT id FROM actor 
WHERE name = 'Glenn Close';



-- 5. What is the id of the film 'Casablanca'

SELECT id from movie
WHERE title = 'Casablanca'

-- 6. Obtain the cast list for 'Casablanca'.

what is a cast list?
Use movieid=11768, (or whatever value you got from the previous question)

SELECT name FROM actor
JOIN casting
ON actor.id = casting.actorid
WHERE movieid = 11768

-- 7. Obtain the cast list for the film 'Alien'

SELECT name FROM actor
JOIN casting 
ON actor.id = casting.actorid
JOIN movie
ON casting.movieid = movie.id
WHERE movie.title = 'Alien'
 
-- 8. List the films in which 'Harrison Ford' has appeared

SELECT movie.title FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON actor.id = casting.actorid
WHERE actor.name = 'Harrison Ford'

-- 9. List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]

SELECT title FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford' AND casting.ord != 1

-- 10. List the films together with the leading star for all 1962 films.

SELECT title,name FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON casting.actorid = actor.id
WHERE movie.yr = 1962 and casting.ord = 1

-- 11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.

SELECT title,name FROM movie
JOIN casting
ON movie.id = casting.movieid AND ord=1
JOIN actor
ON casting.actorid = actor.id
WHERE movie.id IN(
  SELECT movieid FROM casting
  WHERE actorid IN (
     SELECT id FROM actor
     WHERE name = 'Julie Andrews'))


result
Actors with 15 leading roles
-- 13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.

SELECT name FROM actor
JOIN casting
ON id = actorid
GROUP BY id,name
HAVING SUM(CASE ord WHEN 1 THEN 1 ELSE 0 END) >= 15
ORDER BY name

-- 14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.

SELECT title,COUNT(actorid) FROM movie
JOIN casting
ON movie.id = casting.movieid
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title ASC

-- 15. List all the people who have worked with 'Art Garfunkel'.

SELECT actor.name
FROM movie
JOIN casting
ON casting.movieid = movie.id
JOIN actor
ON actor.id = casting.actorid
where movie.id in (select movieid from casting join actor on id =actorid where 
actor.name = 'Art Garfunkel') and actor.name <> 'Art Garfunkel'