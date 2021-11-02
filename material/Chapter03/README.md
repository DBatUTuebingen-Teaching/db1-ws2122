## Usage Notes

- `bricks-no-header.csv`: CSV file (data rows only, no header row) ready
  for the import via `\COPY` into SQL table `bricks` (read by `Pg-load.bricks.sql`).

- `bricks-no-header-mangled.csv`: ⚠️ Mangled version of `bricks-no-header.csv`,
  leads to an error if imported via `\COPY`.

- `Pg-load-bricks.sql`: Create a new SQL table `bricks` via `CREATE TABLE`,
  import data rows in `bricks-no-header.csv` into table `bricks` via `\COPY`.

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

