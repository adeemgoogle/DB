create table cusstomers (
    cust_id integer not null primary key,
    FullName text not null,
    address text not null,
    phone_number varchar(20) not null
);
insert into cusstomers(cust_id, FullName, address, phone_number) VALUES (01, 'Kim Dina', 'Aksay 1, 21', +77089656144);
insert into cusstomers(cust_id, FullName, address, phone_number) VALUES (02, 'Master Kan', 'Tyrgyt Olala 70', +77063547333);
insert into cusstomers(cust_id, FullName, address, phone_number) VALUES (03, 'Mels Dayana', 'Tole bi 59', +77099999999);
insert into cusstomers(cust_id, FullName, address, phone_number) VALUES (04, 'Kira Saduakasovna', 'Aksay 3A,60', +77774804341);
insert into cusstomers(cust_id, FullName, address, phone_number) VALUES (05, 'Bakhytbek Daryn', 'Navoi 7', +77777777);
insert into cusstomers(cust_id, FullName, address, phone_number) VALUES (06, 'Irina Kairatovna', 'Samal-2, 111', +77011010101);
insert into cusstomers(cust_id, FullName, address, phone_number) VALUES (07, 'Kassym Daniyar', 'Dostyk 99', +77088080808);

CREATE table indiv_buy(
    card_cvv integer not null primary key,
    card_number integer not null,
    customer_id integer not null ,
    foreign key (customer_id) references cusstomers(cust_id)
);
insert into indiv_buy(card_cvv, card_number, customer_id) VALUES (198, 234567654, 01);
insert into indiv_buy(card_cvv, card_number, customer_id) VALUES (148, 276543322, 04);
insert into indiv_buy(card_cvv, card_number, customer_id) VALUES (303, 984473434, 07);

create table company(
    BIN integer not null primary key,
    cusstomer_d integer,
    foreign key (cusstomer_d) references cusstomers(cust_id)
);
insert into company(bin, cusstomer_d) VALUES (34543, 02);
insert into company(bin, cusstomer_d) VALUES (33333, 03);
insert into company(bin, cusstomer_d) VALUES (35432, 05);
insert into company(bin, cusstomer_d) VALUES (87654, 06);

create table package (
    pack_id int primary key,
    descript text,
    date timestamp not null,
    mass integer,
    send_id integer,
    foreign key (send_id) references cusstomers(cust_id),
    hazardous boolean,
    declr_id integer unique
);
insert into package (pack_id, descript, date, mass, send_id, hazardous, declr_id) VALUES (33, 'korobka', '2009-10-21 23:56:01', 77, 07, false, 888);
insert into package (pack_id, descript, date, mass, send_id, hazardous, declr_id) VALUES (123, 'konvert', '2021-10-21 23:56', 1, 03, false, 555);
insert into package (pack_id, descript, date, mass, send_id, hazardous, declr_id) VALUES (99, 'korobka', '2019-08-24 12:06', 55, 02, false, 123);
insert into package (pack_id, descript, date, mass, send_id, hazardous, declr_id) VALUES (53, 'konvert', '2017-05-25 12:00', 1, 04, false, 733);
insert into package (pack_id, descript, date, mass, send_id, hazardous, declr_id) VALUES (111, 'korobka', '2002-11-21 11:36', 33, 06, false, 222);
insert into package (pack_id, descript, date, mass, send_id, hazardous, declr_id) VALUES (532, 'konvert', '2011-03-03 14:44', 1, 01, false, 99);
insert into package (pack_id, descript, date, mass, send_id, hazardous, declr_id) VALUES (224, 'korobka', '2002-08-09 22:06', 33, 05, false,33),
                                                                                         (222, 'korobka', '2021-02-22 13:33', 67, 02, false, 456);
insert into package(pack_id, descript, date, mass, send_id, hazardous, declr_id) VALUES
(129, 'konvert', '2011-03-03 14:45', 1, 01, false, 35);
insert into package(pack_id, descript, date, mass, send_id, hazardous, declr_id) VALUES
(926, 'konvert', '2011-03-03 12:44', 2, 02, false, 311);

create table cheque(
    numb_cheq integer primary key,
    pacck_id integer not null,
    foreign key (pacck_id) references package(pack_id),
    sum integer not null,
    pack_cnt integer,
    cust_id integer not null,
    foreign key (cust_id) references cusstomers(cust_id)
);
insert into cheque(numb_cheq, pacck_id, sum, pack_cnt, cust_id) VALUES (777, 33, 44000, 1,7);
insert into cheque(numb_cheq, pacck_id, sum, pack_cnt, cust_id) VALUES (133, 532, 33123, 1, 1);

