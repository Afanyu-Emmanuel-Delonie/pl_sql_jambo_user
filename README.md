Bus Trip Management PL/SQL Script
Overview

This PL/SQL script demonstrates how to manage and display bus trip information using records, nested tables, and loops in Oracle PL/SQL. It also calculates the total number of available seats across multiple trips while skipping trips that have no available seats.

The script is designed for educational purposes, illustrating:

PL/SQL RECORD types

Nested table collections

Looping and conditional logic

Using GOTO labels

Basic exception handling

Output with DBMS_OUTPUT.PUT_LINE

Script Features

Define Trip Structure
Each bus trip is represented as a record with the following fields:

trip_id — Unique trip identifier (NUMBER)

route — Route of the trip (VARCHAR2)

agency — Bus company operating the trip (VARCHAR2)

available_seats — Number of available seats (NUMBER)

price — Ticket price in Rwandan Francs (NUMBER)

Store Multiple Trips

Uses a nested table (TripTable) to store multiple trip records.

Initializes the table with 5 sample trips.

Loop Through Trips

Displays trip details using DBMS_OUTPUT.PUT_LINE.

Skips trips with no available seats using a GOTO statement and a label (skip_trip).

Calculates and accumulates total available seats.

Exception Handling

Handles unexpected errors using a generic WHEN OTHERS block.

Outputs any error message encountered during execution.
