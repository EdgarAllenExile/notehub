# Misc Maui Things

## CaptureAsync()

You can take a screenshot of anything that implements the IView interface by appending `.CaptureAsync()` to the control name.

This method will return a `ScreenshotResult` variable, which you can then turn into whatever you want, using a stream.

You probably want to do this using `CopyToAsync(stream, picture type, quality)`

I think you probably can't give it a straight up memory stream, but that would be more interesting.

What I am not overly sure of, is how to resize the resulting images.

## Maui Shapes & Esri Shapes

Maui.Contols.Polygons, polygons are composed of a collection of points, the PointsCollection. 

