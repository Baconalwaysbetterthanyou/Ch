-- ============================================================
-- Project 5: Database-Powered Innovation — YOUR schema
-- Domain: Indie Game Studio & Player Achievement Tracker
-- ============================================================

DROP TABLE IF EXISTS player_achievements CASCADE;
DROP TABLE IF EXISTS achievements CASCADE;
DROP TABLE IF EXISTS games CASCADE;
DROP TABLE IF EXISTS players CASCADE;
DROP TABLE IF EXISTS studios CASCADE;

-- 1. Studios Table
CREATE TABLE studios (
    studio_id SERIAL PRIMARY KEY,
    studio_name TEXT NOT NULL UNIQUE,
    founded_year INTEGER NOT NULL CHECK (founded_year >= 1950 AND founded_year <= 2026),
    country TEXT NOT NULL
);

-- 2. Games Table
CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    release_date DATE NOT NULL,
    genre TEXT NOT NULL,
    studio_id INTEGER NOT NULL REFERENCES studios(studio_id) ON DELETE CASCADE,
    CONSTRAINT chk_release_date CHECK (release_date <= CURRENT_DATE)
);

-- 3. Players Table
CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL,
    sign_up_date DATE NOT NULL,
    CONSTRAINT chk_email CHECK (email LIKE '%@%.%'),
    CONSTRAINT chk_username_length CHECK (LENGTH(username) >= 3)
);

-- 4. Achievements Table
CREATE TABLE achievements (
    achievement_id SERIAL PRIMARY KEY,
    game_id INTEGER NOT NULL REFERENCES games(game_id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    description TEXT,
    point_value INTEGER NOT NULL CHECK (point_value >= 0)
);

-- 5. Player Achievements Join Table (Composite Primary Key)
CREATE TABLE player_achievements (
    player_id INTEGER NOT NULL REFERENCES players(player_id) ON DELETE CASCADE,
    achievement_id INTEGER NOT NULL REFERENCES achievements(achievement_id) ON DELETE CASCADE,
    unlocked_at TIMESTAMP NOT NULL,
    PRIMARY KEY (player_id, achievement_id),
    CONSTRAINT chk_unlock_time CHECK (unlocked_at <= CURRENT_TIMESTAMP)
);

-- Indexes for performance (Part 2, item g)
-- Index 1: Speeds up querying achievements unlocked by specific players over time
CREATE INDEX idx_player_achievements_unlocked ON player_achievements(player_id, unlocked_at);

-- Index 2: Speeds up filtering games by studio and release date
CREATE INDEX idx_games_studio_date ON games(studio_id, release_date);
