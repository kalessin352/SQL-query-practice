# SQL Practice — Superstore Dataset

A collection of SQL query exercises using SQLite to practice intermediate-level database operations on a sample retail dataset.


## Dataset Overview

| Parameter | Value |
|-----------|-------|
| Source | [Superstore Sales Dataset](https://www.kaggle.com/datasets/ishanshrivastava28/superstore-sales) (Kaggle) |
| Period | 2011–2014 |
| Records | ~9,900 rows |
| Tool | SQLite (DB Browser for SQLite) |


## Exercises

### Q1: Regional Performance

**Business Question:** Which regions drive the most sales and profit?

[See [`queries/superstore_regional_performance.sql`](queries/superstore_regional_performance.sql)]

[See [`charts/superstore_regional_performance.png`](charts/superstore_regional_performance.png)]

**Key Findings:**
- West leads in both sales ($725K) and profit ($108K).
- East follows closely in sales but trails in profit.
- Central region shows disproportionately low profit relative to its sales volume.

**Insight:** Central underperforms on margin despite moderate sales. Investigate cost structures or product mix in this region. West should be the benchmark for regional strategy.

---
