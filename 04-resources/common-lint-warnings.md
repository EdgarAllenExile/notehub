# Common Lint Warnings

## Use Primary Constructor

Flags classes that can use a primary constructor as opposed to a seperate constructor definition.

- A primary constructor places constructor parameters in parentheses following type and preceeding injections. This indicates that any instance of this type will require these params to function.
- This also means that you do not need to do that whole thing with inserting an underscore before an instance of a parameter that has been passed in. Still not sure why this is important anyway.
- This does not remove the need to declare the instances of the parameters passed in as readonly though

### Example

#### Primary Constructor

```
public class FormDataService(ISecureHttpClient secureHttpClient) : IFormDataService
{
    public readonly ISecureHttpClient _secureHttpClient = secureHttpClient;
```

#### Bad Constructor

```
    public class FormStatusService : IFormStatusService
    {
        private readonly ISecureHttpClient _secureHttpClient;

        public FormStatusService(ISecureHttpClient secureHttpClient)
        {
            _secureHttpClient = secureHttpClient;
        }
```

### Remove Fields Option

The "Remove Fields" Option within the make primary constructor section will remove the declaration of private readonly fields and the instances with the underscore.



The underscore prefix is a convention to note private members of a class. The Private Readonly flags are to default to the least access necessary for the service to function.

### Possible Null Return
There are several different ways to ensure this is not pestering you. But as an example, for attempting to get a string from file config you can use something like this:
`Convert.ToString(configuration.GetSection("Application")["sourceBranch"])`

As opposed to something like this:
`builder.Configuration.GetValue<string>("Application:Url")`
