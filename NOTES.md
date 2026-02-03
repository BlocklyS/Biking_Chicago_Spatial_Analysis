# Design Notes & Future Improvements

This document captures architectural notes, trade-offs, and improvements
that would be applied if the project were rebuilt today.

## Table Consolidation Strategy

**Original approach**  
Monthly tables were consolidated using explicit `UNION DISTINCT` statements
to guarantee record uniqueness across files.

**What I would do today**  
Use BigQuery table Wildcards combined with `UNION ALL`

```sql
CREATE OR REPLACE TABLE `project.cyclistic_data_analysis.collected_cyclistic_data` AS
SELECT *
FROM `project.cyclistic_data_analysis.2023_*`




