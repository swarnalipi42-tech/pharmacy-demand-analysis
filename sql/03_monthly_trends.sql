
USE pharmacy_analytics;

-- Monthly demand by year
SELECT
    Year,
    Month,
    ROUND(
        SUM(
            M01AB + M01AE + N02BA + N02BE
            + N05B + N05C + R03 + R06
        ),
        2
    ) AS total_demand
FROM saleshourly_analysis
GROUP BY Year, Month
ORDER BY Year, Month;

-- Average daily demand by month across available years
WITH daily_demand AS (
    SELECT
        DATE(sales_datetime) AS sales_date,
        MONTH(sales_datetime) AS month_num,
        SUM(
            M01AB + M01AE + N02BA + N02BE
            + N05B + N05C + R03 + R06
        ) AS daily_total
    FROM saleshourly_analysis
    GROUP BY DATE(sales_datetime), MONTH(sales_datetime)
)
SELECT
    month_num,
    ROUND(AVG(daily_total), 2) AS average_daily_demand,
    COUNT(*) AS recorded_days
FROM daily_demand
GROUP BY month_num
ORDER BY average_daily_demand DESC;
