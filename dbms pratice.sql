Create Database if not exists TravelOnTheGo1  ;
use TravelOnTheGo1 ;
CREATE TABLE IF NOT EXISTS Passenger (Id int auto_increment  primary key,
  Passenger_name varchar (50),
  Category               varchar(50),
   Gender                 varchar(10),
   Boarding_City      varchar(50),
   Destination_City   varchar(50),
  Distance                int,
  Bus_Type             varchar(50)
);
CREATE TABLE IF NOT EXISTS price (
             Bus_Type varchar(50),
             Distance   int,
              Price int
             );
insert into Passenger values(default,'sejal','AC','F','bengaluru','chennai','350','sleeper');    
insert into Passenger values(default,'Anmol','non-Ac','M','mumbai ','hyderbad','700','sitting'); 
insert into Passenger values(default,'Pallavi','Ac','F','Panaji ','bengaluru','600','sleeper '); 
insert into Passenger values(default,'Khusboo','Ac','F','Chennai ','mumbai','1500','sleeper'); 
insert into Passenger values(default,'Udit','non-Ac','M','Trivandrum ','panaji','1000','sleeper'); 
insert into Passenger values(default,'Ankur','Ac','M','nagpur','hyderbad','500','sitting'); 
insert into Passenger values(default,'Hemant','non-Ac','M','panaji','mumbai','700','sleeper'); 
insert into Passenger values(default,'Manish ','non-Ac','M','Hyderabad ','mumbai','500','sitting'); 
insert into Passenger values(default,'Piyush ','Ac','M','Pune ','nagpur','700','sitting');    
insert into  price values('Sleeper',350,770); 
insert into  price values('Sleeper',500,1100);
insert into  price values('Sleeper',600,1320); 
insert into  price values('Sleeper',700,1540); 
insert into  price values('Sleeper',1000,2206); 
insert into  price values('Sleeper',1200,2640); 
insert into  price values('Sleeper',1500,2700); 
insert into  price values('Sitting',500,620);
insert into  price values('Sitting',600,744);
insert into  price values('Sitting',700,868);
insert into  price values('Sitting',1000,1240);
insert into price values('Sitting',1200,1488);
/* q.3 How many females and how many male passengers travelled for a minimum distance of 600 KM s?
*/
select Gender, count(Gender) as Count from passenger where distance>=600 group by Gender;
/* Q.NO 4 ⦁	Find the minimum ticket price for Sleeper Bus. */
select min(price)as Minimum_price from price where Bus_Type='Sleeper';
/* Q.NO 5 ⦁	Select passenger names whose names start with character 'S' 

select passenger_name from passenger where passenger_name like 's%';
/* q .no 6	Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output*/
select a.passenger_name,a.Boarding_City,a.Destination_City ,a.Bus_type,b.price from passenger a,price b where
(a.Bus_Type=b.Bus_Type and a. Distance =b.Distance);
/* Q.no 7 ⦁	What are the passenger name/s and his/her ticket price who travelled in the Sitting bus  for a distance of 1000 KM s 
  */
  select a.passenger_name,b.price from passenger a,price b where (a.Bus_Type="Sitting" and b.Bus_Type="Sitting" and a.Distance= 700 and b.Distance=700);
  /* q .no 8 ⦁	What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
 */
 select Price from price where Distance =(select Distance from passenger where
 (Boarding_City="bengaluru" and Destination_City="panaji")
 or (Boarding_City= "panaji" and Destination_City="bengaluru" ));
 /* q no .9 ⦁	 List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.
*/
select distinct (Distance) from passenger order by Distance desc;
/* q no.10 ⦁	Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables   */
select Passenger_name,(Distance/(select sum(Distance) from passenger))* 100 as percentage_travel from Passenger;