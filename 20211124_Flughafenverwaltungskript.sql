# Flughafenverwaltung Beispiel
# Wir erzuegen alle Tabellen, Reihenfolge ist egal, da die fk aller Tabellen erst im Anschluss daran hinzugefügt werden

create database db_flughafenverwaltung collate utf8mb4_general_ci;
use db_flughafenverwaltung;
#drop database db_flughafenverwaltung;

create table flight_execution_staff(
	fe_id int unsigned  not null,
    staff_id varchar(50) not null,
    
    constraint flight_execution_staff_pk primary key(fe_id, staff_id)
);

create table flight_execution(
	fe_id int unsigned not null auto_increment,
    departure_date_time datetime not null,
    arrival_date_time datetime not null,
    flight_route varchar(20) not null,
    airline_id int unsigned not null,
    
    constraint flight_execution_pk primary key(fe_id)
);

insert into flight_execution_staff values(1,15);
insert into flight_execution_staff values(2,13);
insert into flight_execution_staff values(3,11);
insert into flight_execution_staff values(4,9);
insert into flight_execution_staff values(5,7);
insert into flight_execution_staff values(6,5);
insert into flight_execution_staff values(7,3);
insert into flight_execution_staff values(8,1);
insert into flight_execution_staff values(9,14);
insert into flight_execution_staff values(10,12);
insert into flight_execution_staff values(11,10);
insert into flight_execution_staff values(12,8);
insert into flight_execution_staff values(13,6);
insert into flight_execution_staff values(14,4);
insert into flight_execution_staff values(15,2);

create table flight_execution_customer(
	fe_id int unsigned not null,
    customer_id varchar(50) not null,
    
    constraint flight_execution_customer_pk primary key(fe_id, customer_id)
);

insert into flight_execution_customer values(1,9);
insert into flight_execution_customer values(2,14);
insert into flight_execution_customer values(3,4);
insert into flight_execution_customer values(4,11);
insert into flight_execution_customer values(5,7);
insert into flight_execution_customer values(6,2);
insert into flight_execution_customer values(7,15);
insert into flight_execution_customer values(8,5);
insert into flight_execution_customer values(9,3);
insert into flight_execution_customer values(10,13);
insert into flight_execution_customer values(11,6);
insert into flight_execution_customer values(12,12);
insert into flight_execution_customer values(13,1);
insert into flight_execution_customer values(14,8);
insert into flight_execution_customer values(15,10);

create table customer(
	customer_id varchar(50) not null,
    f_name varchar(50) not null,
    l_name varchar(50) not null,
    birthdate date not null,
    gender char(1) not null,
    
    constraint customer_pk primary key(customer_id)
);

insert into customer values("1", "Peter", "Lustig", '1996-10-11', "M");
insert into customer values("2", "Lara", "Müller", '2005-1-3', "F");
insert into customer values("3", "Klemens", "Uncool", '2004-7-23', "M");	
insert into customer values("4", "Mohammad", "Ali", '1990-12-31', "M");
insert into customer values("5", "Elena", "Huber", '1984-3-16', "F");
insert into customer values("6", "Sara", "Mayr", '2000-9-12', "F");
insert into customer values("7", "Liam", "Mark", '1999-6-17', "M");
insert into customer values("8", "Maria", "Emmbacher", '1980-2-26', "F");
insert into customer values("9", "Daniel", "Kopp", '1950-6-30', "M");
insert into customer values("10", "Eva", "Lewandowski", '2001-5-16', "F");
insert into customer values("11", "Jere", "Grins", '1977-8-21', "M");
insert into customer values("12", "Mira", "Schnellrieder", '2008-7-23', "F");
insert into customer values("13", "Ege", "Dunkel", '2004-9-30', "M");
insert into customer values("14", "Serena", "Marthe", '1960-5-25', "F");
insert into customer values("15", "Florian", "Peer", '1945-5-22', "M");

create table customer_address(
	customer_id varchar(50) not null,
    address_id int unsigned not null,
    
    constraint customer_address_pk primary key(customer_id, address_id)
);

insert into customer_address values(1,8);
insert into customer_address values(2,7);
insert into customer_address values(3,9);
insert into customer_address values(4,6);
insert into customer_address values(5,10);
insert into customer_address values(6,5);
insert into customer_address values(7,11);
insert into customer_address values(8,4);
insert into customer_address values(9,12);
insert into customer_address values(10,3);
insert into customer_address values(11,13);
insert into customer_address values(12,2);
insert into customer_address values(13,14);
insert into customer_address values(14,1);
insert into customer_address values(15,15);

create table address(
	address_id int unsigned not null auto_increment,
    state varchar(50) not null,
    postalcode varchar(10) not null,
    city varchar(50) not null,
    street varchar(50) not null,
    street_number varchar(10) not null,
    
    constraint address_pk primary key(address_id)
);

