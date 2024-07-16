show databases;
use aircargo;
select database();

select  class_id, count(distinct customer_id) as Business_Customers, sum(no_of_tickets*Price_per_ticket) Total_Revenue 
from ticket_details  where class_id ='Bussiness' group by class_id;

select concat(first_name, ' ', last_name) as Customer_Name from customer;

select Distinct concat(first_name,' ',last_name) Name, TD.no_of_tickets  from customer C
  inner join ticket_details TD on C.customer_id = TD.customer_id;
  
  select Distinct concat(first_name,' ',last_name) Name, TD.customer_id,  TD.Brand  from ticket_details TD
  inner join  customer C on C.customer_id = TD.customer_id where brand = 'Emirates';
  
  select count(distinct customer_id), class_id from passengers_on_flights group by class_id having class_id='Economy Plus';

select * from customer C
inner join (select distinct customer_id from passengers_on_flights pf where class_id = 'Economy Plus') pof
where pof.customer_id = C.customer_id;

select sum(no_of_tickets*Price_per_ticket), 
CASE
    WHEN sum(no_of_tickets*Price_per_ticket) > 10000 THEN 'The Revenue is greater than 10000'
    ELSE 'The quantity is under 10000'
END AS Total_Revenue
from ticket_details;

create user `Sariya` identified by '123456';
grant select on aircargo.* to 'Sariya';
grant insert on aircargo.* to 'Sariya';
grant update on aircargo.* to 'Sariya';
grant delete on aircargo.* to 'Sariya';
grant execute on aircargo.* to 'Sariya';

select class_id, Price_per_ticket 
 from 
(select *, row_number() over (partition by class_id order by Price_per_ticket desc) as rn from ticket_details)  
as Max_price where rn = 1;

create index idx on passengers_on_flights(route_id);

select * from passengers_on_flights where route_id =4;
EXPLAIN select * from passengers_on_flights where route_id =4;

SELECT customer_id, aircraft_id, sum(no_of_tickets), SUM(price_per_ticket) AS total_price
FROM ticket_details
GROUP BY customer_id, aircraft_id with rollup;

create view Business_customers as
select Distinct TD.customer_id, concat(first_name,' ',last_name) C_Name, TD.brand, TD.class_id from ticket_details TD
left join customer C on C.customer_id = TD.customer_id where class_id = 'Bussiness' order by customer_id;

select * from Business_customers;

delimiter //
create procedure check_route(in rid varchar(255))
begin
declare TableNotFound condition for 1146;
declare exit handler for TableNotFound
select 'Please check if table customer/route id are created - missing' message;
set @query = 
concat('select * from customer where customer_id in (select distinct customer_id from passengers_on_flights 
where route_id in(',rid,'));');
prepare sql_query from @query;
execute sql_query;
end//
delimiter ;
call check_route("1,5");

delimiter //
create procedure route_details()
begin select * from routes where distance_miles>2000;
end
//
call route_details;

delimiter //
create procedure group_distance(dist int)
begin
select flight_num, distance_miles, 
case
when distance_miles between 0 and 2000 then "SDT"
when distance_miles between 2001 and 6500 then "IDT"
else "LDT"
end distance_category from routes;
end
//
call group_distace(500);

delimiter//
	create function check_comp_serv( cls varchar(15))
      returns char(3)
      deterministic
      begin
      declare comp_ser char(3);
      if cls in ('Bussiness','Economy Plus') then
       set comp_ser = 'yes';
       else
       set comp_ser ='No';
       end if;
       return(comp_ser);
       end //
       
       create procedure check_comp_serv_proc()
       begin
       select p_date,customer_id,class_id, check_comp_serv(class_id) as complimentary_service from ticket_details;
       end //
       call check_comp_serv_proc();
       //
select * from customer where last_name = 'Scott' limit 1;










