-- View: storm20170214_territory_polygon

-- DROP VIEW storm20170214_territory_polygon;

CREATE OR REPLACE VIEW storm20170214_territory_polygon AS 
 SELECT storm.pet_id,
    ST_Buffer(
     ST_ConvexHull(
      ST_Collect(
       st_geomfromtext(((('POINT('::text || storm.lng) || ' '::text) || storm.lat) || ')'::text, 4326)
       )
      )
     ,0.0005
    ) AS geom
   FROM storm20170214 AS storm
   GROUP BY storm.pet_id;

ALTER TABLE storm20170214_territory_polygon
  OWNER TO postgres;
