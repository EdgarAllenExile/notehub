# MQTT Messaging

            MessagingCenter.Subscribe<MqttClient, string>(this, "SilvaUser", UpdateSilvaUser);
```MessagingCenter.Subscribe<MainPage, string>(this, "Hi", async (sender, arg) =>
{
    await DisplayAlert("Message received", "arg=" + arg, "OK");
});```

in this instance we are subscribing the this object, to the 'hi' messages sent by the MainPage type whose payload is a string.
<!-- in this instance we are subscribing to 'SilvaUser' messges send by the MainPage type,  -->

this actually does not seem to make that much sense, but I do think I have almost worked it out.
