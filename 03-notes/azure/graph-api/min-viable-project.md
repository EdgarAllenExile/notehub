# Graph MVProject

## Process

First, declare all of the shit that you would usually do in a fairly standard app config or similar.

Then, you will need to do the actual authenticating. Still TBA on how I think the best way to do that is going to be, but it does look like the material online suggests you do a device auth. That seems a bit annoying, so I might try to work out how to get a token using OAth 2.0 and a client id.

## Auth Options

There are a few different options for authentication that you can / could use

I think generally, we use the interactive provider and would guess that is going to be the play again this time.

Actually, interactive browser seems to want a redirect URL that I am not able to provide. Will try possibly using the WAM AUth?

WAM Auth seems more annoying. If we have the fullplaintext of the client secret, then it seems like we can just go straight ahead and use that?

Seems like it might be a bit of a fuck around, and apparently it wants default scopes?

## What Worked

What I have actually ended up doing is using InteractiveBrowserCredentials, passing in tenant, client, authority host and redirect URL (localhost) then just initting a new graph service client and asking my questions.

I am not totally sure if I am missing a token request or something, but it does appear to be working??

-- Is it working because my Client has Graph API authorisation? So I can go straight to the source? I thought there would be some sort of access token step required, but possibly Azure Identity / MSAL is working its magic?

### Different ways to skin a cat

So this does actually work in the a single stage process, using InteractiveBrowserCredentials and passing in the appropriate information:

- Scopes are user.read
- Tenant is the tenant
- ClientID is the App ID
- REdirectURI is http://LocalHost

But Herb has suggested that we use a two stage process of getting the token, which appears to reflect what MS suggest in their docs.

I don't know if this is specific to a different version of .NET, because their docs use `netcoreapp3.1` but we shall see.

It appears that some amount of the two stage process, as noted in the docs and from what was being discussed is now deprecated.

Does this render the Microsoft.Identity lib toooootally redundant now? If not, why would anyone use it?

### What the differnet bits mean

TokenCredential is a class / object that can be used to actually do the getting of the tokens? This seems interesting and I am interested in it, but does this just cut down on a bunch of steps??

- Following on from this, the TokenCredential seems to operate in the same areas as the existing GetToken and / or public client AquireTokenSilent/Interactive.
    - If these are / are not related then why would we need to fuck around with the different versions of the methods?
- Ultimately, TokenCredential seems to be implemented by the ClientCertificateCredential / InteractiveBrowserCredentials / DeviceCodeCredentials methods

We should review `https://nestenius.se/azure/default-azure-credentials-under-the-hood`
