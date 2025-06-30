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
