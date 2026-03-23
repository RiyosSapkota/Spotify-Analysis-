-- Q9: Genre popularity compared to global average using window functions
-- Uses AVG() OVER() window function to calculate global average across all genres
-- and stamps it on every row for easy comparison
-- Key insight: Shows which genres perform above and below the global popularity average
-- Business use case: Helps music labels identify underperforming genres
-- that need investment and overperforming genres to double down on
with genre_avg AS
( 
    SELECT track_genre, round(avg(popularity),2) as avg_popularity,
    round(avg(avg(popularity)) over(),2) as global_avg
  from spotify_tracks
  group by track_genre
)

SELECT 
  track_genre,
  avg_popularity,
  global_avg,
  round(avg_popularity - global_avg, 2) as difference_from_global,
      CASE 
        WHEN avg_popularity > global_avg then 'above average'
        else 'below average'
      END as performance
from genre_avg
order by avg_popularity