/*Create a simplified/snapped hydrosheds polygon table*/
CREATE SCHEMA IF NOT EXISTS vidigis;
GRANT USAGE ON SCHEMA vidigis TO geobrowse;
DROP TABLE IF EXISTS vidigis.hydrosheds_harmonized; 
CREATE  TABlE vidigis.hydrosheds_harmonized AS 
SELECT "PFAF_ID" ,"HYBAS_ID" , "NEXT_DOWN" , "NEXT_SINK" , "MAIN_BAS" , "DIST_SINK" , "DIST_MAIN" , "SUB_AREA" , "UP_AREA" , "ENDO" , "COAST", "ORDER" ,"SORT", name, ST_reducePrecision(ST_removeSmallParts(geometry,0.1,0.1),1e-4) as geometry from vidiegu25.hydroshedbasins;
GRANT SELECT ON TABLE vidigis.hydrosheds_harmonized TO geobrowse;
