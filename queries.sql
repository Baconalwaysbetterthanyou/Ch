-- ============================================================
-- Project 5: Queries — Indie Game Studio & Player Achievement Tracker
-- ============================================================

-- Query 1: A JOIN across 3 or more tables
-- What are the usernames of players who unlocked achievements in games created by "PixelForge Studios"?
SELECT p.username, g.title AS game_title, a.title AS achievement_title
FROM players p
JOIN player_achievements pa ON p.player_id = pa.player_id
JOIN achievements a ON pa.achievement_id = a.achievement_id
JOIN games g ON a.game_id = g.game_id
JOIN studios s ON g.studio_id = s.studio_id
WHERE s.studio_name = 'PixelForge Studios';

-- Query 2: GROUP BY with HAVING
-- Which games have more than 2 registered achievements?
SELECT g.title AS game_title, COUNT(a.achievement_id) AS total_achievements
FROM games g
JOIN achievements a ON g.game_id = a.game_id
GROUP BY g.game_id, g.title
HAVING COUNT(a.achievement_id) > 2;

-- Query 3: ORDER BY with LIMIT
-- What are the top 5 players with the highest total achievement point scores?
SELECT p.username, SUM(a.point_value) AS total_points
FROM players p
JOIN player_achievements pa ON p.player_id = pa.player_id
JOIN achievements a ON pa.achievement_id = a.achievement_id
GROUP BY p.player_id, p.username
ORDER BY total_points DESC
LIMIT 5;

-- Query 4: A WHERE on a date or time
-- Which achievements were unlocked by any player during the month of January 2026?
SELECT p.username, a.title AS achievement_title, pa.unlocked_at
FROM player_achievements pa
JOIN players p ON pa.player_id = p.player_id
JOIN achievements a ON pa.achievement_id = a.achievement_id
WHERE pa.unlocked_at >= '2026-01-01 00:00:00' 
  AND pa.unlocked_at < '2026-02-01 00:00:00'
ORDER BY pa.unlocked_at;

-- Query 5: Additional filter / date query
-- What are the details of all indie games released in the year 2025?
SELECT game_id, title, release_date, genre
FROM games
WHERE release_date >= '2025-01-01' AND release_date <= '2025-12-31'
ORDER BY release_date ASC;

-- Query 6: A subquery
-- Which players have unlocked achievements that are worth more than the average point value of all achievements?
SELECT DISTINCT p.username, a.title AS achievement_title, a.point_value
FROM players p
JOIN player_achievements pa ON p.player_id = pa.player_id
JOIN achievements a ON pa.achievement_id = a.achievement_id
WHERE a.point_value > (SELECT AVG(point_value) FROM achievements)
ORDER BY a.point_value DESC;

-- Query 7: A CTE (WITH)
-- Using a CTE for player point totals, which players rank above the average score of all active players?
WITH PlayerScores AS (
    SELECT p.player_id, p.username, SUM(a.point_value) AS total_score
    FROM players p
    JOIN player_achievements pa ON p.player_id = pa.player_id
    JOIN achievements a ON pa.achievement_id = a.achievement_id
    GROUP BY p.player_id, p.username
)
SELECT username, total_score
FROM PlayerScores
WHERE total_score > (SELECT AVG(total_score) FROM PlayerScores)
ORDER BY total_score DESC;

-- Query 8: A window function (OVER)
-- How do individual player achievement unlock counts rank within their respective games using RANK()?
SELECT 
    g.title AS game_title,
    p.username,
    COUNT(pa.achievement_id) AS unlocked_count,
    RANK() OVER (PARTITION BY g.game_id ORDER BY COUNT(pa.achievement_id) DESC) as player_rank
FROM games g
JOIN achievements a ON g.game_id = a.game_id
JOIN player_achievements pa ON a.achievement_id = pa.achievement_id
JOIN players p ON pa.player_id = p.player_id
GROUP BY g.game_id, g.title, p.player_id, p.username;

-- Query 9: A view (CREATE VIEW)
-- Create a view named active_player_summary that lists each player alongside their total unlocked achievements, then query it.
CREATE VIEW active_player_summary AS (
    SELECT 
        p.player_id,
        p.username,
        COUNT(pa.achievement_id) AS total_unlocked
    FROM players p
    LEFT JOIN player_achievements pa ON p.player_id = pa.player_id
    GROUP BY p.player_id, p.username
);

-- Select statement to verify the view works:
SELECT * FROM active_player_summary ORDER BY total_unlocked DESC;

-- Query 10: A self-join or an outer join
-- Which players have never unlocked a single achievement (using a LEFT JOIN)?
SELECT p.player_id, p.username, p.email
FROM players p
LEFT JOIN player_achievements pa ON p.player_id = pa.player_id
WHERE pa.achievement_id IS NULL;
