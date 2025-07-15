# Tokens

MSAT or Microsoft.Identity tokens can be aquired in a variety of different ways. The documentation is important for these purposes.

## Client Authorisations

If you are authenticating a client application, as opposed to a platform for applications to log into you need a static scoped application.

Send POST request to correct login.microsoft URL, with a static scope, client ID, client secret and grant type.

- Grant Type should be set to "Client Credentials",
- Client Secret should be a secret created IN THAT CLIENT, not the API
- Client ID requires that the client has an app registration
- Static scope is the API's application URI, with "/.default" appended to the end


This requires that your client has an application registration, admin consent set in the scopes, a client secret and that the application has correctly been given a role within the TARGET API client registration.


Suggested to use a library to manage most of these operations. The MSAT library for WebAssembly applications is pretty useful, the MS.Identity.Client application is not terrible for apps with no log ins.


### Resources

- [OAuth 2.0 client credentials flow on the Microsoft identity platform - Microsoft identity platform | Microsoft Learn](https://learn.microsoft.com/en-us/entra/identity-platform/v2-oauth2-client-creds-grant-flow)
- [c# - How to acquire token by AD app ClientId and Client Secret with the Microsoft Authentication Library (MSAL) - Stack Overflow](https://stackoverflow.com/questions/75394006/how-to-acquire-token-by-ad-app-clientid-and-client-secret-with-the-microsoft-aut)
