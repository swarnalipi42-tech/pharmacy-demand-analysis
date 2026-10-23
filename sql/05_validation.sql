USE pharmacy_analytics;

SELECT
    COUNT(*) AS total_records,
    ROUND(SUM(
        M01AB + M01AE + N02BA + N02BE
        + N05B + N05C + R03 + R06
    ), 2) AS total_recorded_demand
FROM saleshourly_analysis;