insert into cheque(numb_cheq, pacck_id, sum, pack_cnt, cust_id) VALUES (443, 123, 44030, 1,3);
insert into cheque(numb_cheq, pacck_id, sum, pack_cnt, cust_id) VALUES (999, 99, 74500, 1,2);
insert into cheque(numb_cheq, pacck_id, sum, pack_cnt, cust_id) values (888, 53, 23777, 1, 4);
insert into cheque(numb_cheq, pacck_id, sum, pack_cnt, cust_id) VALUES (666, 224, 14633, 1, 5);
insert into cheque(numb_cheq, pacck_id, sum, pack_cnt, cust_id) values (555, 111, 11000, 1, 6);
insert into cheque(numb_cheq, pacck_id, sum, pack_cnt, cust_id) VALUES (444, 129, 4500, 1, 1);
insert into cheque(numb_cheq, pacck_id, sum, pack_cnt, cust_id) VALUES (333, 926, 44110, 1, 2);

create table shipment(
    recip_id int primary key,
    pack_id int references package(pack_id),
    cust_id int references cusstomers(cust_id)
);
insert into shipment(recip_id, pack_id, cust_id) VALUES (12, 33, 7), (13, 99,2),(14, 123,3),(15,53,4),(16,111,6)
,(17, 532,1),(18,224,5);
insert into shipment(recip_id, pack_id, cust_id) VALUES (19, 129, 1);
insert into shipment(recip_id, pack_id, cust_id) VALUES (20, 926, 2);


create table Location(
    loc_id int primary key,
    pack_id int references package(pack_id),
    date timestamp not null,
    address text
);

insert into Location(loc_id, pack_id, date, address) VALUES (212,33, '2009-10-31 03:56', 'Dostyk 77');
insert into Location(loc_id, pack_id, date, address) VALUES (222,99, '2019-10-1 11:56', 'Abay 99');
insert into Location(loc_id, pack_id, date, address) VALUES (232,123, '2021-11-22 17:56', 'Zholdasbekova 12');
insert into Location(loc_id, pack_id, date, address) VALUES (242,53, '2017-07-2 16:33', 'Dostyk 17');
insert into Location(loc_id, pack_id, date, address) VALUES (252,111, '2002-12-12 13:44', 'Altynsaryn 44');
insert into Location(loc_id, pack_id, date, address) VALUES (262,532, '2011-03-31 18:56', 'Rozybakieva 11');
insert into Location(loc_id, pack_id, date, address) VALUES (272,224, '2002-10-22 03:56', 'Abylaikhana 59');
insert into Location(loc_id, pack_id, date, address) VALUES (282,129, '2011-03-31 03:56', 'Rozybakieva 11');
insert into Location(loc_id, pack_id, date, address) VALUES (292,926, '2011-03-31 04:52', 'Rozybakieva 11');

create table truck(
    loc_id int references Location(loc_id),
    pack_id int references package(pack_id),
    num_bus int,
    date timestamp not null,
    status varchar(70),
    dostavka boolean,
    crush_time timestamp
);
insert into truck(loc_id,pack_id ,num_bus, date, status, dostavka, crush_time) VALUES (232,123, 2324, '2021-11-22 17:56', 'OK', True, null);
insert into truck(loc_id,pack_id, num_bus, date, status, dostavka,crush_time) VALUES (242, 53,2424, '2017-07-2 16:33', 'OK', True, null);
insert into truck(loc_id, pack_id, num_bus, date, status, dostavka, crush_time) VALUES (262, 532,2524, '2011-03-31 18:56', 'nope', false, '2011-03-31 13:30');
insert into truck(loc_id, pack_id, num_bus, date, status, dostavka,crush_time ) values (282, 129, 2524, '2011-03-31 03:56','ok', true, null);
insert into truck(loc_id, pack_id, num_bus, date, status, dostavka,crush_time ) values (292, 926, 2524, '2011-03-31 19:56','nope', false, null);

create table airport(
    loc_id int references Location(loc_id),
    packed_id int references package(pack_id),
    flight_num int primary key,
    city text,
    arr_time timestamp,
    name_airp varchar(70),
    dostavka boolean
);
insert into airport(loc_id,packed_id, flight_num, city, arr_time, name_airp, dostavka) VALUES (212,33, 33, 'Aktay', '2009-10-31 03:56',
                                                                                     'Akt.air', True);
insert into airport(loc_id, packed_id, flight_num, city, arr_time, name_airp, dostavka) VALUES (222,33, 99, 'Aktobe', '2019-10-1 11:56',
                                                                                     'Aktobe.air',true);
insert into airport(loc_id, packed_id, flight_num, city, arr_time, name_airp, dostavka) VALUES (252, 111,111, 'Aktay', '2002-12-12 13:44',
                                                                                     'Akt.air',true);
create table warehouse(
    loc_id int references Location(loc_id),
    pack_id int references package(pack_id),
    nomer varchar(12) ,
    address varchar(70),
    date timestamp not null,
    dostavka boolean
);

insert into warehouse(loc_id, pack_id, nomer, address, date, dostavka) VALUES (242, 224, 10, 'Saina 33', '2002-10-22 03:56', true),
                                                                    (262, 222, 11, 'Saina 34', '2021-07-21 12:00', true);


