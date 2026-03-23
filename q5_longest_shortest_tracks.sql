-- Q5a: Top 10 longest tracks
select track_name, artists, round(duration_ms/60000,2) as duration
from spotify_tracks
where duration_ms < 900000
order by duration DESC
limit 10


-- Q5b: Top 10 shortest tracks
select track_name, artists, ROUND(CAST(duration_ms AS NUMERIC) / 60000.0, 2) as duration
from spotify_tracks
where duration_ms > 0
order by duration ASC
limit 10