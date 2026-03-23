-- Q1: Top 10 most popular genres by average popularity score
-- Business use case: Helps music labels identify which genres to invest in
select track_genre, round(avg(popularity), 2) as avg_popularity 
from spotify_tracks
group by track_genre
order  by avg_popularity DESC
limit 10