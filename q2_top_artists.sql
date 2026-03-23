-- Q2: Top 10 most popular artists by average popularity (minimum 5 tracks)
-- HAVING clause filters out artists with too few tracks to avoid misleading averages
-- Business use case: Identifies bankable artists for partnerships and promotions
Select artists, Round(AVG(popularity),2) as avg_popularity, count(*) as total_tracks
from spotify_tracks 
group by artists 
having count(*) > 5
order by avg_popularity DESC
limit 10