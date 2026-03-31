CREATE SCHEMA vehicle;
GO

-- Main table
CREATE TABLE vehicle.vehicle_data (
    vehicle_id INT,
    speed FLOAT,
    latitude FLOAT,
    longitude FLOAT,
    engine_status VARCHAR(50),
    fuel_level FLOAT,
    event_timestamp DATETIME,
    ingestion_time DATETIME DEFAULT GETDATE()
);
