Project GymManagement {
  database_type: 'PostgreSQL'
}

Table Users {
  id SERIAL [pk]
  email VARCHAR(255) [unique]
  phone_country_code VARCHAR(3)
  mobile_phone_number VARCHAR(9)
  password_hash VARCHAR(255)
  first_name VARCHAR(100)
  last_name VARCHAR(100)
  role ENUM('ADMIN', 'EMPLOYEE', 'CLIENT')
  created_at TIMESTAMP
  last_logged_in_date TIMESTAMP
  is_google BOOLEAN
  discount ENUM('NONE', 'STUDENT', 'MULTISPORT')
  google_id VARCHAR(255) [unique]
  ad_agreement BOOLEAN
  is_active BOOLEAN
  avatar BYTEA
}

Table Offers {
  id SERIAL [pk]
  name VARCHAR(100)
  description TEXT
  price_text VARCHAR(100)
  price DECIMAL(10, 2)
  duration_days INT
  is_permanent BOOLEAN
  offer_expired_date TIMESTAMP
  created_at TIMESTAMP
  created_by INT [ref: > Users.id]
  is_active BOOLEAN
}

Table Classes {
  id SERIAL [pk]
  offer_id INT [ref: > Offers.id]
  description TEXT
  start_time TIMESTAMP
  end_time TIMESTAMP
  instructor_id INT [ref: > Users.id]
  capacity INT
}

Table ClassRegistrations {
  id SERIAL [pk]
  user_id INT [ref: > Users.id]
  class_id INT [ref: > Classes.id]
  registered_at TIMESTAMP
  is_active BOOLEAN
}

Table Purchases {
  id SERIAL [pk]
  user_id INT [ref: > Users.id]
  offer_id INT [ref: > Offers.id]
  purchase_date TIMESTAMP
  valid_until TIMESTAMP
}

Table GuestActions {
  id SERIAL [pk]
  first_name VARCHAR(100)
  last_name VARCHAR(100)
  email VARCHAR(255)
  phone_country_code VARCHAR(3)
  mobile_phone_number VARCHAR(9)
  purchase_id INT [ref: > Purchases.id]
  created_at TIMESTAMP
}

Table TrainingPlans {
  id SERIAL [pk]
  user_id INT [ref: > Users.id]
  created_by INT [ref: > Users.id]
  created_at TIMESTAMP
  is_active BOOLEAN
}

Table Workouts {
  id SERIAL [pk]
  user_id INT [ref: > Users.id]
  trainigplan_id INT [ref: > TrainingPlans.id]
  created_by INT [ref: > Users.id]
  created_at TIMESTAMP
  is_active BOOLEAN
}

Table ExerciseIcons {
  id SERIAL [pk]
  name VARCHAR(50)
  avatar BYTEA
}

Table Exercises {
  id SERIAL [pk]
  name VARCHAR(100)
  user_id INT [ref: > Users.id]
  created_by INT [ref: > Users.id]
  created_at TIMESTAMP
  is_active BOOLEAN
  icon_id INT [ref: > ExerciseIcons.id]
}

Table Sets {
  id SERIAL [pk]
  exercise_id INT [ref: > Exercises.id]
  workout_id INT [ref: > Workouts.id]
  number_of_sets INT
}

Table ExerciseSets {
  id SERIAL [pk]
  set_id INT [ref: > Sets.id]
  workout_id INT [ref: > Exercises.id]
  number_of_reps INT
  weight INT
  time TIMESTAMP
}

Table TrainingLogs {
  id SERIAL [pk]
  user_id INT [ref: > Users.id]
  workout_id INT [ref: > Workouts.id]
  date DATE
  content JSON
}

Table Announcements {
  id SERIAL [pk]
  employee_id INT [ref: > Users.id]
  title VARCHAR(255)
  content TEXT
  created_at TIMESTAMP
  created_by INT [ref: > Users.id]
  is_active BOOLEAN
}

Table GymInfo {
  id SERIAL [pk]
  opening_hours TEXT
  description TEXT
  phone_country_code_1 VARCHAR(3)
  phone_number_1 CHAR(9)
  phone_country_code_2 VARCHAR(3)
  phone_number_2 CHAR(9)
  email_1 VARCHAR(255)
  email_2 VARCHAR(255)
  updated_by INT [ref: > Users.id]
  updated_at TIMESTAMP
}