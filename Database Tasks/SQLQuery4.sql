CREATE DATABASE Hotel_Booking_System;

USE Hotel_Booking_System;

CREATE TABLE Guests (
    Guest_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Guest_Name VARCHAR(255) NOT NULL,
    Contact_Number VARCHAR(15) NOT NULL UNIQUE,
    ID_Proof_Info INT NOT NULL
);

CREATE TABLE Hotel (
    Hotel_ID INT PRIMARY KEY,
    Location VARCHAR(255) NOT NULL,
    Contact_Number VARCHAR(15) NOT NULL,
    Hotel_Name VARCHAR(255) UNIQUE NOT NULL,
    Rating DECIMAL(2, 1) DEFAULT 0.0 CHECK (Rating BETWEEN 0.0 AND 5.0)
);

CREATE TABLE Room (
    Room_id int identity(1,1) not null primary key,
    Hotel_id int not null,
    Room_num varchar(5) not null unique, 
    Room_type varchar(10) not null,
    Price decimal(10, 2) not null check (price > 0), 
    Room_availability bit default 1, 
    Foreign key (Hotel_ID) references Hotel(Hotel_ID)
        On Delete cascade
        On Update cascade, 
     Check (Room_type in ('Single', 'Double', 'Suite'))
);


CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY,
    Booking_Date DATE NOT NULL,
    Check_IN DATE NOT NULL,
    Check_OUT DATE NOT NULL,
    Room_ID INT NOT NULL,
    Guest_ID INT NOT NULL,
    Total_Cost DECIMAL(10, 2) NOT NULL CHECK (Total_Cost > 0),
    Status VARCHAR(50) DEFAULT 'Pending' CHECK (Status IN ('Pending', 'Confirmed', 'Canceled', 'Check-in', 'Check-out')),
    FOREIGN KEY (Guest_ID) REFERENCES Guests(Guest_ID) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
    CHECK (Check_IN <= Check_OUT)
);

CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY,
    Staff_Name VARCHAR(255),
    Position VARCHAR(255),
    Contact_Number VARCHAR(15),
    Hotel_ID INT,
    FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID)
);

CREATE TABLE Payment (
    Payment_ID INT NOT NULL PRIMARY KEY,
    Payment_Date DATE NOT NULL,
    Method VARCHAR(50) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL CHECK (Amount > 0),
    Booking_ID INT NOT NULL,
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);

CREATE TABLE Review (
    Review_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Guest_ID INT NOT NULL,
    Hotel_ID INT NOT NULL,
    Review_Date DATE NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Comment VARCHAR(255) DEFAULT 'No Comments',
    FOREIGN KEY (Guest_ID) REFERENCES Guests(Guest_ID) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE,
    FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID) 
	ON DELETE CASCADE 
	ON UPDATE CASCADE
);

insert into Guests (Guest_Name, Contact_Number, ID_Proof_Info) values 
('Alice Johnson', '1234567890', 101),
('Bob Smith', '0987654321', 102),
('Charlie Brown', '1122334455', 103);
select * from Guests;

insert into Hotel (Hotel_ID, Location, Contact_Number, Hotel_Name, Rating) values 
(1, 'Muscat' , '123846' , 'Center Hotel' , 3.4),
(2, 'Ibra', '5551112222', 'Grand Central Hotel', 4.5),
(3, 'Sur', '3948944', 'Grand Central Hotel', 7.9);
select * from Hotel;





