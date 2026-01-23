-- Case 3: Acquisition vs Conversion Quality
-- Cohort month = user's first seen month
-- Purchasers = users who ever purchased at least once (lifetime) in that cohort

CREATE TABLE IF NOT EXISTS growth (
    SessionID VARCHAR(255),
    UserID VARCHAR(255),
    InvoiceDate DATETIME NOT NULL,
    PageType VARCHAR(255),
    DeviceType VARCHAR(255),
    Country VARCHAR(255),
    Referal VARCHAR(255),
    TimeonPage INT,
    Timeincart INT,
    Purchased INT
);

WITH cohort_table AS (
    SELECT 
        UserID,
        MIN(DATE_FORMAT(InvoiceDate, '%Y-%m-01')) AS cohort_month
    FROM growth
    WHERE UserID IS NOT NULL
    GROUP BY UserID
),
user_purchase AS (
    SELECT
        UserID,
        COALESCE(MAX(Purchased), 0) AS purchased
    FROM growth
    WHERE UserID IS NOT NULL
    GROUP BY UserID
),
cohort_metrics AS (
    SELECT 
        c.cohort_month,
        COUNT(DISTINCT c.UserID) AS new_users,
        SUM(p.purchased) AS purchasers
    FROM cohort_table c
    LEFT JOIN user_purchase p
      ON c.UserID = p.UserID
    GROUP BY c.cohort_month
)
SELECT
    cohort_month,
    new_users,
    purchasers,
    ROUND(purchasers / NULLIF(new_users, 0) * 100, 2) AS purchase_rate
FROM cohort_metrics
ORDER BY cohort_month;
