drop database if exists conferenceDB;
create database conferenceDB;
use conferenceDB;

create table Subcommittee(
	name varchar(255) not null primary key
);

create table Member (
	id integer primary key,
	fname varchar(60) not null,
	lname varchar(60) not null
);

create table Attendee (
	id integer primary key,
	fname varchar(60) not null,
	lname varchar(60) not null,
	fee decimal(6,2) not null
);

create table Room (
	number integer primary key,
	numBeds integer not null
);

create table Company (
	name varchar(255) not null primary key,
	sponsorshipLevel enum('Platinum', 'Gold', 'Silver', 'Bronze') not null,
	emailsSent integer not null
);

create table Session (
	id integer primary key,
	name varchar(255) not null,
	date DATE not null,
	startTime TIME not null,
	endTime TIME not null,
	location varchar(100) not null
);

create table SubcommitteeMember (
	subcommitteeName varchar(255) not null,
	memberId integer not null,
	primary key (subcommitteeName, memberId),
	foreign key (subcommitteeName) references Subcommittee(name) on delete cascade,
	foreign key (memberId) references Member(id) on delete cascade
);

create table SubcommitteeChair (
	subcommitteeName varchar(255) not null primary key,
	chairId integer not null,
	foreign key (subcommitteeName) references Subcommittee(name) on delete cascade,
	foreign key (chairId) references Member(id) on delete cascade
);

create table Student (
	id integer primary key,
	roomNumber integer,
	foreign key (id) references Attendee(id) on delete cascade,
	foreign key (roomNumber) references Room(number)
);

create table Professional (
	id integer primary key,
	foreign key (id) references Attendee(id) on delete cascade
);

create table Sponsor (
	id integer primary key,
	companyName varchar(255) not null,
	foreign key (id) references Attendee(id) on delete cascade,
	foreign key (companyName) references Company(name) on delete cascade
);

create table Speaker (
	attendeeId integer primary key,
	foreign key (attendeeId) references Attendee(id) on delete cascade
);

create table SpeakerSession (
	speakerId integer not null,
	sessionId integer not null,
	primary key (speakerId, sessionId),
	foreign key (speakerId) references Speaker(attendeeId) on delete cascade,
	foreign key (sessionId) references Session(id) on delete cascade
);

create table JobAd (
	id integer not null,
	companyName varchar(255) not null,
	title varchar(100) not null,
	city varchar(255) not null,
	province char(2) not null,
	salary decimal(10,2) not null,
	primary key (companyName, id),
	foreign key (companyName) references Company(name) on delete cascade
);


insert into Subcommittee(name) values ('Program Committee'), ('Registration Committee'), ('Sponsorship Committee'), ('Logistics Committee'), ('Technical Committee'), ('Social Committee'), ('Finance Committee'), ('Publicity Committee');

insert into Member(id, fname, lname) values (1, 'John', 'Smith'), (2, 'Alice', 'Johnson'), (3, 'Bob', 'Brown'), (4, 'Carol', 'Davis'), (5, 'David', 'Wilson'), (6, 'Emma', 'Miller'), (7, 'Frank', 'Garcia'), (8, 'Grace', 'Lee');

insert into Attendee(id, fname, lname, fee) values (101, 'Sarah', 'Alpha', 50.00), (102, 'Zoe', 'Beta', 50.00), (103, 'Nicole', 'Gamma', 50.00), (104, 'Sophie', 'Delta', 50.00), (105, 'John', 'Epsilon', 50.00), (106, 'Christian', 'Zeta', 50.00), (107, 'Ryley', 'Eta', 50.00), (108, 'Carol', 'Theta', 50.00);

insert into Attendee(id, fname, lname, fee) values (201, 'Harry', 'One', 100.00), (202, 'Kate', 'Two', 100.00), (203, 'Leo', 'Three', 100.00), (204, 'Johnny', 'Four', 100.00), (205, 'Louise', 'Five', 100.00), (206, 'Evan', 'Six', 100.00), (207, 'Ryan', 'Seven', 100.00), (208, 'Luke', 'Eight', 100.00);

