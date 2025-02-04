# Accessing MAUI File systems

Not totally sure the best way to get straight to the resources folder, but I think this should return the top level folder:
`string mainDir = FileSystem.Current.AppDataDirectory;`

`"Resources\\Images\\iconimages"`

plus filename

`pin.filename`

Once we have finished that part, then we can use GeoEventTapped property, which has a location property, which should let us create a new pin there if that's what we feel like.
https://community.esri.com/t5/net-maps-sdk-questions/display-point-graphic-from-mouse-click/td-p/1070741

Double check that the maps that I am using don't actually already have the correct basemap.

## Layers / Base Layers

Try adding a basemap with the spatial reference that we want, then adding layers to the basemap layer collection. https://developers.arcgis.com/net/api-reference/api/netwin/Esri.ArcGISRuntime/Esri.ArcGISRuntime.Mapping.Basemap.BaseLayers.html#Esri_ArcGISRuntime_Mapping_Basemap_BaseLayers.

So I think the idea would be to create a layercollection, then set the basemap somehow.

So create a map layer with the Spatial Reference, or the basemap with the reference? Then when changed, set basemap = basemap style.
