/* extract most notable geoglows outlet reaches for the harmonized hydrosheds basins */
DROP TABLE IF EXISTS vidigis.hydrosheds_geoglowsoutlets;
CREATE TEMPORARY TABLE crosstest AS SELECT hyd.name as name,geog.linkno, geog.geom from vidigis.hydrosheds_harmonized as hyd LEFT JOIN geoglowsv2.geoglowsglobalstreams AS geog ON ST_Crosses(geog.geom::geometry,hyd.geometry);
CREATE TABLE vidigis.hydrosheds_geoglowsoutlets AS 
SELECT DISTINCT ON (geogm."TerminalLink") crosstest.name as name, geogm."USContArea" as uparea, geogm."TerminalLink" as linkno, crosstest.geom as geom FROM crosstest as crosstest LEFT JOIN geoglowsv2.geoglowsglobalmodeldata as geogm ON geogm."LINKNO" = crosstest.linkno WHERE geogm."USContArea" > 100e6  ORDER BY geogm."TerminalLink",geogm."USContArea" DESC;
GRANT SELECT ON vidigis.hydrosheds_geoglowsoutlets TO geobrowse;  
