CREATE TABLE BUSES
( 
  Bus_ID          INT   NOT NULL,
  State           VARCHAR(15)  NOT NULL,  
  Number_assigned VARCHAR(15)  NOT NULL,
  AC              VARCHAR(3),
  nSeater_seats   INT,
  nSleeper_seats  INT,
  Total           INT,
PRIMARY KEY (Bus_ID,State,Number_assigned));

CREATE TABLE BUS_COLORS
(
  Bus_ID          INT   NOT NULL,
  Color           VARCHAR(15)  NOT NULL,  
PRIMARY KEY (Bus_ID,Color),
FOREIGN KEY (Bus_ID) REFERENCES BUSES(Bus_ID));

CREATE TABLE DRIVERS
( 
      Driver_ID          INT   NOT NULL,
      Dr_Name              VARCHAR(15),
      Year_of_Joining       INT,
      Working_Experience    INT,
      nJourneys             INT,
PRIMARY KEY (Driver_ID));

CREATE TABLE PASSENGERS
(
      Pr_ID          INT   NOT NULL,
      Pr_Name              VARCHAR(15),
      Age       INT,
      Gender    CHAR(1),
      Journeys             INT,
PRIMARY KEY (Pr_ID));

CREATE TABLE TICKET_PRICES
(
  Category_of_day           VARCHAR(15)  NOT NULL,  
  Sleeper_price  INT,
    Seater_price  INT,
PRIMARY KEY (Category_of_day));

CREATE TABLE SEATS
(
  Bus_ID          INT   NOT NULL,
  Seat_ID         VARCHAR(15)   NOT NULL,
  Type              VARCHAR(15),
  View             VARCHAR(15),

PRIMARY KEY (Bus_ID,Seat_ID),
FOREIGN KEY (Bus_ID) REFERENCES BUSES(Bus_ID));

CREATE TABLE TICKETS
(
      Pr_ID          INT   NOT NULL,
  Pr_name  VARCHAR(15)      ,
    Bus_ID          INT   NOT NULL,
      Driver_ID          INT,
  Seat_ID          VARCHAR(15)   NOT NULL,
  Date           DATE NOT NULL,
  Pr_Starting_place VARCHAR(15),
    Pr_Dropping_place VARCHAR(15),

PRIMARY KEY (Pr_ID,Bus_ID,Seat_ID,Date,Pr_Starting_place,Pr_Dropping_place),
FOREIGN KEY (Bus_ID) REFERENCES BUSES(Bus_ID),
FOREIGN KEY (Driver_ID) REFERENCES DRIVERS(Driver_ID),
FOREIGN KEY (Pr_ID) REFERENCES PASSENGERS(Pr_ID),
FOREIGN KEY (Bus_ID,Seat_ID) REFERENCES SEATS(Bus_ID,Seat_ID));

CREATE TABLE JOURNEY
(
    Bus_ID          INT   NOT NULL,
      Driver_ID          INT   NOT NULL,
  Date           DATE NOT NULL,
  Pr_Starting_place VARCHAR(15),
    Pr_Dropping_place VARCHAR(15),
PRIMARY KEY (Bus_ID,Date,Pr_Starting_place,Pr_Dropping_place),
FOREIGN KEY (Bus_ID) REFERENCES BUSES(Bus_ID),
FOREIGN KEY (Driver_ID) REFERENCES DRIVERS(Driver_ID));

CREATE TABLE LOCATIONS
(
    Name VARCHAR(15) NOT NULL,
    PIN INT,
    State VARCHAR(15),
    DISTRICT VARCHAR(15),
    PRIMARY KEY (Name));

CREATE TABLE ROUTES
(
    Starting_place VARCHAR(15),
    Middle_Stop1 VARCHAR(15),
    Middle_Stop2 VARCHAR(15),
    Middle_Stop3 VARCHAR(15),
    Final_destination VARCHAR(15),
FOREIGN KEY (Starting_place) REFERENCES LOCATIONS(Name),
FOREIGN KEY (Middle_Stop1) REFERENCES LOCATIONS(Name),
FOREIGN KEY (Middle_Stop2) REFERENCES LOCATIONS(Name),
FOREIGN KEY (Middle_Stop3) REFERENCES LOCATIONS(Name),
FOREIGN KEY (Final_destination) REFERENCES LOCATIONS(Name));

INSERT INTO BUSES
VALUES      ('202','TS','1011','YES',40, 25,65),
 			('201','AP','1234','YES', 40,0,40),
 			('200','TS','1353','NO', 39, 20, 59),
			('199','MP','2315','YES',35,18,53),
 			('198','KA','7648','NO', 39, 20, 59),
 			('197','KL','1743','NO', 35,25,60),
 			('196','TN','9476','NO', 40,24,64),
			('205','KA','1745','YES', 39, 20, 59),
			('303','AP','3645','YES',0,30,30),
			('500','JK','8463','YES',0,30,30);

INSERT INTO DRIVERS
VALUES      ('20','Mahesh','2021', 1, 178),
			('23','Ramesh','2019', 3, 900),
			('34','Arjun','2022', 0, 5),
			('46','Chiranjeevi','1990', 32, 8532),
			('87','Rajini Kanth','1989', 33, 8777),
			('11','Kohli','2003', 19, 6001),
			('38','Ram Charan','2004', 18, 5823),
			('53','Vaishanav','2011', 11, 3223),
			('29','Varun Tej','2011', 11, 3222),
			('76','Sampoornesh','1999', 23, 7344);

