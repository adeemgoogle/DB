-- 1 task
select send_id, crush_time from package inner join truck on package.pack_id = truck.pack_id where status='nope'
                                                                                              or status = 'ok';
select recip_id from (package inner join shipment s on package.pack_id = s.pack_id) inner join truck
on package.pack_id = truck.pack_id where dostavka = false and status = 'nope';

--2
select max(sum1) from (select count(send_id) as sum1 from package where date >= '2019-12-31 23:59' and date <= '2021-12-31 23:59' group by send_id) as sum;

-- 3
select sum(sum) from cheque;

-- 4
---Task 5
select pack_id from truck where dostavka = false;
select packed_id from airport where dostavka = false;
select pack_id from warehouse where dostavka = false;


select address from location where