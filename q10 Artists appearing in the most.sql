-- Q10: Artists appearing in the most genres (minimum 4 genres)
-- Uses COUNT(DISTINCT track_genre) to measure genre versatility
-- Result: Badfinger tops the list appearing in 9 genres
-- Business use case: Identifies versatile artists for cross-genre
-- marketing campaigns and playlist placement
select artists, count(distinct track_genre) as total_count
from spotify_tracks
group by artists 
having count(distinct track_genre)>3
order by total_count DESC