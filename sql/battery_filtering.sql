-- Purpose:
-- Enforce physical plausibility on e-bike trips.
-- Remove rides exceeding estimated battery range and generate trip geometries.
--
-- Key assumptions:
-- - Maximum e-bike range: 60 miles (96,560.6 meters).
--
-- Output table:
-- cyclistic_data_analysis.clean_trips


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
