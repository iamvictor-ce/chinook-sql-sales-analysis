--Top-selling tracks
SELECT Track.Name AS track, SUM(InvoiceLine.Quantity) AS units_sold
FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
GROUP BY Track.TrackId
ORDER BY units_sold DESC, Track.Name
LIMIT 10;

--Revenue per country
SELECT BillingCountry AS country, ROUND(SUM(Total), 2) AS revenue
FROM Invoice
GROUP BY BillingCountry
ORDER BY revenue DESC;

--monthly revenue
SELECT strftime('%Y-%m', InvoiceDate) AS month,
       ROUND(SUM(Total), 2) AS revenue
FROM Invoice
GROUP BY month
ORDER BY month;

-- Query 4: Top 10 artists by revenue
-- Business question: which artists bring in the most money?
-- Path: InvoiceLine (sale) -> Track (song) -> Album -> Artist
SELECT Artist.Name AS artist,
       ROUND(SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity), 2) AS revenue  -- revenue per line, added up
FROM InvoiceLine
JOIN Track  ON InvoiceLine.TrackId = Track.TrackId   -- sale to song
JOIN Album  ON Track.AlbumId = Album.AlbumId         -- song to album
JOIN Artist ON Album.ArtistId = Artist.ArtistId      -- album to artist
GROUP BY Artist.ArtistId                             -- one row per artist
ORDER BY revenue DESC                                -- biggest earners first
LIMIT 10;                

-- Query 5 (bonus): rank countries by revenue using a window function
-- RANK() numbers each country 1, 2, 3... without collapsing the rows
SELECT BillingCountry AS country,
       ROUND(SUM(Total), 2) AS revenue,
       RANK() OVER (ORDER BY SUM(Total) DESC) AS revenue_rank  -- rank 1 = highest revenue
FROM Invoice
GROUP BY BillingCountry;                            -- top 10 only