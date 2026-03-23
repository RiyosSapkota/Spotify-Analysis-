-- Q6: Top 10 most popular tracks overall
-- GROUP BY used instead of DISTINCT to handle tracks appearing in multiple genres
select distinct track_name, artists, Max(popularity) as popularity
from spotify_tracks
group by track_name, artists
order by popularity desc
limit 10