-- Q8: Rank tracks within each genre by popularity using RANK() window function
-- Shows top 3 tracks per genre, demonstrating use of CTEs and PARTITION BY
-- Note: RANK() leaves gaps for ties (e.g. two rank 2s means next rank is 4)
-- Business use case: Helps playlist curators identify top performing tracks per genre
with ranked_tracks as(
  select track_name, artists, track_genre, popularity, 
    rank() over(partition by track_genre order by popularity desc) as genre_rank
from spotify_tracks
)
select * 
from ranked_tracks
where genre_rank <= 3
order by track_genre