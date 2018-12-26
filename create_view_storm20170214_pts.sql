-- View: storm20170214_pts

-- DROP VIEW storm20170214_pts;

CREATE OR REPLACE VIEW storm20170214_pts AS 
 SELECT storm.id,
    storm.pet_id,
    storm.utcdate,
    storm.date_time,
    storm.lat,
    storm.lng,
    st_geomfromtext(((('POINT('::text || storm.lng) || ' '::text) || storm.lat) || ')'::text, 4326) AS geom,
    storm.gsmarea,
    storm.gsmcell,
    storm.batt,
    storm.temp,
    storm.gps,
    storm.updated,
    storm.type,
    storm.status,
    storm.unix,
    storm.hh,
    storm.h,
    storm.t,
    storm.hour,
    storm.date
   FROM storm20170214 AS storm;

ALTER TABLE storm20170214_pts
  OWNER TO postgres;
