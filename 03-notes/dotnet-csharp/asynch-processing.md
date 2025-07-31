# Parallel Processing / Async Tasks

## Misc Notes
- Without configuring MaxDegreeOfParallelism(), .NET will default to using all system threads. This is okay if you only have the one call, but if you have two unconfigured Parallel loops running, then they will fight with each other for the resources.
- Concurrent Queues are threadsage on their own.
- If you are using a Task.Factory you should probably configure the scheduler arguments.
- Task Processing Library is the money and is where I should be focusing my energy.
- Producer and Consumer Interface is probably a bit much and probably shouldn't worry about it that much.
