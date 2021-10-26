## Hinweise zur Nutzung des Materials

### Datenmodell Text

- `GenBank-SCU49845.txt`: GenBank-Eintrag für *Baker's Yeast*.
- `set5610-1.txt`: LEGO-Set 5610 (Datenmodell Text).

- `weight-of-set5610.sh`: Gesamtgewicht des LEGO-Set 5610.  Shell-Skript, basierend auf `sed` und `awk` (Datenmodell Text).

  Usage (UNIX-Shell):
  ~~~
  $ weight-of-set5610.sh < set5610-1.txt
  ~~~

- `extract-dna-sequence.sh`: Extraktion einer GATC-Sequenz aus einem GenBank-Eintrag.
  Shell-Skript, basierend auf `awk` (Datenmodell Text).
  
  Usage (UNIX-Shell):
  ~~~
  $ extract-dna-sequence.sh 3300 4037 < GenBank-SCU49845.txt
  ~~~

### Datenmodell Nested Arrays and Dictionaries

- `set5610-1.json`: LEGO-Set 5610 (Datenmodell JSON, Nested Arrays and Dictionaries).
- `set5610-1.jq`, `xsys.jq`, `grouping.jq`: einfache JSONiq-Beispiele

  Ausführung in RumbleDB (bspw. mit RumbleDB-Parameter `--query-path ‹file›.jq` oder via _cut & paste_ am RumbleDB-Prompt)

- `weight-of-set5610.jq`: Gesamtgewicht des LEGO-Set 5610. JSONiq-Query, liest JSON-File `set5610-1.json`.
 
- `earthquakes.json`: Erdbebendaten des US Geological Surveys (Datenmodell JSON, Nested Arrays and Dictionaries).

- `worst-northern-quake-mag.jq`: Stärke des schwersten Erdbebens auf der Nordhalbkugel. JSONiq-Query, liest `earthquakes.json`.

- `worst-northern-quake-mag-place.jq`: Stärke _und Ort_ des schwersten Erdbebens auf der Nordhalbkugel. JSONiq-Query, liest `earthquakes.json`.

- `earthquakes-dup.json`: Erdbebendaten des US Geological Surveys, enthält Duplikat des schwersten Erdbebens mit Stärke 4.9 (Datenmodell JSON, Nested Arrays and Dictionaries).

### Datenmodell Tabular

- `DB1.py`: Python-Modul zur Bereitstellung von einfacher Query-Funktionalität (PyQL)

  Usage (in Python 3):
  ~~~
  from DB1 import Table
  
  t = Table('‹file›.csv')
  for row in t:
    ...
  ~~~
 
 - `project.py`: einfaches PyQL-Beispiel

   Usage (UNIX-Shell):
   ~~~
   $ python3 project.py
   ~~~

- `worst-northern-quake-mag.py`: Stärke des schwersten Erdbebens auf der Nordhalbkugel. PyQL-Query, liest `earthquakes.csv`.

- `worst-northern-quake-mag-place.jq`: Stärke _und Ort_ des schwersten Erdbebens auf der Nordhalbkugel. PyQL-Query, liest `earthquakes.csv`. 
