## Hinweise zur Nutzung des Materials

- `bricks-no-header.csv`: CSV-File (nur Daten, keine Headerzeile) für   
  den Import via `\COPY` in SQL-Tabelle `bricks` (wird gelesen von `Pg-load.bricks.sql`).

- `bricks-no-header-mangled.csv`: ⚠️ Defekte Version von `bricks-no-header.csv`,
  führt zu Fehler beim Import via `\COPY`.

- `Pg-load-bricks.sql`: Tabelle `bricks` mittles `CREATE TABLE` neu anlegen,
  Zeilen aus `bricks-no-header.csv` via `\COPY` importieren.

  Usage (UNIX-Shell):
  ~~~
  $ psql -d ‹database› -f Pg-load-bricks.sql
  ~~~

  Usage (PostgreSQL-Shell `psql`):
  ~~~
  =# \i Pg-load-bricks.sql
  […]
  =# TABLE bricks; 
  ~~~

