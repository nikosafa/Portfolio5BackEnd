DROP DATABASE IF EXISTS cafe_port;
CREATE DATABASE IF NOT EXISTS cafe_port;
use cafe_port;

CREATE TABLE cafes (
    cafe_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    wifi BOOLEAN DEFAULT FALSE,
    music VARCHAR(50),
    price_level ENUM('cheap', 'moderate', 'expensive'),
    has_food BOOLEAN DEFAULT FALSE,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE favorites (
    favorite_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    cafe_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (cafe_id) REFERENCES cafes(cafe_id) ON DELETE CASCADE
);

INSERT INTO cafes (name, city, wifi, price_level, has_food, latitude, longitude)
VALUES 
    ('Cafe Norden', 'Copenhagen', TRUE, 'expensive', TRUE, 55.6791, 12.5778),
    ('The Coffee Collective', 'Copenhagen', TRUE, 'moderate', TRUE, 55.6872, 12.5623),
    ('Paludan Bog & Café', 'Copenhagen', TRUE, 'cheap', TRUE, 55.6805, 12.5770),
    ('Atelier September', 'Copenhagen', TRUE, 'expensive', FALSE, 55.6803, 12.5858),
    ('Prolog Coffee Bar', 'Copenhagen', TRUE, 'moderate', FALSE, 55.6669, 12.5564),
    ('Democratic Coffee', 'Copenhagen', TRUE, 'moderate', TRUE, 55.6775, 12.5708),
    ('Sonny', 'Copenhagen', TRUE, 'expensive', TRUE, 55.6798, 12.5720),
    ('Rist Kaffebar', 'Copenhagen', TRUE, 'cheap', TRUE, 55.6804, 12.5638),
    ('Kaffekilden', 'Copenhagen', TRUE, 'cheap', FALSE, 55.6705, 12.5484),
    ('Original Coffee', 'Copenhagen', TRUE, 'moderate', TRUE, 55.6817, 12.5785),
    ('Kaffeplantagen', 'Copenhagen', TRUE, 'cheap', FALSE, 55.6857, 12.5613),
    ('Sweet Treat', 'Copenhagen', TRUE, 'moderate', TRUE, 55.6766, 12.5747),
    ('Cafe Dyrehaven', 'Copenhagen', TRUE, 'cheap', TRUE, 55.6627, 12.5568),
    ('Bastard Cafe', 'Copenhagen', TRUE, 'moderate', TRUE, 55.6732, 12.5686),
    ('Coffee Industry', 'Copenhagen', TRUE, 'expensive', TRUE, 55.6769, 12.5712),
    ('Kompa'' 9', 'Copenhagen', TRUE, 'cheap', TRUE, 55.6816, 12.5725),
    ('Tante T', 'Copenhagen', TRUE, 'moderate', FALSE, 55.6799, 12.5714),
    ('La Esquina', 'Copenhagen', TRUE, 'expensive', TRUE, 55.6787, 12.5741),
    ('Coffee Collective Jægersborggade', 'Copenhagen', TRUE, 'moderate', FALSE, 55.6918, 12.5554),
    ('Espresso House Nørreport', 'Copenhagen', TRUE, 'moderate', TRUE, 55.6837, 12.5712);
