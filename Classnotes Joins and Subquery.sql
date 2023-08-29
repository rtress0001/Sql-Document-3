--inner join on actor and film_actor table this pulls the minimun amount of data 
select actor.actor_id, first_name, last_name, film_id
from film_actor
inner join actor
ON actor.actor_id  = film_actor.actor_id;

--Left Join on the actor and the film_actor table
select actor.actor_id, first_name,last_name, film_id
from film_actor
left join actor
on actor.actor_id = film_actor.actor_id;

--Join that will produce info about a customer
--from the country of Angola

select customer.first_name, customer.last_name, customer.email, country
from customer
full join address
on customer_id.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id
where country = 'Angola';

--Subquery Example
--Two Queries split apart
--Find a customer_id that has an amount greater than 175 in total payments
select customer_id
from payment
group by customer_id
having sum(amount) > 175
order by sum(amount) desc;

--Subquery to find the custmoers who have amount greater than 175, but using subquery using in
select store_id, first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id
	having sum(amount) > 175 
	order by sum(amount) desc
)
group by store_id, first_name, last_name;
limit 5;

--Find customers in angola who have sum amount of purchases > 175
select customer.first_name, customer.last_name, customer.email, country
from customer
inner join address
on customer_id.address_id = address.address_id
inner join city
on address.city_id = city.city_id
inner join country
on city.country_id = country.country_id
where country = 'Angola' and in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) < 175
	order by sum(amount) decc
);

-- Basic Subquery
select *
from customer
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
	order by sum(amount) desc
);

--Basic Subquery
--Find all films with a lanquage of Enlish

select *
from film
where language_id in (
	select language_id 
	from language
	where name =  'English'
	);
	
-- conditional statement case and end
select 
	case
		when film_id = 1 then 'film ID One!'
		else 'not film ID one!'
	end
as film_one
from film;
	end
	

	