INSERT INTO PASSENGERS
VALUES      ('1111','Suresh', 26, 'M', 45),
			('2131','Ramesh', 23, 'M', 54),
			('2352','Mary', 21, 'F', 23),
			('5892','Batman', 40, 'M', 22),
			('3843','Shirley', 42, 'M', 33),
			('5737','Emma Watson', 43, 'F', 68),
			('7827','Balu', 18, 'M', 1),
			('4739','Meghana', 19, 'F', 10),
			('3247','Andy', 78, 'M', 86),
			('2817','Candy', 9, 'F', 12),
			('3829','Ram', 23, 'M', 76),
			('3244','Sita', 23, 'F', 76),
			('8999','Nozdormu', 1000, 'M', 23),
			('9888','John Wick', 35, 'M', 65),
			('7655','Catherine', 32, 'F', 56),
			('3499','Hulk', 26, 'M', 17),
			('9099','Peter Parker', 26, 'M', 102),
			('6007','Green Goblin', 59, 'M', 16),
			('1000','Spiderman', 26, 'M', 201),
			('4599','Angelina', 34, 'F', 58),
			('6998','Kajal', 32, 'F', 36),
			('2314','Samantha', 32, 'F', 32),
			('3489','Superman', 48, 'M', 76),
			('4321','Martha', 54, 'F', 37),
			('3245','Scarlett', 37, 'F', 64),
			('5432','Annabelle', 11, 'F', 2),
			('1987','Justin Beiber', 35, 'M', 77),
			('8791','Selena Gomez', 33, 'F', 29),
			('1999','Halsey', 24, 'F', 69),
			('9991','Jason', 26, 'M', 64);

INSERT INTO SEATS
VALUES      ('196','196-04', 'Seated', 'W'),
            ('202','202-15', 'Seated', 'M'),
            ('199','199-11', 'Sleeper', 'W'),
            ('197','197-23', 'Seated', 'W'),
            ('196','196-32', 'Sleeper', 'M'),
            ('303','303-21', 'Sleeper', 'A'),
            ('202','202-31', 'Seated', 'A'),
            ('500','500-12', 'Sleeper', 'W'),
            ('198','198-01', 'Seated', 'M'),
            ('200','200-43', 'Sleeper', 'A');

INSERT INTO TICKETS
VALUES      ('3843','Shirley', '197', '87','197-23','2001-03-12','Hyderabad','Vishakhapatnam'),
            ('7827','Balu', '202', '11','202-31','2022-03-31','Vijayawada','Hyderabad'),
            ('5892','Batman', '303', '53','303-21','2015-11-11','Kakinada','Bangalore'),
            ('1000','Spiderman', '500', '76','500-12','2012-12-12','Kashmir','Kanya Kumari'),
            ('1999','Halsey', '198', '46','198-01','2000-05-23','Bangalore','Kolkata');

INSERT INTO JOURNEY
VALUES      ('197', '87','2001-03-12','Hyderabad','Vishakhapatnam'),
            ('202', '11','2022-03-31','Vijayawada','Hyderabad'),
            ('303', '53','2015-11-11','Kakinada','Bangalore'),
            ('500', '76','2012-12-12','Kashmir','Kanya Kumari'),
            ('198', '46','2000-05-23','Bangalore','Kolkata');

INSERT INTO BUS_COLORS
VALUES      ('196','Red'),
            ('196','Black'),
            ('197','Black'),
			      ('197','White'),
            ('198','Yellow'),
            ('199','Red'),
            ('200','Blue'),
            ('201','Yellow'),
            ('202','White'),
            ('205','White'),
            ('303','White'),
			      ('500','Red');

INSERT INTO TICKET_PRICES
VALUES      ('Weekend','2500','2000'),
            ('Festive','3000','2400'),
            ('Normal','1800','1000');


INSERT INTO LOCATIONS
VALUES      ('Hyderabad','500032','Telangana','Hyderabad'),
            ('Vijayawada','502355','Andhra Pradesh','NTR'),
			('Guntur','522001','Andhra Pradesh','Guntur'),
            ('Kakinada','533005','Andhra Pradesh','Kakinada'),
            ('Vishakhapatnam','500020','Andhra Pradesh','Hyderabad'),
            ('Rayanapadu','521225','Andhra Pradesh','Guntur'),
            ('Kuppam','517425','Andhra Pradesh','Chittoor'),
            ('Bangalore','530068','Karnataka','Banglore'),
            ('Kashmir','191202','Jammu Kashmir','Jammu Kashmir'),
            ('Lucknow','226001','Uttar Pradesh','Lucknow'),
            ('Delhi','110001','Delhi','Delhi'),
            ('Kanya Kumari','623153','Tamil Nadu','Kanya Kumari'),
            ('Kolkata','700001','West Bengal','Kolkata'),
            ('Secunderabad','500003','Telangana','Secunderabad'),
            ('Rcpuram','533255','Andhra Pradesh','East Godavari'),
            ('Orissa','751001','Orissa','Orissa');

INSERT INTO ROUTES
VALUES      ('Hyderabad','Vijayawada','Guntur','Kakinada','Vishakhapatnam'),
            ('Vijayawada','Guntur','Rayanapadu','Secunderabad','Hyderabad'),
            ('Kakinada','Vishakhapatnam','Rcpuram','Kuppam','Bangalore'),
            ('Kashmir','Lucknow','Delhi','Hyderabad','Kanya Kumari'),
            ('Bangalore','Hyderabad','Vijayawada','Orissa','Kolkata');
