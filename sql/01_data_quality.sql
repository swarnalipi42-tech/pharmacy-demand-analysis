USE pharmacy_analytics;

SELECT
    COUNT(*) AS total_rows,
    SUM(sales_datetime IS NULL) AS invalid_dates,
    MIN(sales_datetime) AS first_date,
    MAX(sales_datetime) AS last_date
FROM saleshourly_analysis;