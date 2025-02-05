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

## Overview that I gave to Jye that I quite liked
So you start with basically a component, called Map. This is closer to an interface than an actual component because often it does not contain any actual logic. You give this interface style bits and pieces that you will then implement in a component handler. For Apple devices, you import the Apple Maps component library and then tie your Map compnent methods and properties to their native Apple Map equivalents.
 
For Windows implementations, you do the same thing, but your handler doesn't have the native equivalent to point at. So you create an HTML page to act as your map and write out custom Javascript functions that do the bulk of the work. You can use the Microsoft Javascript Map Library to interact with the map, but I think this is mostly just an abstracted way of doing the direct JS you might do on a website.
 
Once you have your (mostly JS) html page, you stick it in the resources directory of your project and then import it as a WebView. You then tie together your Map Component to your WebView there.
 
Notably the handler style implementation of business logic is not actually that different from how other business logic is handled because MAUI is big into ViewModels. So that is usually where the bulk of your business logic is stored anyway.
 
So your handler sits along side the ViewModel and passes things between the two
 
