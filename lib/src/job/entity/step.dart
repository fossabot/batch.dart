// Copyright (c) 2022, Kato Shinya
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided the conditions.
//
// See more details at https://github.com/batch-dart/batch.dart/blob/main/LICENSE

// Dart imports:
import 'dart:async';

// Project imports:
import 'package:batch/src/job/config/retry_configuration.dart';
import 'package:batch/src/job/config/skip_configuration.dart';
import 'package:batch/src/job/context/execution_context.dart';
import 'package:batch/src/job/entity/entity.dart';
import 'package:batch/src/job/entity/task.dart';
import 'package:batch/src/job/task/shutdown_task.dart';

/// This class represents the processing of each step that constitutes a job in batch processing.
class Step extends Entity<Step> {
  /// Returns the new instance of [Step].
  Step({
    required String name,
    FutureOr<bool> Function()? precondition,
    Function(ExecutionContext context)? onStarted,
    Function(ExecutionContext context)? onSucceeded,
    Function(ExecutionContext context, dynamic error, StackTrace stackTrace)?
        onError,
    Function(ExecutionContext context)? onCompleted,
    SkipConfiguration? skipConfig,
    RetryConfiguration? retryConfig,
  }) : super(
          name: name,
          precondition: precondition,
          onStarted: onStarted,
          onError: onError,
          onSucceeded: onSucceeded,
          onCompleted: onCompleted,
          skipConfig: skipConfig,
          retryConfig: retryConfig,
        );

  /// The tasks
  final List<Task> tasks = [];

  /// Adds next [Task].
  ///
  /// Tasks added by this [nextTask] method are executed in the order in which they are stored.
  void nextTask(final Task task) => tasks.add(task);

  /// Add a task to shutdown this application.
  void shutdown() => tasks.add(ShutdownTask());
}
