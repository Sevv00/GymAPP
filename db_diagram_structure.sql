Project GymManagement {
  database_type: 'PostgreSQL'
}

Table Users {
  id SERIAL [pk]
  email VARCHAR(255) [unique]
  phone_number VARCHAR(15) [unique]
  password_hash VARCHAR(255) [not null]
  first_name VARCHAR(25)
  last_name VARCHAR(50)
  role ENUM('ADMIN', 'EMPLOYEE', 'CLIENT') [not null]
  created_at TIMESTAMP [default: 'CURRENT_TIMESTAMP']
  last_logged_in_date TIMESTAMP
  is_google BOOLEAN
  discount ENUM('NONE', 'STUDENT', 'MULTISPORT') [default: 'NONE']
  ad_agreement BOOLEAN 
  is_active BOOLEAN [default: true]
  avatar BYTEA
}

Table Offers {
  id SERIAL [pk]
  name VARCHAR(100)
  description TEXT
  price_text VARCHAR(100)
  price MONEY [not null]
  duration_days INT [not null]
  is_permanent BOOLEAN [not null]
  offer_expired_date TIMESTAMP
  created_at TIMESTAMP [default: 'CURRENT_TIMESTAMP']
  created_by INT [ref: > Users.id]
  is_active BOOLEAN [default: true]
}

Table Classes {
  id SERIAL [pk] 
  offer_id INT [ref: > Offers.id, not null]
  description TEXT
  start_time TIMESTAMP
  end_time TIMESTAMP
  instructor_id INT [ref: > Users.id]
  capacity SMALLINT
}

Table ClassRegistrations {
  id SERIAL [pk]
  user_id INT [ref: > Users.id, not null]
  class_id INT [ref: > Classes.id, not null]
  registered_at TIMESTAMP [default: 'CURRENT_TIMESTAMP']
  is_active BOOLEAN [default: true]
}

Table Purchases {
  id SERIAL [pk]
  user_id INT [ref: > Users.id, not null]
  offer_id INT [ref: > Offers.id, not null]
  purchase_date TIMESTAMP [default: 'CURRENT_TIMESTAMP']
  valid_until TIMESTAMP
}

Table GuestActions {
  id SERIAL [pk]
  first_name VARCHAR(100)
  last_name VARCHAR(100)
  email VARCHAR(255)
  phone_number VARCHAR(15)
  purchase_id INT [ref: > Purchases.id, not null]
  created_at TIMESTAMP [default: 'CURRENT_TIMESTAMP']
}

Table TrainingPlans {
  id SERIAL [pk]
  user_id INT [ref: > Users.id, not null]
  created_by INT [ref: > Users.id]
  created_at TIMESTAMP [default: 'CURRENT_TIMESTAMP']
}

Table Workouts {
  id SERIAL [pk]
  user_id INT [ref: > Users.id, not null]
  trainigplan_id INT [ref: > TrainingPlans.id]
  created_by INT [ref: > Users.id]
  created_at TIMESTAMP [default: 'CURRENT_TIMESTAMP']
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
  created_at TIMESTAMP [default: 'CURRENT_TIMESTAMP']
  icon_id INT [ref: > ExerciseIcons.id]
}

Table Sets {
  id SERIAL [pk]
  exercise_id INT [ref: > Exercises.id, not null]
  workout_id INT [ref: > Workouts.id, not null]
  number_of_sets SMALLINT
}

Table ExerciseSets {
  id SERIAL [pk]
  set_id INT [ref: > Sets.id, not null]
  workout_id INT [ref: > Exercises.id, not null]
  number_of_reps SMALLINT
  weight SMALLINT
  duration INTERVAL 
}

Table TrainingLogs {
  id SERIAL [pk]
  user_id INT [ref: > Users.id, not null]
  workout_id INT [ref: > Workouts.id, not null]
  training_date TIMESTAMP [default: 'CURRENT_TIMESTAMP']
  content JSON
}

Table Announcements {
  id SERIAL [pk]
  employee_id INT [ref: > Users.id]
  title VARCHAR(255)
  content TEXT
  created_at TIMESTAMP [default: 'CURRENT_TIMESTAMP']
  created_by INT [ref: > Users.id]
  is_active BOOLEAN [default: true]
}

Table GymInfo {
  id SERIAL [pk]
  opening_hours TEXT [not null]
  description TEXT [not null]
  phone_number_1 CHAR(15) [not null]
  phone_number_2 CHAR(15)
  email_1 VARCHAR(255) [not null]
  email_2 VARCHAR(255)
  updated_by INT [ref: > Users.id, not null]
  updated_at TIMESTAMP [default: 'CURRENT_TIMESTAMP']
}