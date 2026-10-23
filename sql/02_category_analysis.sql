
USE pharmacy_analytics;

-- Total demand and category contribution
WITH category_totals AS (
    SELECT 'M01AB' AS category, SUM(M01AB) AS total_units FROM saleshourly_analysis
    UNION ALL
    SELECT 'M01AE', SUM(M01AE) FROM saleshourly_analysis
    UNION ALL
    SELECT 'N02BA', SUM(N02BA) FROM saleshourly_analysis
    UNION ALL
    SELECT 'N02BE', SUM(N02BE) FROM saleshourly_analysis
    UNION ALL
    SELECT 'N05B', SUM(N05B) FROM saleshourly_analysis
    UNION ALL
    SELECT 'N05C', SUM(N05C) FROM saleshourly_analysis
    UNION ALL
    SELECT 'R03', SUM(R03) FROM saleshourly_analysis
    UNION ALL
    SELECT 'R06', SUM(R06) FROM saleshourly_analysis
)
SELECT
    category,
    ROUND(total_units, 2) AS total_units,
    ROUND(
        total_units * 100 / SUM(total_units) OVER (),
        2
    ) AS contribution_pct
FROM category_totals
ORDER BY total_units DESC;
