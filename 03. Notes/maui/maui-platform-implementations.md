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

## How to get around disctinct name requirements

If you create a placeholder map componenet (grid or similar) then you can simply add your platorm specific implementation to this componenet at compile time. It is more annoying to name it this way, but you can still add a Map property and then access it that way.
