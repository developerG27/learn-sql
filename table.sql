CREATE DATABASE library;

CREATE TABLE IF NOT EXISTS books(
  book_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  author_id INTEGER UNSIGNED,
  title VARCHAR(100) NOT NULL,
  year INTEGER UNSIGNED NOT NULL DEFAULT 1900,
  language VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Language',
  cover_url VARCHAR(500),
  price DOUBLE(6,2) NOT NULL DEFAULT 10.0,
  sellable TINYINT(1) DEFAULT 1,
  copies INTEGER NOT NULL DEFAULT 1,
  description TEXT
);

CREATE TABLE IF NOT EXISTS authors(
  author_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  nationality VARCHAR(3)
);

CREATE TABLE IF NOT EXISTS clients(
  client_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  birthdate DATETIME,
  gender ENUM('M','F','ND') NOT NULL,
  active TINYINT(1) NOT NULL DEFAULT 1,
  create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS operations(
  operations_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  book_id INTEGER UNSIGNED,
  client_id INTEGER UNSIGNED,
  type ENUM('prestado', 'devuelto', 'vendido') NOT NULL,
  create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  finished TINYINT(1) NOT NULL
);

INSERT INTO authors VALUES('', 'Juan Rulfo','MEX');
INSERT INTO authors(name, nationality) VALUES('Gabriel Garcia Marquez','COL');
INSERT INTO authors VALUES(NULL,'Juan Gabriel Vasquez','COL');


INSERT INTO authors(name, nationality) VALUES
('Gian Pumayalla','IT'),
('Sabrina Paola','IT'),
('Katherine Pumayalla','IT'),
('Luigi Garni','ES');


INSERT INTO `clients`(client_id, name, email, birthdate, gender, active) VALUES
(1, 'Martha Buitrago', 'marthab@hotmail.com', '1970-12-01', 'F', 1), 
(2, 'Diana vargas', 'dianav@hotmail.com', '1980-02-15', 'F', 1), 
(3, 'Ricardo Díaz', 'ricardod@hotmail.com', '1991-04-09', 'M', 1), 
(4, 'Harvery Torres', 'harveyt@hotmail.com', '1985-08-25', 'M', 1);


INSERT INTO books(title, author_id, `year`)
VALUES('Vuelta al Laberinto de la Soledad', (
  SELECT author_id FROM authors 
  WHERE name = 'Octavio Paz'
  LIMIT 1
  ),1960
);