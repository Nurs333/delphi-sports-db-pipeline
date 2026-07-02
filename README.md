
# Delphi Sports Analytics Pipeline Prototype

A lightweight native Windows desktop application built in Delphi (Object Pascal) that interfaces with a local SQLite relational database to query, filter, and process football player performance metrics based on advanced statistics.

## Project Architecture & Core Features

*   **Native GUI Application:** Implemented a responsive VCL desktop interface using Embarcadero Delphi 12.
*   **Embedded Database Engine:** Built a serverless relational database backend using SQLite via FireDAC (`TFDConnection`, `TFDQuery`).
*   **Automated Data Seeding:** Implemented an automatic database initialization routine on application startup (`FormCreate`) that builds the internal schema and seeds live player statistics (including Messi, Ronaldo, and Wirtz).
*   **Relational Algebra Query Filtering:** Programmed an event-driven dataset filter executing localized SQL logic (`WHERE goals > expected_goals`) to dynamically extract under-the-radar performers.

## Database Schema & Core Logic

The application queries an embedded table named `players` with the following fields:
*   `player_name` (TEXT)
*   `goals` (INTEGER)
*   `expected_goals` (REAL)
*   `team` (TEXT)

When the action button is triggered, the engine executes the following query dynamically to evaluate player efficiency:

```sql
SELECT player_name, goals, team 
FROM players 
WHERE goals > expected_goals 
ORDER BY goals DESC;
