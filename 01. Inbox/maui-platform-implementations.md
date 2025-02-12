# Platform Implementations

## Handlers

Honestly don't worry about it

## Compile time Bindings?

In the code behind you can use 
`#IF WINDOWS` 
and that will endure that the logic that has failed the test will not be compiled

## Runtime

write up some notes on that link: https://blog.ewers-peters.de/platform-specific-xaml-in-net-maui


`if (DeviceInfo.Platform == DevicePlatform.Android)
{
    VerticalLayout.Add(new Android.ViewAndroid());
}
else if (DeviceInfo.Platform == DevicePlatform.iOS)
{
    VerticalLayout.Add(new iOS.ViewiOS());
}`
