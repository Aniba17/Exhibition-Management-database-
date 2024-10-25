create database exhibition;

/*Table for organizer*/
create table organizer(
organizerId int primary key,
organizerName varchar(50),
organizerContact varchar(50)
);

/*INSERT VALUES IN organizer TABLE*/
	insert into organizer
	values
	(1, 'jack',023290323)

	/*------------------------ORGANIZER'S PROFILE VIEW*/
	SELECT * FROM organizer;
	/*-----------------------  EXHIBITOR INFORMATION*/
	SELECT * FROM exhibitor;
	/*-----------------------  VISITOR'S INFORMATION*/
	SELECT * FROM visitor;
	/*-----------------------  EVENTS'S INFORMATION*/
	SELECT * FROM event;
	/*-----------------------  TICKET'S INFORMATION*/
	Select count(*) as number_of_tickets_sold from tickets;
	Select SUM(price) as earning from tickets;
	SELECT eventId ,purchaseDate from tickets;
	/*-----------------------  VENUE'S INFORMATION*/
	SELECT 
	v.venueName,
	v.venueCapacity,
	e.eventId
	FROM 
	venue v
	LEFT JOIN
	event e ON v.venueId=e.eventId
	/*-----------------------  BOOTH'S INFORMATION*/
	SELECT boothId, boothSize, boothLocation, boothStatus, boothPrice FROM booth;
	/*-----------------------  BOOTH STAFF'S INFORMATION*/
    SELECT *FROM boothStaff;
	/*-----------------------  FEEEDBACK'S INFORMATION*/
	SELECT * FROM feedback;

/*----------------------------------------------EXHIBITOR--------------------------------------------------------------------*/
	 /*Table for exhibitors*/
create table exhibitor(
exhibitorId int primary key,
exhibitorName varchar(50),
exhibitorContact varchar(50),
exhibitorBoothnumber varchar(50),
exhibitorProduct varchar(50),
exhibitorCountry varchar(50)
);

/*Insert values in exhibitors tale*/		
	insert into exhibitor
	values
	(1,'john', 03016245543,'B1', 'photography', 'America'),
	(2,'Ahad', 03046534234,'B2', 'paintings', 'Ireland'),
	(3,'Aira', 0543464344,'B3', 'handmade_crafts', 'pakistan'),
	(4,'Aniya', 03013343,'B4', 'Art_supplies', 'brasil'),
	(5,'Robin', 0345545543,'B5', 'sculpture', 'Austria')
	
	select *from exhibitor where exhibitorId =1;
	/*-----------------------  EXHIBITOR'S PROFILE INFORMATION*/
	select *from exhibitor;
	/*-----------------------  EXHIBITOR'S BOOTH INFORATION*/
	SELECT 
    e.exhibitorId,
	e.exhibitorBoothnumber,
	b.boothSize,
    b.boothLocation,
    b.boothPrice
FROM 
    exhibitor e
	LEFT JOIN 
    booth b ON e.exhibitorId = b.exhibitorId
	/*-----------------------  EXHIBITOR'S FEEDBACK INFORATION*/
	select comment, rating from feedback where exhibitorId=1 ;

	/*----------------------------------------------VISITOR--------------------------------------------------------------------*/
	create table visitor(
visitorId int primary key,
visitorName varchar(50),
visitorContact varchar(50),
visitorTicketnumber int
);
/*Insert values in visitors table*/		
	insert into visitor
	values
	(1,'Rutherford', 03016245443,1),
	(2,'Ahad', 0304653544,2),
	(3,'Aira', 0543464544,3),
	(4,'Aniya', 0301334354, 4),
	(5,'Robin', 03455455545,5)

	/*-----------------------  VISITOR'S PROFILE INFORMATION*/
	SELECT *FROM VISITOR;
	/*-----------------------  VISITOR'S FEEDBACK INFORATION*/
	select comment, rating from feedback where visitorId=1 
	/*-----------------------  VISITOR'S VENUE and EVENT INFORATION*/
	SELECT
	v.venueName,
    e.startDate,
	e.endDate,
	e.eventId
FROM 
    event e
	LEFT JOIN 
    venue v ON e.venueId = v.venueId
	
	/*----------------------------------------------VENUE--------------------------------------------------------------------*/
/*Table for venue*/
create table venue(
venueId int primary key,
venueName varchar(50),
venueCapacity varchar(50),
);
/*INSERT VALUES IN VENUE TABLE*/
	insert into venue
	values
	(1, 'ExCel_London', 100000),
	(2, 'olympia_London', 110000),
	(3, 'NEC_Birmingham', 120000)
	 SELECT *from venue;
	 /*----------------------------------------------EVENTS--------------------------------------------------------------------*/
