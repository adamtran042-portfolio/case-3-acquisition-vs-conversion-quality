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
- Purchase rate is defined as the percentage of cohort users who purchase at least once.

## Key Findings
- New user acquisition declines steadily across cohorts.
- The number of purchasers declines faster than acquisition volume.
- Purchase rates stabilize at lower levels, indicating weakening conversion quality rather than temporary volatility.
- Scaling acquisition without addressing conversion would increase traffic without proportional revenue impact.

## Repo Structure
- `sql/core_analysis.sql` – Cohort definition and purchase outcome aggregation
- `python/core_analysis.ipynb` – Acquisition vs conversion analysis and visualization
- `outputs/purchase_rate.png` – Purchase rate trend by cohort month
- `outputs/acquisition_vs_conversion.png` – New users vs purchasers by cohort month

## Notes
This repository focuses on analysis logic and decision-making.  
Environment setup, data ingestion, and execution steps are intentionally omitted.

## Portfolio Link
<https://portfolio-home.notion.site/Case-3-Index-Page-2eebf1a14b49802e889fe0358faad6f7/>
