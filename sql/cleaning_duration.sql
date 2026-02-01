-- Purpose:
-- Clean and normalize trip-level data before analysis.
-- Remove temporally invalid rides, standardize station names, and compute ride duration.
--
-- Key assumptions:
-- - Valid rides last between 0 and 24 hours.
--
-- Output table:
-- cyclistic_data_analysis.ride_duration


CREATE OR REPLACE TABLE
  `project.cyclistic_data_analysis.ride_duration` AS
SELECT
  ride_id,
  rideable_type,
  member_casual,
  TRIM(start_station_name) AS start_address,
  TRIM(end_station_name) AS end_address,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  started_at,
  ended_at,
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_duration,
  TIMESTAMP_DIFF(ended_at, started_at, SECOND) AS second_duration
FROM `project.cyclistic_data_analysis.collected_cyclistic_data`
WHERE TIMESTAMP_DIFF(ended_at, started_at, MINUTE)
      BETWEEN 0 AND 1440;

