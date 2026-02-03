-- Purpose:
-- Engineer spatial features to model rider movement.
-- Compute both geodetic (earth-surface) distance and Manhattan distance
-- to reflect real-world urban travel in Chicago.
-- ST_DISTANCE (Geodetic measure, argument use_spheroid=TRUE)/ST_GEOGPOINT/
-- ABS formula la somma delle differenze assolute di latitudine e longitudine (|x1-x2| + |y1-y2|)

-- Output table:
-- cyclistic_data_analysis.spatial_metrics


CREATE OR REPLACE TABLE
  `project.cyclistic_data_analysis.spatial_metrics` AS
SELECT
  ride_id,
  rideable_type AS bike_type,
  member_casual AS user_type,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  ride_duration,
  second_duration,
  ST_DISTANCE(
    ST_GEOGPOINT(start_lng, start_lat),
    ST_GEOGPOINT(end_lng, end_lat),
    TRUE
  ) AS geodetic_distance_m,
  ABS(start_lng - end_lng) + ABS(start_lat - end_lat)
    AS manhattan_distance
FROM `project.cyclistic_data_analysis.ride_duration`
WHERE second_duration > 0;
