# App Insights

App Insights is an extension of Azure Monitor and provides Applicaiton Performance Monitoring. This can include understanding how an app is performinb and reviewing execution data to determine the cause of an incident. 

Also allows you to collect trace data, provided you give it a location to store that information.

Overview:

- Live metrics
- Availability
- GH or DevOps integration
- Usage
- Smart Detection
- Application Map
- Distributed Tracing

App Insights can monitor basically everything, such as:

- Request rates, response times and failures
- Dependancies, responses and faiures
- Exceptions
- Page views and performance
- AJAX calls
- User and session counts
- Performance Counters
- Host diagnostics
- Diagnostic trace logs
- Custom events and metrics

## Metrics

There are two kinds of Metrics:

- Log based metrics, which can be trnslated into kusto queries 
- Standard metrics which are stored in a preaggregated time series

Standard metrics have better performance, since they are preaggregated. This makes them better for dashboarding and real time alterting.

Log based have more dimensions, making them better for analysis and diagnostics.

You can switch between the two in the namespace selector in the metrics explorer.

You can send events manually using the SDK, or you can let the auto instramentation do its thing and call manually. This can let you collect large, accurate amounts of data. That said, it might also get too high for apps that generate large amounts of data. App insights can implement reduction volume techniqueues to filter and lower collected events, however this can impact accuracy.

Preaggergated metrics are not stored as individual events, but preaggregated time series. This allows queries to take less computer faster and execute faster. this can enable more responsive dashboards.

Newer Az SDKs preaggregate. But App Insights will assist with preaggregation on the back end. This doesn't reduce volume transmitted, but you can still use the preaggregated metrics and real time dimensioning.

You can also do ingest sampling, which preaggregates events before sapling so that they never impact the accuracy of your metrics.

## Availability Tests

You can create up to 100 availability tests per app insights instance. These do not require any changes to the websights, just ping them. 

The tests can include standard tests, which sends an http request which validates response, measures performance and can include other tests. these other tests include cert validity, life time check, http request verb checks and http header / daata checks.

You can also have custom TrackAvailability checks, which lets you create a custom app to run these tests and use the TackAvailability method in your app to do this. 

Lastly there is the classic URL ping tests. Which are going away and are like the standard tests only less good.

## Trouble Shooting App Performance using App Mapp

The applicatoin mapp lets you spot performance bottlenecks or hotspots across all coponents of your app. Each node will show performance and alert status. 

From there you can also dig down into diagnostics and advisor recommendations. 

In this instnace, each component is an observed dependancy that you can stick App insights on and might not include external services.

App insights will discover components using http dependancy calls made between servers using the App Insights SDK.

This is done through the progressive discovery of components, hitting update map will reresh all components discovered to that point. 

This lets you visualise components and complete app topologies with many different components.

all done time to stuuuudy
