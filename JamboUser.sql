SET SERVEROUTPUT ON;

DECLARE
    -- Defination of RECORD type for bus trip information
    TYPE TripRecord IS RECORD (
        trip_id        NUMBER,
        route          VARCHAR2(50),
        agency         VARCHAR2(50),
        available_seats NUMBER,
        price          NUMBER
    );

    -- Defination of COLLECTION type (Nested Table) to store multiple trips
    TYPE TripTable IS TABLE OF TripRecord;

    -- Declaration of the collection variable
    trips TripTable := TripTable();

    
    total_seats NUMBER := 0;

BEGIN
    -- Initialize the collection with trip data
    trips.EXTEND(5);
    trips(1) := TripRecord(1, 'Kigali - Musanze', 'RITCO', 12, 3000);
    trips(2) := TripRecord(2, 'Kigali - Huye', 'Volcano', 0, 2500);
    trips(3) := TripRecord(3, 'Kigali - Rubavu', 'Horizon', 8, 3500);
    trips(4) := TripRecord(4, 'Kigali - Nyamata', 'Alpha', 20, 1500);
    trips(5) := TripRecord(5, 'Kigali - Muhanga', 'Virunga', 0, 2000);

    DBMS_OUTPUT.PUT_LINE('--- JAMBOWAY BUS TRIP DETAILS ---');

    -- Loop through all trips
    FOR i IN 1 .. trips.COUNT LOOP
        -- If trip has no seats, skip using GOTO
        IF trips(i).available_seats = 0 THEN
            GOTO skip_trip;
        END IF;

        -- Display trip details
        DBMS_OUTPUT.PUT_LINE('Trip ID: ' || trips(i).trip_id);
        DBMS_OUTPUT.PUT_LINE('Route: ' || trips(i).route);
        DBMS_OUTPUT.PUT_LINE('Agency: ' || trips(i).agency);
        DBMS_OUTPUT.PUT_LINE('Available Seats: ' || trips(i).available_seats);
        DBMS_OUTPUT.PUT_LINE('Ticket Price: ' || trips(i).price || ' RWF');
        DBMS_OUTPUT.PUT_LINE('---------------------------');

        -- Add to total available seats
        total_seats := total_seats + trips(i).available_seats;

        <<skip_trip>>  
        NULL;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total Available Seats Across All Trips: ' || total_seats);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
