-- ============================================================
-- Case 3 (MySQL): Acquisition Volume vs Conversion Quality
-- Base table: growth
--
-- Purpose:
-- Diagnose whether growth constraints are driven by acquisition volume,
-- conversion quality, or both.
--
-- Key Definitions:
-- - Cohort Month: user’s first seen month (MIN InvoiceDate by UserID).
-- - New Users: unique users first seen in a cohort month.
-- - Month-0 Conversion: users who purchase within their cohort month.
-- - Cohort Purchase Rate: Month-0 purchasers ÷ new users.
--
-- Supporting View:
-- - Calendar Month metrics measure short-term conversion effectiveness
--   among active users, independent of cohort assignment.
-- ============================================================


WITH cohort_table AS (
    SELECT 
        UserID,
        MIN(DATE_FORMAT(InvoiceDate, '%Y-%m-01')) AS cohort_month
    FROM growth
    WHERE UserID IS NOT NULL
    GROUP BY UserID
),
cohort_month0_purchasers AS (
    SELECT
        c.cohort_month,
        COUNT(DISTINCT g.UserID) AS purchasers_m0
    FROM cohort_table c
    JOIN growth g
      ON c.UserID = g.UserID
     AND DATE_FORMAT(g.InvoiceDate, '%Y-%m-01') = c.cohort_month
     AND g.Purchased = 1
    GROUP BY c.cohort_month
),
cohort_new_users AS (
    SELECT
        cohort_month,
        COUNT(*) AS new_users
    FROM cohort_table
    GROUP BY cohort_month
)
SELECT
    n.cohort_month,
    n.new_users,
    COALESCE(p.purchasers_m0, 0) AS purchasers_m0,
    ROUND(COALESCE(p.purchasers_m0, 0) / NULLIF(n.new_users, 0) * 100, 2) AS purchase_rate_m0
FROM cohort_new_users n
LEFT JOIN cohort_month0_purchasers p
  ON n.cohort_month = p.cohort_month
ORDER BY n.cohort_month;
