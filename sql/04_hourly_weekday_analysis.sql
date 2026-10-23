
USE pharmacy_analytics;

-- Query 1: Demand by Hour
SELECT
    `Hour`,
    ROUND(
        SUM(
            M01AB + M01AE + N02BA + N02BE
            + N05B + N05C + R03 + R06
        ),
        2
    ) AS total_demand
FROM saleshourly_analysis
GROUP BY `Hour`
ORDER BY total_demand DESC;


-- Query 2: Average Daily Demand by Weekday
WITH daily_demand AS (
    SELECT
        DATE(sales_datetime) AS sales_date,
        `Weekday Name` AS weekday_name,
        SUM(
            M01AB + M01AE + N02BA + N02BE
            + N05B + N05C + R03 + R06
        ) AS daily_total
    FROM saleshourly_analysis
    GROUP BY
        DATE(sales_datetime),
        `Weekday Name`
)
SELECT
    weekday_name,
    COUNT(*) AS number_of_days,
    ROUND(AVG(daily_total), 2) AS average_daily_demand
FROM daily_demand
GROUP BY weekday_name
ORDER BY average_daily_demand DESC;
