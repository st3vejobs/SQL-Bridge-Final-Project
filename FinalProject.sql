-- Shane Hylton SQL Bridge Final Project

-- Table Creation


DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS group_access;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS groups_;


CREATE TABLE groups_ (
	groupID int NOT NULL AUTO_INCREMENT,
    Department varchar(200),
    PRIMARY KEY (groupID)
    );

INSERT INTO groups_ (Department)
VALUES ('I.T.');
INSERT INTO groups_ (Department)
VALUES ('Sales');
INSERT INTO groups_ (Department)
VALUES ('Administration');
INSERT INTO groups_ (Department)
VALUES ('Operations');


CREATE TABLE rooms (
	roomID int NOT NULL AUTO_INCREMENT,
    Room varchar(200),
    PRIMARY KEY (roomID)
    );
INSERT INTO rooms (Room)
VALUES ('101');
INSERT INTO rooms (Room)
VALUES ('102');
INSERT INTO rooms (Room)
VALUES ('Auditorium A');
INSERT INTO rooms (Room)
VALUES ('Auditorium B');


CREATE TABLE group_access ( 
	groupID int,
    roomID int
    );

INSERT INTO group_access (groupID, roomID)
VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3);


CREATE TABLE users ( 
	userID int NOT NULL AUTO_INCREMENT,
	User_First varchar(200),
    groupID int,
    PRIMARY KEY (userID),
    FOREIGN KEY (groupID) REFERENCES groups_(groupID)
    );
INSERT INTO users (User_First, groupID)
VALUES 
('Modesto', 1),
('Ayine', 1),
('Christopher', 2),
('Cheong woo', 2),
('Saulat', 3);
INSERT INTO users (User_First)
VALUES  ('Heidy');

-- Step 1

SELECT groups_.Department, users.User_First
FROM groups_
	LEFT JOIN 
users ON groups_.groupID = users.groupID;

-- Step 2
SELECT rooms.Room, groups_.Department
FROM 
	rooms
		LEFT JOIN
	group_access ON rooms.roomID = group_access.roomID
		LEFT JOIN
	groups_ ON group_access.groupID = groups_.groupID;

-- Step 3
SELECT users.User_First, groups_.Department, rooms.Room
FROM
	users
		LEFT JOIN
	groups_ ON users.groupID = groups_.groupID
		LEFT JOIN
	group_access ON groups_.groupID = group_access.groupID
		LEFT JOIN 
	rooms ON group_access.roomID = rooms.roomID
ORDER BY users.User_First, groups_.Department, rooms.Room;