insert into Attendee(id, fname, lname, fee) values (301, 'Georgia', 'Allan', 0.00), (302, 'Brigit', 'Brown', 0.00), (303, 'Cailin', 'Colton', 0.00), (304, 'Dylan', 'Duke', 0.00), (305, 'Maggie', 'Evans', 0.00), (306, 'Renee', 'Francois', 0.00), (307, 'Evelyn', 'George', 0.00), (308, 'Sophia', 'Harris', 0.00);

insert into Room(number, numBeds) values (101, 2), (102, 2), (103, 1), (104, 2), (105, 1), (106, 2);

insert into Company(name, sponsorshipLevel, emailsSent) values ('Tech Company', 'Platinum', 0), ('Consulting Inc', 'Gold', 1), ('Environment Company', 'Silver', 2), ('Marketing Agency', 'Bronze', 0), ('Global Enterprises', 'Gold', 3), ('Future Tech', 'Platinum', 0), ('Creative Solutions', 'Silver', 1), ('Next Gen', 'Bronze', 0);

insert into Session(id, name, date, startTime, endTime, location) values (1, 'Opening Speeches', '2025-01-15', '09:00:00', '10:00:00', 'Main Hall'), (2, 'Tech Trends', '2025-01-15', '10:30:00', '11:30:00', 'Room A'), (3, 'Market Innovations', '2025-01-15', '12:00:00', '13:00:00', 'Room B'), (4, 'Networking Lunch', '2025-01-15', '13:00:00', '14:00:00', 'Cafeteria'), (5, 'Afternoon Workshop', '2025-01-15', '14:30:00', '16:00:00', 'Room A'), (6, 'Panel Discussion', '2025-01-15', '16:30:00', '17:30:00', 'Main Hall'), (7, 'Evening Social', '2025-01-15', '18:00:00', '20:00:00', 'Lobby'), (8, 'Closing Remarks', '2025-01-15', '20:30:00', '21:00:00', 'Main Hall');

insert into SubcommitteeMember(subcommitteeName, memberId) values ('Program Committee', 1), ('Registration Committee', 2), ('Sponsorship Committee', 3), ('Logistics Committee', 4), ('Technical Committee', 5), ('Social Committee', 6), ('Finance Committee', 7), ('Publicity Committee', 8);

insert into SubcommitteeChair(subcommitteeName, chairId) values ('Program Committee', 1), ('Registration Committee', 3), ('Sponsorship Committee', 5), ('Logistics Committee', 7), ('Technical Committee', 8), ('Social Committee', 2), ('Finance Committee', 4), ('Publicity Committee', 6);

insert into Student(id, roomNumber) values (101, 101), (102, 102), (103, 103), (104, 104), (105, 105), (106, 106), (107, 101), (108, 102);

insert into Professional(id) values (201), (202), (203), (204), (205), (206), (207), (208);

insert into Sponsor(id, companyName) values (301, 'Tech Company'), (302, 'Consulting Inc'), (303, 'Environment Company'), (304, 'Marketing Agency'), (305, 'Global Enterprises'), (306, 'Future Tech'), (307, 'Creative Solutions'), (308, 'Next Gen');

insert into Speaker(attendeeId) values (101), (103), (104), (201), (203), (205), (208);

insert into JobAd(id, companyName, title, city, province, salary) values (1, 'Tech Company', 'Software Engineer', 'Vancouver', 'BC', 120000.00), (2, 'Consulting Inc', 'Marketing Manager', 'Toronto', 'ON', 90000.00), (3, 'Environment Company', 'Data Scientist', 'Calgary', 'AB', 110000.00), (4, 'Marketing Agency', 'Sales Associate', 'Toronto', 'ON', 70000.00), (5, 'Global Enterprises', 'Financial Analyst', 'Markham', 'ON', 80000.00), (6, 'Future Tech', 'Product Manager', 'Montreal', 'QC', 115000.00), (7, 'Creative Solutions', 'Graphic Designer', 'Toronto', 'ON', 65000.00), (8, 'Next Gen', 'Business Analyst', 'Winnipeg', 'MB', 85000.00);

insert into SpeakerSession(speakerId, sessionId) values (101, 1), (103, 2), (104, 3), (201, 4), (203, 5), (205, 6), (208, 7), (101, 8);
