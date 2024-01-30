# Vidi-waterflux-GIS
GIS datasets related to waterflux project, watershed boundaries etc.

## common_borders
The obtained common borders between neighboring basins will be used in the estimation of the water fluxes process.


## grdc_stations
Consists of GRDC station list dataset https://portal.grdc.bafg.de/applications/public.html?publicuser=PublicUser#dataDownload/StationCatalogue

## region_extent
Consists of bounding box `gpkg` layers with a 0.5 degree buffer. Useful to define rois to download other relevant datasets, obtained from the `roi_basins` folder data analysis.

## roi_basins
Consists of basin shapefiles for our regions of interest (North Sea and Horn of Africa).

## Codes
Consists of code snippets used to build some of the datasets in this repository.

### make_shp_extent.ipynb
A relatively simple notebook to create regions of interest and to export it to shapefile based on coordinates of the bounding box.

### read_gpkg_extract_total_bounds.ipynb
This module reads a geopackage with three layers. For the layers HornOfAfrica and NorthSeaRegion, total bounds is extracted and exported as a `gpkg`.

### Schrer IceSat-2 river surface slope IRIS
ICESat-2 river surface slope (IRIS): A global reach-scale water surface slope dataset (Scherer et al., 2023)

### Somalia (https://github.com/ITC-Water-Resources/Vidi-waterflux-GIS/tree/main/somalia)
Consists of water level and river discharge data, and some auxilary info, for the Juba and Shabelle rivers. Downloaded from: https://snrfa.faoswalim.org/stations
Double check terms and conditions, before use.

## Caravan dataset (Caravan - A global community dataset for large-sample hydrology)
https://zenodo.org/records/7944025
