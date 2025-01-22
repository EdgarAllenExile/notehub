# Event and Commands

If you particularly need to go from view to view model, you can use commands. Commands enable you to excute strings of logic without needing to get your hands dirty. Seems pretty groovy.

things to think about:
https://stackoverflow.com/questions/4136776/firing-relaycommand-from-codebehind-bound-to-vm

So I think what i actually need to be doing, is setting a property in the view model, then calling NotifyPropertyChanged. The view is presumably subscribed to this change somehow, which is then used to call the setviewpoint method.

https://learn.microsoft.com/en-us/dotnet/maui/xaml/fundamentals/mvvm?view=net-maui-9.0

in the above, they bring up the idea that you have 'notify on property change' which seems right. But that would mean that we need to be binding a property to be able to listen to it.

Actually, I think it is going to be way easier to just pass in the view model when constructing the view model, such as this:

https://stackoverflow.com/questions/75418917/passing-data-from-code-behind-to-viewmodel-maui

This means that a fancy new view model is created when you use the vm, which means that as a result you can use the ncie and decent vm methods, then use them in the view.
