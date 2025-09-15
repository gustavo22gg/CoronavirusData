# COVID-19 Data Exploration (SQL Project)

This project explores COVID-19 datasets using SQL queries to analyze trends in cases, deaths, and vaccinations across different countries and continents. The analysis highlights infection rates, death percentages, vaccination progress, and global/continental comparisons.

---

## 📂 Datasets
- **`projectone..Coviddeaths`** – COVID-19 death, case, and population data  
- **`projectone..Covidvacs`** – COVID-19 vaccination data  

---

## 🔍 Key Analyses

1. **Total Cases vs Total Deaths (Bangladesh)**  
   - Calculates death percentage relative to confirmed cases.  

2. **Total Cases vs Population (Bangladesh)**  
   - Measures infection rate as a percentage of the total population.  

3. **Countries with Highest Infection Rates**  
   - Identifies countries with the largest share of population infected.  

4. **Countries with Highest Deaths**  
   - Ranks countries by total reported deaths.  

5. **Continental Death Counts**  
   - Aggregates and compares total deaths across continents.  

6. **Global Cases per Day**  
   - Tracks worldwide new cases over time.  

7. **Global Totals**  
   - Summarizes total cases, total deaths, and global death percentage.  

8. **Vaccination Progress**  
   - Monitors cumulative vaccinations by country over time.  

9. **Population vs Vaccinations (CTE)**  
   - Uses a Common Table Expression to calculate vaccination percentages relative to population.

---

## 📊 Insights
- Death percentages in Bangladesh and worldwide.  
- Share of populations infected across different countries.  
- Global hotspots for total deaths.  
- Trends in new cases per day.  
- Vaccination progress and coverage percentages.  

---

## 🚀 How to Run
1. Load the `projectone..Coviddeaths` and `projectone..Covidvacs` datasets into SQL Server.  
2. Open your SQL editor (e.g., SSMS, Azure Data Studio).  
3. Run the provided queries sequentially to explore cases, deaths, and vaccination data.  
4. Modify `WHERE` clauses to filter for different countries, regions, or dates.  

---

## 📌 Notes
- Casting to `FLOAT` and `INT` is used to avoid type conversion issues.  
- Window functions (`OVER PARTITION BY`) help calculate cumulative vaccination counts.  
- CTEs are used for cleaner query organization and readability.  

---
