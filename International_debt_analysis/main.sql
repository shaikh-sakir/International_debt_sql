create database internation_debt_project;
use internation_debt_project;
CREATE TABLE international_debt
(
  country_name character varying(50),
  country_code character varying(50),
  indicator_name text,
  indicator_code text,
  debt numeric
);

-- displaying the 10 records.
select * from international_debt limit 10;

-- finding the number of distinct country
select distinct country_name from international_debt;

-- amount of debt by each country
select sum(debt) as total_debt , country_name from international_debt group by country_name;

-- country with the highest debt
select country_name, debt from international_debt where debt= (select max(debt) from international_debt);
select country_name, debt from international_debt order by debt desc limit 1;

-- most common debt indicator.
select indicator_code, count(*) as indicator_count from
international_debt group by indicator_code
order by indicator_count desc limit 10;
