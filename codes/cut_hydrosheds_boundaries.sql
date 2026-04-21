/* cut hydrosheds boundaries at neigbouring basins*/
CREATE TEMPORARY table hydrosheds_borders  AS SELECT hyd1.name as src_name, hyd2.name as neighbour_name, ST_SharedPaths(ST_Boundary(hyd1.geometry),ST_Boundary(hyd2.geometry)) as geometry from vidigis.hydrosheds_harmonized as hyd1 LEFT JOIN vidigis.hydrosheds_harmonized as hyd2 ON ST_overlaps(hyd1.geometry,hyd2.geometry) OR ST_touches(hyd1.geometry,hyd2.geometry);
CREATE TEMPORARY TABLE hydroshed_borders_merge AS SELECT src_name,ST_collect(geometry) AS geometry FROM hydrosheds_borders GROUP BY src_name ;
INSERT INTO hydrosheds_borders SELECT hyd1.name as src_name, 'OCEAN' AS neighbour_name, ST_difference(ST_boundary(hyd1.geometry),hydbord.geometry) as geometry from vidigis.hydrosheds_harmonized as hyd1 INNER JOIN hydroshed_borders_merge AS hydbord ON hyd1.name =  hydbord.src_name;
DROP TABLE IF EXISTS vidigis.hydrosheds_borders;
CREATE TABLE vidigis.hydrosheds_borders AS SELECT src_name,neighbour_name,ST_collectionextract(geometry) as geometry from hydrosheds_borders;
GRANT SELECT ON vidigis.hydrosheds_borders TO geobrowse;
