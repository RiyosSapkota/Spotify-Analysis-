-- Q7: Hidden gems - high energy tracks (energy > 0.8) with low popularity (< 40)
-- 47k tracks matched criteria = 41% of high energy tracks are underrated
-- Business use case: Music labels can use this to discover and sign underrated artists
select track_name, artists, track_genre, max(energy) as energy, max(popularity) as popularity
from spotify_tracks
where energy>0.8 AND popularity <40
group by track_name, artists, track_genre
order by energy DESC
limit 10
