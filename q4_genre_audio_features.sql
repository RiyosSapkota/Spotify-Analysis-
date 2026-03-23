-- Q4: Average danceability, energy and valence per genre
-- Shows audio profile of each genre to understand their sonic characteristics
-- Note: Interesting anomaly - 'sad' genre has high danceability (0.92) but low valence (0.36)
-- and 'happy' genre has high energy (0.99) but low valence (0.22) - possible data labeling issue
-- Business use case: Helps playlist curators build mood-based playlists

SELECT track_genre, 
       ROUND(AVG(CAST(danceability AS NUMERIC)), 2) AS avg_danceability, 
       ROUND(AVG(CAST(energy AS NUMERIC)), 2) AS avg_energy, 
       ROUND(AVG(CAST(valence AS NUMERIC)), 2) AS avg_valence
FROM spotify_tracks
GROUP BY track_genre
ORDER BY avg_danceability;