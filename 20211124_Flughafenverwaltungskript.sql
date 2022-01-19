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

create table flight_execution_customer(
	fe_id int unsigned not null,
    customer_id varchar(50) not null,
    
    constraint flight_execution_customer_pk primary key(fe_id, customer_id)
);

create table customer(
	customer_id varchar(50) not null,
    f_name varchar(50) not null,
    l_name varchar(50) not null,
    birthdate date not null,
    gender char(1) not null,
    
    constraint customer_pk primary key(customer_id)
);

create table customer_address(
	customer_id varchar(50) not null,
    address_id int unsigned not null,
    
    constraint customer_address_pk primary key(customer_id, address_id)
);

create table address(
	address_id int unsigned not null auto_increment,
    state varchar(50) not null,
    postalcode varchar(10) not null,
    city varchar(50) not null,
    street varchar(50) not null,
    street_number varchar(10) not null,
    
    constraint address_pk primary key(address_id)
);

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




