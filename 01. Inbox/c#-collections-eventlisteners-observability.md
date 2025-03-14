# Title

If you would like to respond to change in the contents of a list, then you must use an observable collection.

Otherwise a setter property will not be called. The getter will be called, but the setter won't then be called because in effect, the Add() or Remove() method is happening to a copy of that list and not the property.

I am not sure if it would then be called if you set list 1 = property, but that's by the by. Use an observable collection.
