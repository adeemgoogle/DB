-- 1 task A
select * from dealer, client;

-- 1 task B
select dealer.name as dealer_name,client.name as client_name,city,sell.id as sell_number,date,amount
    from dealer inner join client on client.dealer_id=dealer.id
    inner join sell on client.id = sell.client_id;

-- 1 task C
select dealer.id, c.id
from dealer inner join client c on dealer.id = c.dealer_id and city=location;


-- 1 task D
select sell.id, amount, name, city
    from client inner join sell on sell.amount > 100 and sell.amount < 500 where sell.client_id=client.id;

-- 1task E
select * from dealer;

-- 1 task F
select dealer.name,charge, c.name,city
from dealer inner join client c on dealer.id = c.dealer_id;
-- 1 task g
select dealer.id, dealer.charge, client.name, client.city
from dealer inner join client on dealer.charge>0.12 and dealer.id=client.dealer_id;


-- 1 task h
select c.name,city, s.id,date,amount, dealer.name,charge
from (dealer inner join client c on dealer.id = c.dealer_id) inner join sell s on dealer.id = s.dealer_id and s.client_id=c.id;


-- 1 task i


--2 task A
create view unik as
    select count(DISTINCT client.id)
    from client;

create view puurch as
    select date, avg(amount), sum(amount)
    from sell
    group by date;

-- 2 task B
create view top_5 as
    select sum(amount), date from sell
    group by date order by sum(amount) desc
    limit 5;

-- 2 task C
create view numm_S as
    select count(amount)
    from sell;

create view deealle as
    select dealer.id, sum(amount), avg(amount)
    from dealer inner join sell s on dealer.id = s.dealer_id group by dealer.id;



--2 task e
create view sales_lpocc as
    select location, count (amount), avg(amount), sum(amount)
    from (dealer inner join client c on dealer.id = c.dealer_id) inner join sell
    on dealer.id = sell.dealer_id and sell.client_id=c.id
    group by location;
-- 2 task d
create view expp as
    select location, sum(charge*amount)
    from dealer inner join sell s on dealer.id = s.dealer_id
    group by location;

--2 task f
create view totalexp as
    select city, count(s.id), avg(amount), sum(amount)
    from client inner join sell s on client.id = s.client_id group by city;

