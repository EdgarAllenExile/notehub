# Auth

# Types of Authentication Flows

Authorisation Flow, enables user sign in and access to resources on part of uesr. Can be used for all non-daemon apps.

Client Credentials, used to access web apis on behalf of the app itself. Usually for server to server or daemon uses.

Devie code, device specific auth using device ID reference. Can be used at the CLI level.

Implicit grant, not recommended but can be used by SPAs or web apps.

On-Behalf-Of, allows an api to inpersonate a user on behalf of that user. used by web apis.

Username / Password, direct unadulterated sign ins. Used by desktops and mobile.

Integrated Windows Auth, used by apps on the entra domain, allowsthem to get tokens silently, Used by desktop and mobile apps.

## Types of Client

You can use public or confidential clients. Public clients can only use user auth and are accessible and thus less secure. Confidential clients run on servers and are hard to see from the outside. They use a client ID but do not expose secrets.

## Graph

Generally, graph wants you to use GET to read, POST to create, PATCH to update, PUT to replace and DELETE to remove

## KVS

You can auth for a KVS in three main ways:

- Manged identity and entra manged identity
- Service principal and secret / certificate (generally use secret, but app to app useful)

There are some best practices to remember:

- Use seperate KVS per env
- Access control
- backup & recovery
- logging

can be beneficial to auth using a REST token style set up. I don't know why or for what purpose, but it does work.

If you try and do this though, you must include an Authorization header. Requests that come without such things will be returned as 401s with the WWW-Authenticate header.
