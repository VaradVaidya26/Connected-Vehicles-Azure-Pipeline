-- Average speed per vehicle
SELECT vehicle_id, AVG(speed) AS avg_speed
FROM vehicle.vehicle_data
GROUP BY vehicle_id;

-- Fuel level monitoring
SELECT vehicle_id, fuel_level
FROM vehicle.vehicle_data
WHERE fuel_level < 15;

-- Recent vehicle activity
SELECT TOP 10 *
FROM vehicle.vehicle_data
ORDER BY event_timestamp DESC;

-- These arew the ones that can be used for analytics. Since my project is focused on pipeline building, I haven't focused much on analytics.
