-- Q12: Genres most similar to pop based on audio features
-- Uses two CTEs - one for pop averages, one for all genre averages
-- Similarity score = sum of absolute differences in danceability, energy and valence
-- Lower score = more similar to pop
-- Uses CROSS JOIN to attach pop's single row to every genre for comparison
-- Business use case: Helps artists and labels identify which genres to
-- crossover into based on sonic similarity to pop

WITH pop_features AS (
  SELECT 
    round(AVG(danceability),2) as pop_dance,
    round(AVG(energy), 2) as pop_energy,
    round(AVG(valence), 2) as pop_valence
  FROM spotify_tracks
  WHERE track_genre = 'pop'
),
genre_features AS (
  SELECT
    track_genre,
    round(avg(danceability), 2) as avg_dance,
    round(avg(energy), 2) as avg_energy,
    round(avg(valence), 2) as avg_valence
  FROM spotify_tracks
  GROUP BY track_genre
)

SELECT
  g.track_genre,
  round(ABS(g.avg_dance - p.pop_dance) + 
    ABS(g.avg_energy - p.pop_energy) +
    ABS(g.avg_valence - p.pop_valence), 2) as similarity_score
FROM genre_features g 
CROSS JOIN pop_features p 
WHERE g.track_genre != 'pop'
ORDER BY similarity_score ASC
LIMIT 10