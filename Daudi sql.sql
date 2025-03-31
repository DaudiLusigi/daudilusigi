-- Create Database
CREATE DATABASE IF NOT EXISTS web_programming_project;
USE web_programming_project;

-- Users Table (Stores form submissions)
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    favorite_foods SET('Steak', 'Pizza', 'Chicken') NOT NULL,
    favorite_quote TEXT NOT NULL,
    education_level ENUM('Jr High', 'High School', 'Bachelor', 'Master', 'PhD') NOT NULL,
    favorite_time ENUM('Morning', 'Day', 'Night') NOT NULL,
    submission_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Admins Table (For login/retrieval page)
CREATE TABLE IF NOT EXISTS admins (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Insert Default Admin (Username: admin, Password: admin123)
INSERT INTO admins (username, password) 
VALUES ('admin', SHA2('admin123', 256));