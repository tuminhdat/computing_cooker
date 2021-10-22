DROP TABLE users IF EXISTS;

CREATE TABLE users (
    UserID int AUTO_INCREMENT PRIMARY KEY,
    LastName varchar(255),
    FirstName varchar(255),
    Age int,
    Email varchar(255),
    Description varchar(255),
    UserName varchar(255) NOT NULL,
    UserPassword varchar(255) NOT NULL
);