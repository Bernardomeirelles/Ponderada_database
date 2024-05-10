-- Globals

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- Table 'users'

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  id_contact_users INTEGER,
  name TEXT NOT NULL DEFAULT 'NULL',
  email VARCHAR(30),
  senha VARCHAR(50),
  age INTEGER NOT NULL,
  country VARCHAR(50) NOT NULL DEFAULT 'NULL',
  city TEXT NOT NULL DEFAULT 'NULL',
  neighborhood VARCHAR(30),
  gender VARCHAR(10) NOT NULL DEFAULT 'NULL',
  live_type VARCHAR(20) NOT NULL DEFAULT 'NULL',
  build_family VARCHAR(30) NOT NULL DEFAULT 'NULL',
  income VARCHAR(30) NOT NULL DEFAULT 'NULL',
  people_in_house VARCHAR(20) NOT NULL DEFAULT 'NULL'
);

-- Table 'contact_users'

DROP TABLE IF EXISTS contact_users;

CREATE TABLE contact_users (
  id SERIAL PRIMARY KEY,
  complete_name VARCHAR(50),
  phone INTEGER,
  email VARCHAR(30)
);

-- Table 'have_dogs'

DROP TABLE IF EXISTS have_dogs;

CREATE TABLE have_dogs (
  id SERIAL PRIMARY KEY,
  id_contact_users INTEGER,
  id_users INTEGER NOT NULL,
  dog_name VARCHAR(60) NOT NULL DEFAULT 'NULL',
  dog_gender CHAR(1) NOT NULL DEFAULT 'NULL',
  owner CHAR(1) NOT NULL DEFAULT 'NULL',
  neutered CHAR(1) NOT NULL DEFAULT 'NULL',
  time_with_you VARCHAR(30) NOT NULL DEFAULT 'NULL',
  first_dog BOOLEAN NOT NULL DEFAULT 'NULL',
  how_many_pets_in_home VARCHAR(30) NOT NULL DEFAULT 'NULL',
  dog_age VARCHAR(20) NOT NULL DEFAULT 'NULL',
  dog_breed VARCHAR(60) NOT NULL DEFAULT 'NULL',
  where_get VARCHAR(50) NOT NULL DEFAULT 'NULL',
  was_paid CHAR(1) NOT NULL DEFAULT 'NULL',
  age_arrived VARCHAR(20) NOT NULL DEFAULT 'NULL',
  dog_personality VARCHAR(300) NOT NULL DEFAULT 'NULL',
  id_dog_reason VARCHAR(200) NOT NULL DEFAULT 'NULL',
  favorite_dog_traits TEXT NOT NULL DEFAULT 'NULL',
  people_in_decision VARCHAR(50) NOT NULL DEFAULT 'NULL',
  dog_not_home VARCHAR(300) NOT NULL DEFAULT 'NULL',
  vet_frequency VARCHAR(50) NOT NULL DEFAULT 'NULL',
  dog_summary TEXT NOT NULL DEFAULT 'NULL'
);

-- Table 'dog_reason'

DROP TABLE IF EXISTS dog_reason;

CREATE TABLE dog_reason (
  id SERIAL PRIMARY KEY,
  options VARCHAR
);

-- Table 'had_dogs_or_lived_with'

DROP TABLE IF EXISTS had_dogs_or_lived_with;

