-- Purpose:
-- Prepare a lightweight, visualization-ready dataset.
-- Select spatial and behavioral features for Kepler.gl and Looker Studio dashboards.
--
-- Output:
-- Final dataset consumed by visualization tools.


SELECT
  bike_type,
  user_type,
  trip_geometry,
  geodetic_distance_m,
  manhattan_distance,
  ride_duration
FROM `project.cyclistic_data_analysis.clean_trips`;