/*Table for EVENTS*/
create table event(
eventId int primary key,
startDate date,
endDate date,
venueId int,
FOREIGN key(venueId) references venue(venueId)
);
/*INSERT VALUES IN EVENT TABLE*/
	insert into event
	values
	(1, '2024-03-05', '2024-05-05',2),
	(2, '2024-03-05', '2024-05-05',1)
	SELECT *FROM event;
	/*----------------------------------------------TICKETS--------------------------------------------------------------------*/
/*Table for tickets*/
create table tickets(
ticketId int primary key,
visitorId int,
eventId int,
purchaseDate DATE,
price int,
FOREIGN key(visitorId) REFERENCES visitor(visitorId),
FOREIGN key(eventId) REFERENCES event(eventId)
);
/*INSERT VALUES IN TICKET TABLE*/
	insert into tickets
	values
	(1, 1, 1,'2024-04-05',5000),
	(2, 2, 2,'2024-04-05',6000)
	SELECT *from tickets;
    /*----------------------------------------------FEEDBACK--------------------------------------------------------------------*/
/*Table for feedback*/
create table feedback(
feedbackId int primary key,
visitorId int,
exhibitorId int,
eventId int,
comment text,
rating int,
FOREIGN key(visitorId) references visitor(visitorId),
FOREIGN key(exhibitorId) references exhibitor(exhibitorId),
FOREIGN key(eventId) references event(eventId)
);
/*INSERT VALUES IN FEEDBACK TABLE*/
insert into feedback(feedbackId,exhibitorId,eventId,comment,rating)
values
(1, 1, 1, 'this was an awesome event', 8);
	insert into feedback(feedbackId,visitorId,eventId,comment,rating)
values
(2, 1, 1, 'this was an awesome event', 10);

/*----------------------------------------------BOOTH--------------------------------------------------------------------*/
/*Table for booth*/
create table booth (
    boothId int primary key,
    exhibitorId int,
	boothSize int,
    boothLocation varchar(500),
    boothStatus varchar(50),
    boothPrice int,
   FOREIGN KEY (exhibitorId) REFERENCES exhibitor(exhibitorId)
   );
	/*INSERT VALUES IN BOOTHTABLE TABLE*/
	insert into booth
	values
	(1,1,20,'location_1', 'Ocuppied',10000),
	(2,2,20,'location_2', 'Ocuppied',10000)
    
select *from booth;
/*----------------------------------------------BOOTHSTAFF--------------------------------------------------------------------*/
create table boothStaff (
    StaffId int primary key,
	boothId int,
    staffContact varchar(50),
    staffTimming varchar(50),
    staffRole varchar(50),
   FOREIGN KEY (boothId) REFERENCES booth(boothId)
);
	/*INSERT VALUES IN BOOTHStaffTABLE TABLE*/
	insert into boothStaff
	values
	(1,1,'9383874847','10:00am-5:00pm', 'Role 1'),
	(2,2,'9383874847','10:00am-5:00pm', 'Role 2')

	/*----------------------------------------------SOME QEURIES--------------------------------------------------------------------*/
	SELECT *FROM exhibitor where exhibitorProduct='photography'

	SELECT *FROM venue where venueCapacity>110000;

	SELECT *FROM exhibitor order by exhibitorCountry;

	SELECT max(venueCapacity) as max_capacity_venue from venue;

	SELECT min(venueCapacity) as min_capacity_venue from venue;

	SELECT count(*) as occupied from booth where boothStatus='ocuppied';

	SELECT COUNT(DISTINCT exhibitorProduct) AS distinct_products FROM exhibitor;

	SELECT count(*) as [exhibitorProduct] FROM exhibitor group by exhibitorProduct;

	SELECT *FROM booth where boothPrice between 8000 and 15000;

	SELECT *FROM exhibitor where exhibitorProduct='photography' OR exhibitorProduct='handmadeart' AND exhibitorName ='john';
	
	update booth SET boothprice=8000 where boothprice=10000; 

	SELECT eventId, COUNT(*) AS total_visitors FROM tickets GROUP BY eventId;

	SELECT eventId, SUM(price) AS total_earnings FROM tickets GROUP BY eventId;

	UPDATE exhibitor SET exhibitorContact = 'new_contact_number'WHERE exhibitorId = 1;

	UPDATE booth SET boothStatus = 'Vacant'WHERE boothId = 1;

	UPDATE visitor SET visitorContact = 'new_contact_number'WHERE visitorId = 1;

	UPDATE event SET endDate = '2024-06-09' WHERE eventId = 1;
	select *from event;

	ALTER TABLE exhibitor ADD age int;
	SELECT *from exhibitor;

	ALTER TABLE exhibitor drop column age;
	SELECT *from exhibitor;

	ALTER TABLE event
	ADD CONSTRAINT foreign_key FOREIGN KEY (venueId) REFERENCES venue(venueId);

	DELETE FROM exhibitor WHERE exhibitorId = 1;

	DELETE FROM booth WHERE boothId = 1;

	DELETE FROM feedback WHERE feedbackId = 1;

	drop table if exists feedback;