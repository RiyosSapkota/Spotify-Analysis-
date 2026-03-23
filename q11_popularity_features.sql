-- Q11: Audio feature segmentation - Popular vs Unpopular tracks
-- Segments tracks into Popular (popularity > 70) and Unpopular (popularity < 40)
-- Uses CASE statement to create popularity tiers (similar to pivot table in Excel)
-- Key findings: Popular tracks have higher danceability (+0.14) and lower acousticness (-0.14)
-- Valence and tempo show minimal difference between popular and unpopular tracks
-- Business use case: Helps producers and labels understand what audio
-- characteristics to prioritize when creating commercially successful music
SELECT 
    CASE 
        WHEN popularity > 70 THEN 'Popular'
        WHEN popularity < 40 THEN 'Unpopular'
    END as popularity_tier,
    ROUND(AVG(danceability), 2) as avg_danceability,
    ROUND(AVG(energy), 2) as avg_energy,
    ROUND(AVG(valence), 2) as avg_valence,
    ROUND(AVG(acousticness), 2) as avg_acousticness,
    ROUND(AVG(tempo), 2) as avg_tempo,
    COUNT(*) as track_count
FROM spotify_tracks
WHERE popularity > 70 OR popularity < 40
GROUP BY popularity_tier
ORDER BY avg_danceability;