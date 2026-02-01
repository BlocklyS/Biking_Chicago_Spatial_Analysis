-- Domain Logic -- 

CREATE OR REPLACE TABLE
  `project.cyclistic_data_analysis.clean_trips` AS
SELECT
  *,
  ST_MAKELINE(
    ST_GEOGPOINT(start_lng, start_lat),
    ST_GEOGPOINT(end_lng, end_lat)
  ) AS trip_geometry
FROM `project.cyclistic_data_analysis.spatial_metrics`
WHERE geodetic_distance_m < 96560.6;
