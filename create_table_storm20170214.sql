-- Table: storm20170214

-- DROP TABLE storm20170214;

CREATE TABLE storm20170214
(
  id integer,
  pet_id integer,
  utcdate character varying(20),
  date_time timestamp,
  lat numeric(20,6),
  lng numeric(20,6),
  gsmarea character varying(50),
  gsmcell character varying(50),
  batt numeric(20,6),
  temp integer,
  gps integer,
  updated timestamp,
  type character varying(50),
  status character varying(50),
  unix timestamp,
  hh character varying(20),
  h character varying(20),
  t character varying(50),
  hour character varying(50),
  date character varying(50)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE storm20170214
  OWNER TO postgres;
