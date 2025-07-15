# String Methods

## Convert.ToString()

Convert.ToString() avoids the potential issue with a null pointer that can be raised by .ToString(). Calling {null}.ToString() will cause an exception, where as using convert.ToString() is null safe.

```
        environment = Convert.ToString(configuration.GetSection("Application")["Environment"]) ?? "Prod";

Versus

        environment = configuration.GetSection("Application")["Environment"].ToString() ?? "Prod";

```
