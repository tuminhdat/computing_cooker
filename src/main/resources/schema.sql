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

CREATE TABLE recipes (
	RecipeID int AUTO_INCREMENT PRIMARY KEY,
	RecipeTitle varchar(255) NOT NULL,
	Description varchar(max),
	PrepTime int,
	TotalTime int,
	NumServe int,
	Ingredient varchar(max) NOT NULL,
	Preparation varchar(max) NOT NULL,
	Author varchar(max), 
	UserID int
);

CREATE TABLE comments (
	CommentID int AUTO_INCREMENT PRIMARY KEY,
	Content varchar(max),
	UserID int,
	RecipeID int,
	MenuID int
);

CREATE TABLE menus (
	MenuID int AUTO_INCREMENT PRIMARY KEY,
	MenuTitle varchar(255) NOT NULL,
	Description varchar(max)
);

CREATE TABLE menurecipe (
	RecipeID int,
	MenuID int,
	RecipeTitle varchar(255),
	PRIMARY KEY (RecipeID, MenuID)
);