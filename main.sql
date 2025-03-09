SELECT * from netflix ;

SELECT COUNT(*) from netflix

SELECT type 
from netflix
GROUP BY 1


--* 1. Count the number of Movies vs TV Shows

SELECT `type`, COUNT(*)
from netflix
GROUP BY 1


--* 2. Find the most common rating for movies and TV shows

SELECT * FROM
(
SELECT `type`, 
    rating, 
    count(*),
    RANK() OVER(PARTITION BY `type` ORDER BY count(*) DESC) as `rank`
from netflix
GROUP BY 1, 2
) as ti
WHERE `rank` = 1


--* 3. List all movies released in a specific year (e.g., 2020)

SELECT *
FROM netflix
WHERE `type` = 'Movie' AND release_year = 2020


--* 4. Find the top 5 countries with the most content on Netflix

UPDATE netflix
SET country = NULLIF(country, '');

SELECT country, count(*) 
FROM netflix
where country is NOT NULL
GROUP BY 1
ORDER BY 2 desc


--* 5. Identify the longest movie

SELECT *
from netflix
WHERE `type` = 'Movie' AND duration = (SELECT max(duration) from netflix)


--* 6. Find content added in the last 5 years

SELECT *    -- { 1 }
from netflix
WHERE date_added >= DATE_SUB(CURRENT_DATE(), INTERVAL 5 YEAR)

-- SELECT * -- { 2 }
-- FROM netflix
-- WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'


--* 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

SELECT *
from netflix
where director LIKE '%Rajiv Chilaka%'


--* 8. List all TV shows with more than 5 seasons

SELECT * from netflix
WHERE `type` = 'TV Show' 
    and SUBSTRING(duration, 1, 1) >= 5


--* 9. Count the number of content items in each genre

SELECT 
    listed_in, 
    count(show_id)
from netflix
GROUP BY 1


--* 10. Find each year and the average numbers of content release by India on netflix. 
--* return top 5 year with highest avg content release !

SELECT 
    YEAR(date_added) year,
    COUNT(*),
    ROUND(COUNT(*) / (SELECT COUNT(*) from netflix WHERE country = 'India') * 100, 2) as AVG_CONYENT_PER_YEAR
from netflix
WHERE country = 'India'
GROUP BY 1
ORDER BY 2 DESC


--* 11. List all movies that are documentaries

SELECT *
from netflix
WHERE listed_in LIKE "%documentaries%"


--* 12. Find all content without a director

UPDATE netflix
set director = NULLIF(director, '')

SELECT *
from netflix
WHERE director is NULL


--* 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

SELECT * 
from netflix
WHERE casts LIKE '%Salman Khan%'
    and release_year >= YEAR(CURRENT_DATE()) - 10


--* 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

UPDATE netflix
set casts = NULLIF(casts, '')

SELECT casts,
    count(*)
from netflix
WHERE country = 'India' and casts is not NULL
GROUP BY 1
ORDER BY 2 DESC


--* 15:
--* Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
--* the description field. Label content containing these keywords as 'Bad' and all other 
--* content as 'Good'. Count how many items fall into each category.

SELECT 
*,
CASE 
    WHEN description LIKE '%kill%' OR description LIKE '%violence%' THEN 'Bad'
    ELSE 'Good'
END AS category
FROM netflix


with t1 as
(
    SELECT 
		*,
        CASE 
            WHEN description LIKE '%kill%' OR description LIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
)
SELECT category,
    count(*) total_contant
from t1
GROUP BY 1
