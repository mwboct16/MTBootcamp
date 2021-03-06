CREATE DATABASE Tavernssssss;

DROP TABLE IF EXISTS Sales, ServStatus, Services, ReceivedSups, Supplies, Locations, Roles, Users, BasementRats, Tavern;

  
CREATE TABLE Tavern (
    TavernID INT IDENTITY(1,1),
    TavernName varchar(255),
    LocationID int,
    OwnerID int
);

ALTER TABLE Tavern
ADD
    FOREIGN KEY (TavernID) REFERENCES BasementRats(TavernID),
    FOREIGN KEY (TavernID) REFERENCES Supplies(TavernID),
    FOREIGN KEY (TavernID) REFERENCES ReceivedSups(TavernID),
    FOREIGN KEY (TavernID) REFERENCES Services(TavernID),
    FOREIGN KEY (TavernID) REFERENCES Sales(TavernID)


CREATE TABLE Users (
    userID int IDENTITY(1,1),
    UserName varchar(50),
    RoleID int
);

CREATE TABLE Roles (
    RoleID TINYINT,
    RoleName varchar(50),
    RoleDescription varchar(MAX)
);

ALTER TABLE Users ADD FOREIGN KEY (RoleID) REFERENCES RoleID(RoleID)

CREATE TABLE Locations (
    LocationID int IDENTITY(1,1),
    LocName varchar (100),
);

ALTER TABLE Tavern ADD FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)

CREATE TABLE Supplies (
    SupplyID int IDENTITY(1,1),
    TavernID int not null,
    SupName VARCHAR(255),
    Unit varchar(3),
    Cost DECIMAL(5,2), 
    UpdatedDate DATE,
    quantity int
);

CREATE TABLE ReceivedSups (
    SupplyID int not null,  
    TavernID int not null,
    Cost DECIMAL(5,2),
    AmntRcvd int,
    DateRcvd DATE
);

CREATE TABLE Services (
    ServiceID int IDENTITY(1,1),
    ServName VARCHAR(255),
    StatusID int,
    TavernID int not null,
);

CREATE TABLE ServStatus (
    StatusID int IDENTITY(1,1),
    ServName VARCHAR not null,
    StatusName varchar(255)
);

CREATE TABLE SALES (
    ServiceID int not null,
    TavernID int not null,
    Guest VARCHAR(255),
    Price DECIMAL(5,2),
    DatePurchased DATE,
    AmountPurchased int
);

CREATE TABLE Guests (
    GuestID int PRIMARY KEY IDENTITY(1,1),
    GuestName varchar(20),
    Notes varchar(MAX),
    GuestStatus int not null,
)

ALTER TABLE Guests ADD FOREIGN KEY (GuestStatus) REFERENCES GuestStatus(StatusID)

CREATE TABLE GuestClass (
    GuestID int,
    GuestStatus int,
    GuestLvl int
)

ALTER TABLE GuestClass
ADD
    FOREIGN KEY (GuestID) REFERENCES Guests(GuestID),
    FOREIGN KEY (GuestStatus) REFERENCES GuestStatus(StatusID)


CREATE TABLE GuestStatus (
    StatusID int PRIMARY Key IDENTITY(1,1),
    StatusName varchar(255)
)






INSERT INTO Tavern (TavernName, TavernID)
VALUES 
    ("Moes Tavern", TavernID),
    ("Joes Tavern", TavernID), 
    ("Mikes Tavern", TavernID), 
    ("Jerrys Tavern", TavernID);

INSERT INTO Users (UserName, RoleID)
VALUES
    ('Michael', RoleID),
    ('Gianna', RoleID),
    ('Terrance', RoleID),
    ('Brett', RoleID),
    ('Sean', RoleID);

INSERT INTO Roles (RoleName, RoleDescription)
VALUES
    ("Cashier", "Processes Cash given by customer"),
    ('Waiter/Waitress', 'Caters to the guests in a professional manner'),
    ('Bartender','Gets everyone drinks'),
    ('DJ','Plays music that the guests love that night'),
    ('Cook', 'Cooks fresh food to order');

INSERT INTO Locations (TavernID, LocationID, LocName)
VALUES 
    (TavernID, LocationID, "Camden"),
    (TavernID, LocationID, 'Philadelphia'),
    (TavernID, LocationID,"Cherry Hill"),
    (TavernID, LocationID,"Blackwood"),
    (TavernID, LocationID,'Trenton');

INSERT INTO Supplies (SupplyID, TavernID, UpdatedDate, SupName, Unit, Cost,
 quantity)
VALUES
    (SupplyID, TavernID, UpdatedDate, 'Beer', 'oz', 12, 100),
    (SupplyID, TavernID, UpdatedDate, 'Cups', 'box', 5, 75),
    (SupplyID, TavernID, UpdatedDate, 'Beef', 'lb', 24, 30),
    (SupplyID, TavernID, UpdatedDate, 'Wine', 'oz', 15, 100),
    (SupplyID, TavernID, UpdatedDate, 'Chicken', 'lb', 20, 80);

INSERT INTO ReceivedSups (SupplyID. TavernID, DateRcvd, Cost, AmntRcvd)
VALUES
    (SupplyID. TavernID, DateRcvd, 12, 4),
    (SupplyID. TavernID, DateRcvd, 5, 30),
    (SupplyID. TavernID, DateRcvd, 24, 10),
    (SupplyID. TavernID, DateRcvd, 15, 40),
    (SupplyID. TavernID, DateRcvd, 20, 65);

INSERT INTO Services (ServiceID, StatusID, TavernID, ServName)
VALUES
    (ServiceID, StatusID, TavernID, 'Haircut'),
    (ServiceID, StatusID, TavernID, 'Karaoke'),
    (ServiceID, StatusID, TavernID, 'Therapy'),
    (ServiceID, StatusID, TavernID, 'Sword Sharpening'),
    (ServiceID, StatusID, TavernID, 'Pool');


INSERT INTO ServStatus (StatusID, ServName, StatusName)
VALUES
    (StatusID, ServName, 'Not available'),
    (StatusID, ServName, 'Offline'),
    (StatusID, ServName, 'Discontinued'),
    (StatusID, ServName, 'Active'),
    (StatusID, ServName, 'Active');




INSERT INTO Sales (ServiceID, TavernID, DatePurchased, AmountPurchased, Guest, Price)
VALUES
    (ServiceID, TavernID, DatePurchased, 6, 'Drake', 299999),
    (ServiceID, TavernID, DatePurchased, 17, 'Nicki', 7999),
    (ServiceID, TavernID, DatePurchased, 2, 'Lil Wayne', 40),
    (ServiceID, TavernID, DatePurchased, 40, 'Michael', 29),
    (ServiceID, TavernID, DatePurchased, 8, 'Harry', 899);

    