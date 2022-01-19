CREATE TABLE countries (
  code       varchar(2),
  name       varchar(50),
  population int
);
ALTER TABLE countries ADD PRIMARY KEY (code);

CREATE TABLE cities (
  name varchar(50),
  lat  float,
  lon  float
);
ALTER TABLE cities ADD COLUMN located_in varchar(2) NOT NULL;
ALTER TABLE cities ADD COLUMN __id__ integer GENERATED ALWAYS AS IDENTITY;
ALTER TABLE cities ADD PRIMARY KEY (located_in, __id__);
ALTER TABLE cities ADD FOREIGN KEY (located_in)
  REFERENCES countries(code) ON DELETE CASCADE;

ALTER TABLE countries ADD COLUMN capital int;
ALTER TABLE countries ADD CONSTRAINT unique_capital UNIQUE (capital);
ALTER TABLE countries ADD FOREIGN KEY (code, capital)
  REFERENCES cities(located_in, __id__);

CREATE TABLE languages (
  language varchar(50)
);
ALTER TABLE languages ADD PRIMARY KEY (language);

CREATE TABLE speaks (
  code     varchar(2),
  language varchar(50),
  percent  decimal(5, 2)
);
ALTER TABLE speaks ADD PRIMARY KEY (code, language);
ALTER TABLE speaks ADD FOREIGN KEY (code)
  REFERENCES countries(code) ON DELETE CASCADE;
ALTER TABLE speaks ADD FOREIGN KEY (language)
  REFERENCES languages(language) ON DELETE CASCADE;