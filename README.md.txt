# SQL-Based Analysis of Product Sales (Chinook Database)

Task 5 of my Data Analytics internship with Elevvo.

## Goal
Use SQL to answer business questions about a digital music store: top-selling products, revenue per country, and monthly performance.

## Dataset
Chinook database (SQLite), a sample digital media store with customers, invoices, tracks, albums and artists. The dataset does not state a currency, so revenue is shown as recorded.

## Questions answered
1. Which tracks sell the most?
2. Which countries bring in the most revenue?
3. How does revenue change month by month?
4. Which artists generate the most revenue? (four-table JOIN)
5. Bonus: ranking countries with a window function (RANK)

## Key findings
- No single track dominates: the top 10 tracks each sold only 2 units.
- Iron Maiden (138.60), U2 (105.93) and Metallica (90.09) lead in revenue; Lost and The Office are video series, so the store sells video as well as music.
- The USA leads in revenue (523.06) and has the most customers (13).
- Monthly revenue ranges from 23.76 to 52.62, and yearly totals stay between about 450 and 481, so revenue is roughly flat from 2009 to 2013 with no clear seasonal pattern.

## Tools
SQLite, Python (sqlite3, pandas, matplotlib), Jupyter Notebook

## Files
- `chinook_analysis.ipynb`: the full analysis with queries, charts and insights
- `chinook_queries.sql`: the SQL queries
- `Chinook_Sqlite.sqlite`: the database