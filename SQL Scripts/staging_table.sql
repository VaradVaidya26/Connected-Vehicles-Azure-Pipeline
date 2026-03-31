-- Staging table (Silver Layer representation in SQL)
CREATE TABLE vehicle.vehicle_data_staging (
    vehicle_id INT,
    speed FLOAT,
    latitude FLOAT,
    longitude FLOAT,
    engine_status VARCHAR(50),
    fuel_level FLOAT,
    event_timestamp DATETIME
);
