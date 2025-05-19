-- Oferty
INSERT INTO Offers (name, description, price, is_permanent, duration_days) VALUES
('Karnet Miesięczny', 'Nielimitowany dostęp przez 30 dni', 120.00, FALSE, 30),
('Karnet Jednodniowy', 'Dostęp do siłowni przez 1 dzień', 20.00, TRUE, 1);

-- Użytkownicy
INSERT INTO Users (email, password_hash, first_name, last_name, role)
VALUES
('admin@gym.com', 'hashedpass123', 'Admin', 'User', 'ADMIN'),
('pracownik@gym.com', 'hashedpass456', 'Anna', 'Nowak', 'EMPLOYEE'),
('klient@gym.com', 'hashedpass789', 'Jan', 'Kowalski', 'CLIENT');

-- Zakup karnetu
INSERT INTO Purchases (user_id, offer_id, purchase_date, valid_until)
VALUES (3, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL '30 days');

-- Dziennik ćwiczeń
INSERT INTO TrainingLogs (user_id, date, content)
VALUES (3, CURRENT_DATE, 'Trening siłowy: klatka piersiowa, 1h');

-- Ogłoszenie
INSERT INTO Announcements (employee_id, title, content)
VALUES (2, 'Nowe zajęcia fitness', 'Od przyszłego tygodnia startują nowe zajęcia fitness!');

-- Informacje o siłowni
INSERT INTO GymInfo (opening_hours, pricing_info, updated_by)
VALUES ('Pn-Pt: 6:00-22:00, Sb-Nd: 8:00-20:00', 'Karnety od 20 zł do 120 zł', 1);

-- Zajęcia
INSERT INTO Classes (name, description, start_time, end_time, instructor_id, capacity)
VALUES ('Zumba', 'Zajęcia taneczno-ruchowe', '2025-05-15 18:00', '2025-05-15 19:00', 2, 20);

-- Rejestracja na zajęcia
INSERT INTO ClassRegistrations (user_id, class_id)
VALUES (3, 1);
