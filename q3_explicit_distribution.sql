-- Q3: Distribution of explicit vs non-explicit tracks per genre
-- Business use case: Helps brands identify brand-safe genres for advertising
select track_genre, Round(avg(danceability),2) as avg_danceability, Round(avg(energy),2) as avg_energy, 
round(avg(valence),2) as avg_valence
from spotify_tracks
group by track_genre
order by avg_danceability, avg_energy, avg_valence 
