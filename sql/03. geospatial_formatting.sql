-- Purpose:
-- Coordinates conversion (latitude and longitude) from type FLOAT to STRING
-- Enable to create geepoint and linepaths.

-- CONCAT / CAST/ ROUND

CONCAT('(', CAST(ROUND(start_lat, 6) AS STRING), ', ', CAST(ROUND(start_lng, 6) AS STRING), ')') AS start_coord_str,
CONCAT('(', CAST(ROUND(end_lat, 6) AS STRING), ', ', CAST(ROUND(end_lng, 6) AS STRING),')') as end_coord_str

