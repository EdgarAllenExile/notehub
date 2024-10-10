# Services vs Components

A component is a reusable building block or portion of an appliction. Tend to think of as custom html tags.

Services are generally made up of several components and are designed to combine multiple components or features together. If the service fails, it is also expected that this will not be catastrophic to the overall function of the application.

A component is designed to fit into an application and their effectiveness is largely tied to the system that they inhabit.

Components define and manage the view logic. Services provide data or functionality across a system.

Services are used to share data or functionality between different parts of your application, while components are used to define and manage the view-related logic for a single piece of your application.

## Angular Specific

Slightly different, and services can return html.
