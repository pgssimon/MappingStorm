SELECT storm.pet_id,
    ST_Length(ST_Transform(ST_Collect(geom),2193)) AS geom
   FROM storm20170214_line_segments AS storm
   GROUP BY storm.pet_id;