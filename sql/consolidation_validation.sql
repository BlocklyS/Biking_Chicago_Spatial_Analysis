-- Monthly table consolidation --

CREATE OR REPLACE TABLE
  `project.cyclistic_data_analysis.collected_cyclistic_data` AS
SELECT * FROM `project.cyclistic_data_analysis.2023_01_cycle`
UNION DISTINCT
SELECT * FROM `project.cyclistic_data_analysis.2023_02_cycle`
-- …
UNION DISTINCT
SELECT * FROM `project.cyclistic_data_analysis.2023_12_cycle`;

-- Uniqueness check on `ride_id` --

SELECT
  ride_id,
  COUNT(*) AS occurrences
FROM `project.cyclistic_data_analysis.collected_cyclistic_data`
GROUP BY ride_id
HAVING COUNT(*) > 1;

