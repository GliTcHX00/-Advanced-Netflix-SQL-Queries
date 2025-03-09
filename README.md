# 🎬 Netflix Data Analysis

## 📌 Overview
This project contains SQL queries for analyzing Netflix data using MySQL. The dataset includes information about movies and TV shows, allowing us to perform various analyses such as content distribution, rating trends, and actor appearances.

## 📊 Key Analyses

### ✅ Movies vs. TV Shows Count
- Counts the number of movies and TV shows available on Netflix.
- Uses `GROUP BY` and `COUNT(*)` to categorize content types.

### ✅ Most Common Ratings
- Identifies the most frequent rating for movies and TV shows.
- Uses `RANK()` with `PARTITION BY` to rank ratings by popularity.

### ✅ Movies Released in a Specific Year (e.g., 2020)
- Filters movies based on `release_year`.

### ✅ Top 5 Countries with the Most Content
- Cleans the `country` column by replacing empty values with NULL.
- Uses `GROUP BY` and `ORDER BY` to find the top 5 countries with the highest content count.

### ✅ Longest Movie
- Finds the movie with the longest duration using `MAX(duration)`.

### ✅ Content Added in the Last 5 Years
- Extracts content added within the last five years using `DATE_SUB(CURRENT_DATE(), INTERVAL 5 YEAR)`.

### ✅ Content by Director 'Rajiv Chilaka'
- Filters the dataset to find movies or TV shows directed by Rajiv Chilaka using `LIKE`.

### ✅ TV Shows with More Than 5 Seasons
- Extracts the numeric value from `duration` and filters shows with more than 5 seasons.

### ✅ Count of Content per Genre
- Groups content by `listed_in` (genre) and counts the number of occurrences.

### ✅ Average Yearly Content Releases in India (Top 5 Years)
- Calculates the average percentage of content released by Netflix in India each year.
- Uses `ROUND()` for percentage calculations and sorts by the highest average.

### ✅ List of Documentary Movies
- Filters content categorized as "documentaries" using `LIKE` in `listed_in`.

### ✅ Content Without a Director
- Cleans the `director` column by replacing empty values with NULL and filters content with missing directors.

### ✅ Movies Featuring Salman Khan in the Last 10 Years
- Filters movies featuring "Salman Khan" and released within the last 10 years.

### ✅ Top 10 Actors with the Most Appearances in Indian Movies
- Cleans the `casts` column and finds the top 10 actors with the most appearances in Indian movies.

### ✅ Categorizing Content as 'Good' or 'Bad'
- Labels content containing the words "kill" or "violence" as "Bad" and all others as "Good".
- Uses `CASE WHEN` to create categories and `GROUP BY` to count each category.