insert into address value(null, "Österreich", "6020", "Innsbruck", "Fürstenweg", 180);
insert into address value(null, "Deutschland", "60547", "Frankfurt am Main", "Hugo Eckener Ring", 1);
insert into address value(null, "Österreich", "1300", "Wien", "Einfahrtsstrasse", 1);
insert into address value(null, "Türkei", "7230", "Muratpaşa/Antalya", "Yeşilköy", 1);
insert into address value(null, "Deutschland", "85356", "München", "Nordallee", 25);
insert into address value(null, "USA", "CA90045", "Los Angeles", "World Way", 1);
insert into address value(null, "El Salvador", "SAL", "San Salvador", "Autop. Comalapa", 1);
insert into address value(null, "Vereinigtes Königreich", "E16 2PX", "London", "Hartmann Rd", 1);
insert into address value(null, "Deutschland", "12529", "Schönefeld", "Melli-Beese-Ring", 1);
insert into address value(null, "Schweden", "190 45", "Stockholm", "Arlanda", 1);
insert into address value(null, "Dänemark", "2770", "Kastrup", "Lufthavnsboulevarden", 6);
insert into address value(null, "Bosnien und Herzegowina", "71000", "Sarajevo", "Kurta Schorka", 36);
insert into address value(null, "Spanien", "28042", "Madrid", "Av de la Hispanidad", 1);
insert into address value(null, "Schweiz", "8058", "Zürich", "Kloten", 1);
insert into address value(null, "Finnland", "01531", "Helsinki", "Vantaa", 1);

create table airline(
	airline_id int unsigned not null auto_increment,
    a_name varchar(50) not null,
    address_id int unsigned not null,
    a_contact_person_f_name varchar(50) not null,
    a_contact_person_l_name varchar(50) not null,
    
    constraint airline_pk primary key(airline_id)
);

create table staff_address(
	staff_id varchar(50) not null,
    address_id int unsigned not null,
    
    constraint staff_address primary key(staff_id, address_id)
);

create table airport(
	airport_number varchar(15) not null,
    address_id int unsigned not null,
    
    constraint airport_pk primary key(airport_number)
);

create table flight_route(
	flight_route varchar(20) not null,
    departure_airport varchar(15) not null,
    arrival_airport varchar(15) not null,
    
    constraint flight_route_pk primary key(flight_route)
);

create table airport_time_to_fly(
	airport_number varchar(15) not null,
    ttf_id int unsigned not null,
    
    constraint airport_time_to_fly_pk primary key(airport_number, ttf_id)
);

create table time_to_fly(
	ttf_id int unsigned not null auto_increment,
    weekday varchar(50) not null,
    starting_time time not null,
    ending_time time not null,
    
    constraint time_to_fly_pk primary key(ttf_id)
);

create table staff(
	staff_id varchar(50) not null,
    f_name varchar(50) not null,
    l_name varchar(50) not null,
    birthdate date not null,
    gender char(1) not null,
    type_of_work varchar(50) not null,
    
    constraint staff_pk primary key(staff_id)
);

insert into staff values(1,"Marcel","Eris","1988-03-30",'m',"Kloputzer");
insert into staff values(2,"Ringo","Star","1940-07-19",'m',"Reinigungskraft");
insert into staff values(3,"Hans","Poppinger","1938-02-11",'m',"Elektriker");
insert into staff values(4,"Herman","Kunix","1980-09-23",'m',"Check-in");
insert into staff values(5,"Stefan","De Griffel","2000-11-9",'m',"Gepäck");
insert into staff values(6,"Claudia","Sowieso","1999-12-09",'w',"Schichtleiterin");
insert into staff values(7,"Axel","Schweiß","1980-05-25",'m',"Hygienebeauftragter");
insert into staff values(8,"Peter","Poschzel","1975-12-01",'m',"Boarding");
insert into staff values(9,"Uwe","Derzel","1980-03-14",'m',"Shopleiter");
insert into staff values(10,"Ringo","Star","1940-07-19",'m',"Reinigungskraft");
insert into staff values(11,"Simma","Simma","2002-05-05",'m',"Technikbeauftragter");
insert into staff values(12,"Jens","Niederschneider","1969-04-20",'m',"Flugzeugtechniker");
insert into staff values(13,"Barbara","Simma","2004-03-08",'w',"Gastronomieleiterin");
insert into staff values(14,"Ingrid","Suchl","1989-10-17",'w',"Check-in");
insert into staff values(15,"Johann","Schuster","1995-06-19",'m',"Kundenbetreuung");

create table pilot(
	pilot_id varchar(50) not null,
    enddate_of_flying_licens date not null,
    
    constraint pilot_pk primary key(pilot_id)
);



alter table flight_execution_staff add constraint staff_id_fk foreign key(staff_id) references staff(staff_id);
alter table flight_execution_staff add constraint fe_id_fk foreign key(fe_id) references flight_execution(fe_id);

alter table flight_execution add constraint airline_id_fk foreign key(airline_id) references airline(airline_id);
alter table flight_execution add constraint flight_route_fk foreign key(flight_route) references flight_route(flight_route);

alter table flight_execution_customer add constraint customer_id_fk foreign key(customer_id) references customer(customer_id);

alter table airline add constraint address_id_fk foreign key(address_id) references address(address_id);

alter table customer_address add constraint address_id_fk2 foreign key(address_id) references address(address_id);

alter table staff_address add constraint address_id_fk3 foreign key(address_id) references address(address_id);

alter table airport add constraint address_id_fk4 foreign key(address_id) references address(address_id);

alter table flight_route add constraint departure_airport_fk foreign key(departure_airport) references airport(airport_number);
alter table flight_route add constraint arrival_airport_fk foreign key(arrival_airport) references airport(airport_number);

alter table airport_time_to_fly add constraint time_to_fly_id_fk foreign key(ttf_id) references time_to_fly(ttf_id);

alter table pilot add constraint pilot_id_fk foreign key(pilot_id) references staff(staff_id);




