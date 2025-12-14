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

-- Users table (Students, Club Admins, Super Admins)
CREATE TABLE IF NOT EXISTS users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_role (role)
);



-- ======================
-- Step 3: Insert Default Data
-- ======================

-- Insert default super admin (Password: admin123)
-- Note: Password is BCrypt hashed
INSERT INTO users (email, password, first_name, last_name, role) 
VALUES ('admin@university.edu', '$2a$10$e0MYzXyjpJS7Pd0RVvHwHe1p2uyLQCxSPPQH3HFqNcPWoqTp/xCgO', 'Super', 'Admin', 'SUPER_ADMIN')
ON DUPLICATE KEY UPDATE email=email;



-- ======================
-- Step 4: Verification Queries
-- ======================

-- Check if tables are created
SELECT 'Tables created successfully' AS status;
SELECT COUNT(*) as user_count FROM users;


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
