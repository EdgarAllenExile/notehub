# Platforms and Shit

The Device class isa utility class that provides device specific info regarding where you app is being run. The most important property for this is called DeviceInfo.Platform. This will return a string indicating the platform your app is currently being run on.

You can query the above and then use standard consitional logic to manipulate it. 

You can do the equivalent thing in XAML using the OnPlatform extension. Which allows you to detect the platform at runtime. It looks kinda like this: 
`<VerticalStackLayout>  
    <VerticalStackLayout.Padding>
        <OnPlatform x:TypeArguments="Thickness">
            <On Platform="iOS" Value="30,60,30,30" />
        </OnPlatform>
    </VerticalStackLayout.Padding>
    <!--XAML for other controls goes here -->
    ...
</VerticalStackLayout>`

> [!NOTE]
> You can use TypeArguments attribute to specify which argument, because out of the box, OnPlatform is generic!


