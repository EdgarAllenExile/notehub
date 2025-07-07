# Code Snippets

## APIM Control Flows

```<choose>
    <when condition="boolean expression">
        logic to apply
```

You can then slot in an `otherwise` as you need.

Other things includ you can include `<forward-request timeout="time in seconds" follow-requests`

`limit-concurrency` key and max count, then nested policy statement

`log to event hub` loggerId and partionID

`Mock-Response` status-code and content-type

`retry` actually has quite a few things:
- condition=MUST BE A BOOL
- count='retry attempts'
- interval='retry time in seconds'
- max-interval='max interval time'
- delta='interval dela in seconds'
- first-fast-retry='boolean expression'
- THEN ONE ORE MORE CHILD POLICIES

`return-response` response-variable-name='existing context var'
- `set-header`
- `set-body`
- `set-status`

## Finding Outbound ip addresses

```az webapp show \ --rgr --name --query --outputa```

## blob storage name

default endpoint for blob storage is: `http://storageaccount.blob.core.windows.net`

From there you can get to the container by appending `/container`

From there you can get to teh blob by appending `/blob`

Hence, all together it is:
`http://storageaccount.blob.core.windows.net/container/blob`


