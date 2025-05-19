-- Ustawienie ENUM dla ról użytkowników
CREATE TYPE user_role AS ENUM ('ADMIN', 'EMPLOYEE', 'CLIENT');

-- Tabela: Users
CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    role user_role NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_logged_in_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_google BOOLEAN DEFAULT FALSE,
    google_id VARCHAR(255) UNIQUE,
    is_active BOOLEAN DEFAULT TRUE
);

-- Tabela: GuestActions
CREATE TABLE GuestActions (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255) NOT NULL,
    offer_id INTEGER REFERENCES Offers(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela: Offers
CREATE TABLE Offers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    is_permanent BOOLEAN NOT NULL,
    duration_days INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

-- Tabela: Purchases
CREATE TABLE Purchases (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES Users(id) ON DELETE CASCADE,
    offer_id INTEGER REFERENCES Offers(id),
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valid_until TIMESTAMP
);

-- Tabela: TrainingLogs
CREATE TABLE TrainingLogs (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES Users(id) ON DELETE CASCADE,
    date DATE NOT NULL,
    content TEXT
);

-- Tabela: Announcements
CREATE TABLE Announcements (
    id SERIAL PRIMARY KEY,
    employee_id INTEGER REFERENCES Users(id) ON DELETE SET NULL,
    title VARCHAR(255),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela: GymInfo (tylko jeden rekord domyślnie)
CREATE TABLE GymInfo (
    id SERIAL PRIMARY KEY,
    opening_hours TEXT,
    pricing_info TEXT,
    updated_by INTEGER REFERENCES Users(id),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela: Classes
CREATE TABLE Classes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    instructor_id INTEGER REFERENCES Users(id) ON DELETE SET NULL,
    capacity INTEGER NOT NULL
);

-- Tabela: ClassRegistrations
CREATE TABLE ClassRegistrations (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES Users(id) ON DELETE CASCADE,
    class_id INTEGER REFERENCES Classes(id) ON DELETE CASCADE,
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
