-- Stored Procedure to load data from staging to final table
CREATE PROCEDURE vehicle.sp_load_vehicle_data
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO vehicle.vehicle_data (
        vehicle_id,
        speed,
        latitude,
        longitude,
        engine_status,
        fuel_level,
        event_timestamp
    )
    SELECT 
        vehicle_id,
        speed,
        latitude,
        longitude,
        engine_status,
        fuel_level,
        event_timestamp
    FROM vehicle.vehicle_data_staging;

    TRUNCATE TABLE vehicle.vehicle_data_staging;
END;
