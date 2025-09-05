# Azure Monitor and Azure Alerts

Azure Monitor Alerts monitordata and capture signals that indicate that there is something happening on the specified resource.

Alert rules combine:

- The resource to monitor
- The signal or data from that resource
- Conditions

Alerts are triggered if all? conditions are met, it then inits the associated action group and updates the state of the alert, each of these actions is taken per resouce and events are fired per resource.

## Types of Alerts

There are several different types and subtypes of alerts:

- Metric Alerts, which monitors Live Metrics, preloaded and computed data for simple monitoring
- Log Search Alerts, used for advanced logic operations
    - Simple Log Search Alerts, used for unaggregated real time monitoring, each error triggers an alert pushing immediate action
- Activity Log Alerts, provide auditing of all actions used on a resource, watches restarts, creation / deletion etc
- Prometheus Alerts, used for prometheus metrics in the managed service of the same name

### Metric Alerts

I think that metric alerts are going to be the easiest option in most situations

Metric alerts with more than one condition are fired when all conditions are true and resolces itself when at least one of the conditions are false 
