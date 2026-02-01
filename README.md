# Divvy Bike Chicago - Capstone Project 


## Core SQL Logic & Analytical Queries


This project relies entirely on **SQL-driven transformations in BigQuery**, with no external processing layer. All validation, cleaning, and spatial computation were executed directly in the warehouse.

## Dataset Consolidation & Integrity Checks

- **12 monthly tables** were merged using `UNION DISTINCT` to prevent duplicate records.
 - Row-level integrity was verified by:
  
    - Comparing total row counts before and after consolidation
    - Enforcing `ride_id` uniqueness (no duplicates found)
    - Schema consistency was validated across all source tables.

Key checks included:
- NULL audits on station IDs, station names, and coordinates
- Detection of locked or unmapped coordinates (`lat/lng = 0`)
- Validation of timestamp ranges accepted by BigQuery
- Domain validation on `member_casual` values (`member`, `casual`)

  These steps ensured the dataset met **ROCCC** principles (Reliable, Original, Comprehensive, Current, Cited).


## Temporal & Attribute Cleaning

A curated analytical table was created with the following transformations:
- Removal of trips exceeding **24 hours** or with a negative duration
- Normalization of station names using `TRIM`
- Computation of ride duration in both **minutes and seconds**
- Formatting of start/end coordinates for downstream geospatial tools
- Trips outside valid duration bounds resulted in the removal of ~5,300 records, preserving analytical credibility.


## Distance Engineering (Geospatial Metrics)

Two complementary distance metrics were computed directly in SQL:

 **Geodetic Distance (Earth Surface)**
 - Implemented using `ST_GEOGPOINT` +`ST_DISTANCE`
 - Returns distance in meters using spherical geometry
   
Used for:

  - Physical feasibility checks
  - Battery range validation
  - Long-distance anomaly detection

**Manhattan Distance (Urban Approximation)**
- Implemented using absolute differences between latitude and longitude
- Designed to approximate Chicago’s grid-based street layout
- Used to compute **urban-adjusted average speed**

This dual-metric approach allows realistic modeling of movement in dense city environments.

## Battery Constraint & Anomaly Filtering (E-Bikes)

To enforce physical plausibility:
- A **60-mile (96,560.6 meters)** maximum range constraint was applied to e-bike trips
- Trips exceeding this threshold were filtered out
- Only **8 records** violated this constraint, clustered around specific stations

This step doubled as:
- A data quality safeguard
- An operational anomaly signal at the station level

## Spatial Objects for Visualization

For geospatial visualization and flow analysis:

- `ST_MAKELINE` was used to generate **LINESTRING geometries** representing trips

These geometries were consumed by:

- Kepler.gl for flow mapping

- Aggregation layers for centroid-based visualization

This enabled high-density spatial analysis without rendering raw point-level noise.

## Aggregation & Exploratory Analysis

Final exploratory queries included:

- Average, minimum, and maximum ride duration by:
- User type (Member vs Casual)
- Bike type (Classic, Electric, Docked)
- Distance distributions by user and bike type
- Detection of extreme outliers in both geodetic and Manhattan space

These results feed directly into the Looker Studio dashboard used for comparative analysis.




  
