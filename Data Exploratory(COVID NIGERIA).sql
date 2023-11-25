create database Portfolioprojects_covid;
use portfolioprojects_covid;

select * from covid_deathnigeria;
select * from covid_agenigeria;
select * from covid_deathnigeria where date = 2020 order by total_cases desc;

# total_deaths against total_cases percentage
select location, date, population_density, total_cases, total_deaths,
(total_deaths)/(total_cases)*100 as TotaldeathsVStotalcases from covid_deathnigeria where (total_cases)/(total_deaths)*100 is not null;

# dates with highest total cases
select location, date, population_density, total_cases from covid_deathnigeria order by total_cases desc ;

# highest cases and deaths
select date, population_density, max(total_cases), max(total_deaths) from covid_deathnigeria;

# total cases
select sum(total_cases) from covid_deathnigeria;

# total deaths
select sum(total_deaths) from covid_deathnigeria;

# total cases against total deaths percentage
select sum(total_deaths)/sum(total_cases)*100 from covid_deathnigeria;

#InnerJoin
select covid_deathnigeria.date, covid_deathnigeria.location,covid_deathnigeria.total_cases, covid_deathnigeria.total_deaths, 
covid_deathnigeria.people_vaccinated, covid_deathnigeria.population_density,covid_deathnigeria.total_vaccinations, 
covid_deathnigeria.people_fully_vaccinated, covid_deathnigeria.median_age, covid_deathnigeria.aged_65_older, 
covid_deathnigeria.aged_70_older from covid_deathnigeria inner join covid_agenigeria 
on covid_agenigeria.population_density=covid_deathnigeria.population_density where covid_deathnigeria.total_cases is not null;

# view
create view TotalDeathVStotalCases as select location, date, population_density, total_cases, total_deaths,
(total_deaths)/(total_cases)*100 as TotaldeathsVStotalcases from covid_deathnigeria where (total_cases)/(total_deaths)*100 is not null;
create view TotalCases as select sum(total_cases) as Total_cases from covid_deathnigeria;
create view TotalDeaths as select sum(total_deaths) from covid_deathnigeria;
create view TotalPeople_vaccinated as select sum(people_vaccinated) as TotalPeople_Vaccinated from covid_deathnigeria;
create view TotalPeople_Fullyvaccinated as select sum(people_fully_vaccinated) as TotalPeople_fullyVaccinated from covid_deathnigeria;
drop view peoplevaccinated;