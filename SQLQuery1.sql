select * 
from projectone..Coviddeaths 
order by 3, 4



-- looking at Total cases vs Total deaths in Bangladesh

select location, date, total_cases, new_cases, total_deaths,
(CAST(total_deaths AS FLOAT) / CAST(total_cases AS FLOAT)) * 100 AS Death_percentage
from projectone..Coviddeaths 
where location like '%bangladesh%'
order by 1, 2


--looking at Total Cases vs Population in Bangladesh 
  
  select location, date, total_cases, new_cases, total_deaths,
(CAST(total_cases AS FLOAT) / CAST(population AS FLOAT)) * 100 AS Infected_percentage
from projectone..Coviddeaths 
where location like '%bangladesh%'
order by 1, 2


--looking at countries witht highest infection rate
select location, population, max(total_cases) as HighestCases, max(total_cases/population) as
PercentagePopulation from projectone..coviddeaths 
group by location, population
order by PercentagePopulation desc


--looking at highest deaths
select location, population, max(cast(total_deaths as int)) as Total_Deaths, max(total_deaths/population) as
PercentagePopulation from projectone..coviddeaths 
where continent is not null
group by location , population
order by Total_Deaths desc


--looking at continents
select continent, max(cast(total_deaths as int)) as TotalDeathCount
from projectone..coviddeaths 
where continent is not null
group by continent
order by  TotalDeathCount desc


--Cases per day
select date, sum(new_cases) as newCasesPerday
from projectone..coviddeaths
group by date
order by 1


--total deaths and cases in the world

select sum(new_cases) as TotalCase, 
sum(cast(new_deaths as int)) as total_deaths,
sum(cast(new_deaths as int)) / sum(new_cases) * 100 as DeathPercentage
from projectone..coviddeaths 

 
 --total vaccination 

select cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
sum(cast(cv.new_vaccinations as bigint)) over (partition by cd.location order by cd.location, cd.date)
as PeopleVaccinated
from projectone..coviddeaths cd
join projectone..covidvacs cv
	on cd.location = cv.location
	and cd.date = cv.date
where cd.continent is not null
order by 2, 3


--use cte
with PopvsVac(continent, location, date, population, new_vaccinations, PeopleVaccinated)
as 
(
select cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations,
sum(cast(cv.new_vaccinations as bigint)) over (partition by cd.location order by cd.location, cd.date)
as PeopleVaccinated
from projectone..coviddeaths cd
join projectone..covidvacs cv
	on cd.location = cv.location
	and cd.date = cv.date
where cd.continent is not null
--order by 2, 3
)
select *, (PeopleVaccinated/ population) * 100 as percentage
from PopvsVac


