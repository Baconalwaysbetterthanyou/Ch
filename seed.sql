-- ============================================================
-- Project 5: Seed Data — Indie Game Studio Tracker
-- Includes 20+ rows for main tables and 50+ rows for the join table.
-- ============================================================

-- 1. Studios (5 rows)
INSERT INTO studios (studio_name, founded_year, country) VALUES 
('PixelForge Studios', 2018, 'USA'),
('Nebula Byte Games', 2020, 'Canada'),
('RetroPixel Interactive', 2015, 'Japan'),
('Void Walker Games', 2021, 'Germany'),
('Aether Works', 2019, 'UK');

-- 2. Games (5 rows)
INSERT INTO games (title, release_date, genre, studio_id) VALUES 
('Cyber Knight Chronicles', '2024-05-12', 'RPG', 1),
('Quantum Quest', '2025-01-15', 'Puzzle', 1),
('Pixel Dungeon Crawler', '2023-11-20', 'Roguelike', 3),
('Stellar Drift', '2025-06-01', 'Racing', 2),
('Neon Abyss', '2024-09-10', 'Action', 4);

-- 3. Players (20 rows)
INSERT INTO players (username, email, sign_up_date) VALUES 
('gamerX99', 'gamerx99@example.com', '2024-01-10'),
('pixelQueen', 'pixelqueen@example.com', '2024-03-22'),
('speedDemon', 'speed@example.com', '2025-01-02'),
('novicePlayer', 'novice@example.com', '2026-01-05'),
('shadowSniper', 'shadow@example.com', '2024-02-14'),
('blazeRider', 'blaze@example.com', '2024-04-11'),
('cosmicGamer', 'cosmic@example.com', '2024-05-30'),
('neonRogue', 'neon@example.com', '2024-06-19'),
('byteMaster', 'byte@example.com', '2024-07-22'),
('glitchHunter', 'glitch@example.com', '2024-08-05'),
('apexPlayer', 'apex@example.com', '2024-09-12'),
('zeroCool', 'zero@example.com', '2024-10-01'),
('phantomX', 'phantom@example.com', '2024-10-15'),
('vortex99', 'vortex@example.com', '2024-11-03'),
('stellarKnight', 'stellark@example.com', '2024-11-20'),
('omegaByte', 'omega@example.com', '2024-12-01'),
('sonicBoom', 'sonic@example.com', '2024-12-10'),
('matrixRider', 'matrix@example.com', '2025-01-10'),
('hyperDrive', 'hyper@example.com', '2025-01-18'),
('frostByte', 'frost@example.com', '2025-02-01');

-- 4. Achievements (15 rows)
INSERT INTO achievements (game_id, title, description, point_value) VALUES 
(1, 'First Blood', 'Defeat your first enemy', 10),
(1, 'Cyber Master', 'Complete the main campaign', 100),
(1, 'Secret Agent', 'Find all hidden logs', 50),
(2, 'Portal Master', 'Solve 50 puzzles', 50),
(2, 'Speed Thinker', 'Solve a puzzle in under 10 seconds', 30),
(3, 'Dungeon Survivor', 'Survive 10 floors', 30),
(3, 'Treasure Hoarder', 'Collect 1000 gold coins', 40),
(3, 'Undying', 'Clear the game without dying', 200),
(4, 'Speedy Drift', 'Complete a lap under 30 seconds', 40),
(4, 'Nitro King', 'Use nitro 10 times in a race', 25),
(4, 'Global Champion', 'Win an online championship', 150),
(5, 'Abyss Walker', 'Reach level 50 in the abyss', 80),
(5, 'Boss Slayer', 'Defeat the Void Lord', 120),
(1, 'Maxed Out', 'Reach level max on any character', 90),
(2, 'Brain Teased', 'Fail 10 puzzles before solving', 15);

-- 5. Player Achievements Join Table (50+ rows)
INSERT INTO player_achievements (player_id, achievement_id, unlocked_at) VALUES 
(1, 1, '2026-01-10 14:30:00'), (1, 2, '2026-01-11 18:00:00'), (1, 3, '2026-01-12 19:10:00'), (1, 4, '2026-01-13 20:00:00'), (1, 5, '2026-01-14 21:15:00'),
(2, 1, '2026-01-12 09:15:00'), (2, 3, '2026-01-12 10:20:00'), (2, 6, '2026-01-13 11:00:00'), (2, 7, '2026-01-14 12:30:00'), (2, 9, '2026-01-15 14:00:00'),
(3, 9, '2026-01-25 11:00:00'), (3, 10, '2026-01-25 11:30:00'), (3, 11, '2026-01-26 15:00:00'), (3, 1, '2026-01-27 16:00:00'), (3, 4, '2026-01-28 17:10:00'),
(4, 2, '2026-01-20 08:00:00'), (4, 5, '2026-01-21 09:00:00'), (4, 8, '2026-01-22 10:00:00'), (4, 12, '2026-01-23 11:00:00'), (4, 13, '2026-01-24 12:00:00'),
(5, 1, '2026-01-02 12:00:00'), (5, 2, '2026-01-03 13:00:00'), (5, 6, '2026-01-04 14:00:00'), (5, 7, '2026-01-05 15:00:00'), (5, 14, '2026-01-06 16:00:00'),
(6, 4, '2026-01-07 10:00:00'), (6, 5, '2026-01-07 11:00:00'), (6, 9, '2026-01-08 12:00:00'), (6, 10, '2026-01-09 13:00:00'), (6, 12, '2026-01-10 14:00:00'),
(7, 1, '2026-01-11 09:00:00'), (7, 3, '2026-01-11 10:00:00'), (7, 6, '2026-01-12 11:00:00'), (7, 8, '2026-01-13 12:00:00'), (7, 11, '2026-01-14 13:00:00'),
(8, 2, '2026-01-15 15:00:00'), (8, 4, '2026-01-16 16:00:00'), (8, 7, '2026-01-17 17:00:00'), (8, 10, '2026-01-18 18:00:00'), (8, 13, '2026-01-19 19:00:00'),
(9, 1, '2026-01-01 10:00:00'), (9, 5, '2026-01-02 11:00:00'), (9, 9, '2026-01-03 12:00:00'), (9, 12, '2026-01-04 13:00:00'), (9, 14, '2026-01-05 14:00:00'),
(10, 2, '2026-01-06 08:00:00'), (10, 3, '2026-01-07 09:00:00'), (10, 6, '2026-01-08 10:00:00'), (10, 11, '2026-01-09 11:00:00'), (10, 15, '2026-01-10 12:00:00');
