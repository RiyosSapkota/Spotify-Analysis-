Spotify Music Analysis | SQL Project

Overview
Analyzed 114,000+ Spotify tracks across 114 genres using PostgreSQL 
to uncover what drives track popularity and how genres differ sonically.

Tools Used
- PostgreSQ
- GitHub

Dataset
- Source: Kaggle — Spotify Tracks Dataset by Maharshi Pandya
- Size: 114,000 tracks across 114 genres

Key Findings
- Pop-film and K-pop are the highest performing genres
- Popular tracks are more danceable and less acoustic than unpopular tracks
- 41% of high energy tracks have low popularity — hidden gems for music labels
- Trip-hop is the most sonically similar genre to pop
- Badfinger is the most versatile artist appearing across 9 genres
- Every genre has exactly 1,000 tracks — perfectly balanced dataset

SQL Concepts Used
- Aggregations, GROUP BY, HAVING
- CTEs (Common Table Expressions)
- Window Functions — RANK(), AVG() OVER(), COUNT() OVER()
- CASE statements for segmentation
- CROSS JOIN for comparative analysis
