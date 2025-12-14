-- UniVerse Database Migration File
-- Version: 1.0
-- Date: 2025-12-12
-- Description: Initial database schema for University Club Management System

-- ======================
-- Step 1: Create Database
-- ======================
CREATE DATABASE IF NOT EXISTS universe_db;
USE universe_db;

-- ======================
-- Step 2: Create Tables
-- ======================


-- Events table
CREATE TABLE IF NOT EXISTS events (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    event_date DATETIME NOT NULL,
    location VARCHAR(255),
    club_id BIGINT,
    created_by BIGINT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (club_id) REFERENCES clubs(id) ON DELETE CASCADE,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_club (club_id),
    INDEX idx_date (event_date)
);



-- ======================
-- Step 3: Insert Default Data
-- ======================

-- Insert default super admin (Password: admin123)
-- Note: Password is BCrypt hashed


-- Insert sample events
INSERT INTO events (title, description, event_date, location, club_id, created_by) VALUES
('Hackathon 2025', '24-hour coding competition with amazing prizes!', '2025-12-20 09:00:00', 'Computer Lab A', 1, NULL),
('Photo Walk', 'Explore the campus and capture beautiful moments.', '2025-12-18 15:00:00', 'Main Campus', 2, NULL),
('Concert Night', 'Live performances by talented student musicians.', '2025-12-22 18:00:00', 'University Auditorium', 3, NULL),
('Debate Championship', 'Inter-university debate competition.', '2025-12-25 14:00:00', 'Conference Hall', 4, NULL),
('Sports Day', 'Annual sports day with various competitive events.', '2026-01-10 08:00:00', 'Sports Complex', 5, NULL)
ON DUPLICATE KEY UPDATE title=title;

-- ======================
-- Step 4: Verification Queries
-- ======================

-- Check if tables are created
SELECT 'Tables created successfully' AS status;
SELECT COUNT(*) as event_count FROM events;

-- ======================
-- For Team Collaboration
-- ======================
-- Each team member should:
-- 1. Create their own MySQL database locally
-- 2. Run this file to create the schema
-- 3. Update backend/src/main/resources/application.properties with their MySQL password
-- 4. Never commit database credentials to GitHub
-- 5. Use .env file or application-local.properties for local settings

-- ======================
-- Rollback (if needed)
-- ======================
-- DROP DATABASE IF EXISTS universe_db;