CREATE TABLE had_dogs_or_lived_with (
  id SERIAL PRIMARY KEY,
  id_users INTEGER NOT NULL,
  id_contact_users INTEGER NOT NULL,
  dog_name VARCHAR(60) NOT NULL DEFAULT 'NULL',
  dog_personality TEXT NOT NULL DEFAULT 'NULL',
  time_with_the_dog VARCHAR(60) NOT NULL DEFAULT 'NULL',
  first_dog_question BOOLEAN NOT NULL DEFAULT 'NULL',
  pets_in_home VARCHAR(15) NOT NULL DEFAULT 'NULL',
  dog_arrived_age VARCHAR(50) NOT NULL DEFAULT 'NULL',
  neutered VARCHAR(10) NOT NULL DEFAULT 'NULL',
  age_neutered VARCHAR(50) NOT NULL DEFAULT 'NULL',
  dog_breed VARCHAR(60) NOT NULL DEFAULT 'NULL',
  dog_origin VARCHAR(60),
  dog_price VARCHAR(20),
  Id_dog_reason VARCHAR(100) NOT NULL DEFAULT 'NULL',
  first_impression_of_dog TEXT NOT NULL DEFAULT 'NULL',
  id_people_in_decision VARCHAR(100),
  most_like TEXT,
  dislike VARCHAR(200),
  go_to_vet BOOLEAN,
  vet_frequency VARCHAR(60) NOT NULL DEFAULT 'NULL',
  last_contact VARCHAR(60),
  dog_age_in_last_contatc VARCHAR(30),
  reasons_of_last_contact VARCHAR(200) NOT NULL DEFAULT 'NULL',
  would_have_New_dog BOOLEAN,
  reason TEXT NOT NULL DEFAULT 'NULL'
);

-- Table 'people_in_decision'

DROP TABLE IF EXISTS people_in_decision;

CREATE TABLE people_in_decision (
  id SERIAL PRIMARY KEY,
  options VARCHAR
);

-- Table 'dont_have_but_want'

DROP TABLE IF EXISTS dont_have_but_want;

CREATE TABLE dont_have_but_want (
  id SERIAL PRIMARY KEY,
  id_user INTEGER,
  dog_size VARCHAR(10),
  dog_coat VARCHAR(10),
  dog_breed VARCHAR(60),
  dog_gender VARCHAR(10),
  id_dog_reason VARCHAR(200),
  thought_a_dogname BOOLEAN,
  dog_name VARCHAR(50),
  prefer_adopt_or_buy VARCHAR(10),
  when_will_recive_the_dog VARCHAR(80),
  personality_you_expect TEXT NOT NULL DEFAULT 'NULL',
  know_about_costs TEXT
);

-- Table 'dont_lived_and_dont_want'

DROP TABLE IF EXISTS dont_lived_and_dont_want;

CREATE TABLE dont_lived_and_dont_want (
  id SERIAL PRIMARY KEY,
  id_users INTEGER,
  why_dont_want VARCHAR(300)
);

-- Foreign Keys

ALTER TABLE users ADD CONSTRAINT fk_contact_users FOREIGN KEY (id_contact_users) REFERENCES contact_users(id);
ALTER TABLE have_dogs ADD CONSTRAINT fk_contact_users FOREIGN KEY (id_contact_users) REFERENCES contact_users(id);
ALTER TABLE have_dogs ADD CONSTRAINT fk_users FOREIGN KEY (id_users) REFERENCES users(id);
ALTER TABLE have_dogs ADD CONSTRAINT fk_dog_reason FOREIGN KEY (id_dog_reason) REFERENCES dog_reason(id);
ALTER TABLE had_dogs_or_lived_with ADD CONSTRAINT fk_users FOREIGN KEY (id_users) REFERENCES users(id);
ALTER TABLE had_dogs_or_lived_with ADD CONSTRAINT fk_contact_users FOREIGN KEY (id_contact_users) REFERENCES contact_users(id);
ALTER TABLE had_dogs_or_lived_with ADD CONSTRAINT fk_dog_reason FOREIGN KEY (Id_dog_reason) REFERENCES dog_reason(id);
ALTER TABLE had_dogs_or_lived_with ADD CONSTRAINT fk_people_in_decision FOREIGN KEY (id_people_in_decision) REFERENCES people_in_decision(id);
ALTER TABLE dont_have_but_want ADD CONSTRAINT fk_users FOREIGN KEY (id_user) REFERENCES users(id);
ALTER TABLE dont_have_but_want ADD CONSTRAINT fk_dog_reason FOREIGN KEY (id_dog_reason) REFERENCES dog_reason(id);
ALTER TABLE dont_lived_and_dont_want ADD CONSTRAINT fk_users FOREIGN KEY (id_users) REFERENCES users(id);