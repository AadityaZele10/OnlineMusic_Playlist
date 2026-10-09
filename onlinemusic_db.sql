create database OnlineMusic;
use OnlineMusic;

CREATE TABLE Employee 
(
    employee_id VARCHAR(50) PRIMARY KEY,
    last_name VARCHAR(50),
    first_name VARCHAR(50),
    title VARCHAR(50),
    reports_to VARCHAR(30),
    levels VARCHAR(10),
    birthdate TIMESTAMP,
    hire_date TIMESTAMP,
    address VARCHAR(120),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(30),
    postal_code VARCHAR(30),
    phone VARCHAR(30),
    fax VARCHAR(30),
    email VARCHAR(50)
);
CREATE TABLE customer 
(
    customer_id VARCHAR(30) PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    company VARCHAR(30),
    address VARCHAR(30),
    city VARCHAR(30),
    state VARCHAR(30),
    country VARCHAR(30),
    postal_code INT,
    phone VARCHAR(30),
    fax VARCHAR(30),
    email VARCHAR(50),
    support_rep_id VARCHAR(30)
);
CREATE TABLE invoice 
(
    invoice_id VARCHAR(30) PRIMARY KEY,
    customer_id VARCHAR(30),
    invoice_date TIMESTAMP,
    billing_address VARCHAR(120),
    billing_city VARCHAR(30),
    billing_state VARCHAR(30),
    billing_country VARCHAR(30),
    billing_postal_code VARCHAR(30),
    total DECIMAL(10,2)
);
CREATE TABLE invoice_line 
(
    invoice_line_id VARCHAR(50) PRIMARY KEY,
    invoice_id VARCHAR(30),
    track_id VARCHAR(30),
    unit_price DECIMAL(10,2),
    quantity INT
);
CREATE TABLE track (
    track_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    album_id VARCHAR(30),
    media_type_id VARCHAR(30),
    genre_id VARCHAR(30),
    composer VARCHAR(100),
    milliseconds BIGINT,
    bytes BIGINT,
    unit_price DECIMAL(10,2)
);
CREATE TABLE playlist (
    playlist_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE playlist_track (
    playlist_id VARCHAR(50),
    track_id VARCHAR(50),
    PRIMARY KEY (playlist_id, track_id),
    FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id),
    FOREIGN KEY (track_id) REFERENCES track(track_id)
);
CREATE TABLE artist (
    artist_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE album (
    album_id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(100),
    artist_id VARCHAR(50)
);
CREATE TABLE media_type (
    media_type_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE genre (
    genre_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100)
);
ALTER TABLE employee
ADD CONSTRAINT fk_employee_reports_to
FOREIGN KEY (reports_to)
REFERENCES employee(employee_id);

ALTER TABLE customer
ADD CONSTRAINT fk_customer_employee
FOREIGN KEY (support_rep_id)
REFERENCES employee(employee_id);

ALTER TABLE invoice
ADD CONSTRAINT fk_invoice_customer
FOREIGN KEY (customer_id)
REFERENCES customer(customer_id);

ALTER TABLE invoice_line
ADD CONSTRAINT fk_invoice_line_invoice
FOREIGN KEY (invoice_id)
REFERENCES invoice(invoice_id);

ALTER TABLE invoice_line
ADD CONSTRAINT fk_invoice_line_track
FOREIGN KEY (track_id)
REFERENCES track(track_id);

ALTER TABLE album
ADD CONSTRAINT fk_album_artist
FOREIGN KEY (artist_id)
REFERENCES artist(artist_id);

ALTER TABLE track
ADD CONSTRAINT fk_track_album
FOREIGN KEY (album_id)
REFERENCES album(album_id);

ALTER TABLE track
ADD CONSTRAINT fk_track_media_type
FOREIGN KEY (media_type_id)
REFERENCES media_type(media_type_id);

ALTER TABLE track
ADD CONSTRAINT fk_track_genre
FOREIGN KEY (genre_id)
REFERENCES genre(genre_id);
