# Case 3 – Acquisition vs Conversion Quality in Growth Stagnation

## Business Question
Is business growth constrained by insufficient new user acquisition, declining conversion quality, or both?

## Decision
Do not scale acquisition under current conditions. Growth is constrained by both declining acquisition volume and weakening conversion quality. Efforts should focus on diagnosing and strengthening the core value proposition and early user experience before further growth investment.

## Data
- Event-level customer journey data
- Public Kaggle dataset (anonymized)
- Users grouped into cohorts by first observed interaction month

## Analysis Overview
- SQL used to define user cohorts and measure cohort-level acquisition and purchase outcomes.
- Python used to compare new user inflow against purchasers and visualize purchase rate trends over time.
- Power BI used to construct a session-level dashboard analyzing funnel progression, conversion stability, and traffic patterns across device types and referral sources.
- Purchase rate is defined as the percentage of cohort users who complete a purchase within their cohort month (month-0 conversion).

## Key Findings
- User traffic and purchases move together, indicating demand is driven primarily by acquisition volume.
- Conversion rate remains stable at around 20 percent, suggesting no major degradation in funnel efficiency.
- Device type shows minimal impact on conversion, indicating a consistent user experience across platforms.
- Growth constraints are driven more by traffic volume than conversion performance.

## Repo Structure
- `sql/core_analysis.sql` – Cohort definition and purchase outcome aggregation
- `python/core_analysis.ipynb` – Acquisition vs conversion analysis and visualization
- `Power BI/User Journey Conversion Analysis Dashboard.pbit` – Interactive dashboard for funnel, conversion, and traffic analysis
- `outputs/purchase_rate.png` – Purchase rate trend by cohort month
- `outputs/acquisition_vs_conversion.png` – New users vs purchasers by cohort month
- `outputs/Dash_board_preview.png` – Dashboard preview

## Notes
This repository focuses on analysis logic and decision-making.  
Environment setup, data ingestion, and execution steps are intentionally omitted.

## Portfolio Link
<https://portfolio-home.notion.site/Case-3-Index-Page-2eebf1a14b49802e889fe0358faad6f7/>
