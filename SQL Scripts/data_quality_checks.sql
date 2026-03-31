-- Check for null critical fields
SELECT *
FROM vehicle.vehicle_data_staging
WHERE vehicle_id IS NULL
   OR event_timestamp IS NULL;

-- Check for unrealistic speed values
SELECT *
FROM vehicle.vehicle_data_staging
WHERE speed < 0 OR speed > 300;

-- Count records
SELECT COUNT(*) AS total_records
FROM vehicle.vehicle_data;
