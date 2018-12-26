-- View: storm20170214_line_segments

-- DROP VIEW storm20170214_line_segments;

CREATE OR REPLACE VIEW storm20170214_line_segments AS 
 SELECT row_number() OVER () AS segment_id,
    a.id AS pt_from_id,
    b.id AS pt_to_id,
    a.pet_id,
    a.date_time,
    a.date,
    st_makeline(st_geomfromtext(((('POINT('::text || a.lng) || ' '::text) || a.lat) || ')'::text, 4326), st_geomfromtext(((('POINT('::text || b.lng) || ' '::text) || b.lat) || ')'::text, 4326)) AS geom
FROM (
SELECT row_number() OVER () AS row_id,
    id,
    pet_id,
    date_time,
    date,
    lng,
    lat
   FROM storm20170214
   ORDER BY date_time) a,
(SELECT row_number() OVER () AS row_id,
    id,
    pet_id,
    date_time,
    date,
    lng,
    lat
   FROM storm20170214
   ORDER BY date_time) b
  WHERE a.row_id+1 = b.row_id;

ALTER TABLE storm20170214_line_segments
  OWNER TO postgres;
