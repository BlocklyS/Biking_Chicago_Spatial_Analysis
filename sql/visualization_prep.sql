-- Kepler/Looker file preparation --

SELECT
  bike_type,
  user_type,
  trip_geometry,
  geodetic_distance_m,
  manhattan_distance,
  ride_duration
FROM `project.cyclistic_data_analysis.clean_trips`;
