-- Index for faster queries
CREATE INDEX idx_vehicle_timestamp
ON vehicle.vehicle_data (event_timestamp);

CREATE INDEX idx_vehicle_id
ON vehicle.vehicle_data (vehicle_id);
