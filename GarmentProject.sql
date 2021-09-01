USE GarmetProductivity

-- Sanity Check
SELECT *
FROM garments_worker_productivity$

-- Checking for distinctness for cleaning
SELECT DISTINCT(team)
FROM garments_worker_productivity$
-- No cleaning necessary

-- Which team was most productive?
SELECT team, AVG(actual_productivity) as average_productivity
FROM garments_worker_productivity$
GROUP BY team
ORDER BY average_productivity DESC

-- Check to see difference between actual and targeted productivity
SELECT team, AVG(actual_productivity - targeted_productivity) AS productivity_diff
FROM garments_worker_productivity$
GROUP BY team
ORDER BY productivity_diff DESC

-- Plot the relationship between overtime and productivity (REMEBER TO USE SCATTER PLOT)
SELECT over_time, actual_productivity
FROM garments_worker_productivity$

-- Plot the relationship between incentive and productivity (REMEBER TO USE SCATTER PLOT)
SELECT incentive, actual_productivity
FROM garments_worker_productivity$

-- Plot Productivity over time, separated by team
SELECT date, team, AVG(actual_productivity) as average_productivity
FROM garments_worker_productivity$
GROUP BY date, team
ORDER BY date

-- Does the department affect actual productivity? Not by very much. (DON'T VISUALIZE)
SELECT department, AVG(actual_productivity) AS average_productivity
FROM garments_worker_productivity$
GROUP BY department
ORDER BY average_productivity

SELECT department, team
FROM garments_worker_productivity$

-- Is there a relation between no_of_workers and productivity? (Use scatterplot)
SELECT no_of_workers, AVG(actual_productivity) as average_productivity
FROM garments_worker_productivity$
GROUP BY no_of_workers
ORDER BY average_productivity DESC


-- Creating views for visualization
CREATE VIEW ProductivityOverTime as
SELECT date, team, AVG(actual_productivity) as average_productivity
FROM garments_worker_productivity$
GROUP BY date, team

CREATE VIEW ProductivityDifference as
SELECT team, AVG(actual_productivity - targeted_productivity) AS productivity_diff
FROM garments_worker_productivity$
GROUP BY team

CREATE VIEW OvertimeVSProductivity as
SELECT over_time, actual_productivity
FROM garments_worker_productivity$

CREATE VIEW IncentiveVsProductivity as
SELECT incentive, actual_productivity
FROM garments_worker_productivity$
WHERE incentive > 0

CREATE VIEW WorkersVsProductivity as
SELECT no_of_workers, AVG(actual_productivity) as average_productivity
FROM garments_worker_productivity$
GROUP BY no_of_workers