# MVVM Architecture Notes

## Views and ViewModels

When following MVVM, the ViewModel should not know anything about the view. However, the view is perfectly capable of knowing everything about the ViewModel.

You may call a method from the ViewModel at any time, in response to an event or as you please. But The View holds the reference to the ViewModel, so if you make a timer and call a method to update the data, you will not violate MVVM principals.
