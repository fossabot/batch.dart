# Release Note

## v0.6.0

- Added the feature to log notifications at application startup when there are library updates. ([#32](https://github.com/batch-dart/batch.dart/issues/32))
- Changed the log level of the system log regarding application shutdown from `info` to `warn`. ([#45](https://github.com/batch-dart/batch.dart/issues/45))
- Standardized notation regarding licenses. ([#44](https://github.com/batch-dart/batch.dart/issues/44))
- Command line arguments can now be easily passed to batch applications. Command line arguments can be used throughout the framework lifecycle as `SharedParameters`. ([#13](https://github.com/batch-dart/batch.dart/issues/13))

## v0.5.1

- Improved coloring process for log output. Added `logColor` field to `LogOutput` and modified the class `ConsoleLogOutput` to get the console color. ([#31](https://github.com/batch-dart/batch.dart/issues/31))

## v0.5.0

### New Features

- Added the feature to specify any exception type before application execution and skip exceptions that occur during application processing. Only classes that inherit from `Exception` are eligible; classes that inherit from `Error` are not eligible for this retry feature. ([#12](https://github.com/batch-dart/batch.dart/issues/12))
- Added the feature to specify any exception type before application execution and retry when exception occurs during application processing. Only classes that inherit from `Exception` are eligible; classes that inherit from `Error` are not eligible for this skip feature. ([#20](https://github.com/batch-dart/batch.dart/issues/20))
- Added convenient method `shutdown()` to shutdown application in `Step` ([#17](https://github.com/batch-dart/batch.dart/issues/17)).

### Improvements

- Precondition callback now supports asynchronous processing. ([#21](https://github.com/batch-dart/batch.dart/issues/21))
- Callbacks (onStarted, onSucceeded, onError, onCompleted) now support asynchronous processing. ([#23](https://github.com/batch-dart/batch.dart/issues/23))

## v0.4.0

### New Features

- Added `onStarted`, `onSucceeded`, `onError` and `onCompleted` callbacks for `Job`, `Step` and `Task`.
- Added feature to specify the color of the message when logging out with `LogColor` and `ConsoleColor`.
- Improved log message from framework.
- Added convenient method `shutdown()` to shutdown the application from `Task`.

### Destructive Changes

- Changed to define `Precondition` as an anonymous function.

## v0.3.0

### New Features

- Added `Precondition` to check the preconditions for executing `Job`, `Step` and `Task`.
- Conditional branching is now possible for the all layers (`Job`/`Step`/`Task`) based on `BranchStatus` by using the `branchOnSucceeded`, `branchOnFailed` and `branchOnCompleted`.
- Due to the feature to create branches in `Job`, the schedule argument of the `Job` object is no longer required. However, be sure to set up a schedule for the root `Job`s.

### Destructive Changes

- Changed the type of the argument when specifying `Job` scheduling. Now you can use `CronParser` to specify the schedule in Cron format.

## v0.2.1

### New Features

- Added `DefaultLogFilter`.
- Added `Precondition` to check the starting condition of `Job` and `Step`. It can be specified as an argument when creating `Job` and `Step` instances.

### Destructive Changes

- Deleted `DevelopmentLogFilter` and `ProductionLogFilter`.

## v0.2.0

### New Features

- Added logging feature. Some logs are automatically output to the console during batch processing, but you can output logs at any log level by using the various methods for log output.
- Enabled parameter exchange between tasks in the same step.
- Added the concept of SharedParameters, which are shared by the entire batch application.

### Destructive Changes

- Refactored the structure, made `JobLauncher` private and released `BatchApplication` as new entry point.
- Added ExecutionContext as an argument to the execute method of the Task class.

## v0.1.0

- Improved documents.
- Wrapped the return value of execute with `Future` to allow asynchronous processing in `Task`. Asynchronous processing defined in `Task` is safely controlled by the `batch` library, so you don't need to be aware of it when running `JobLauncher`.

## v0.0.1

- First Release!
