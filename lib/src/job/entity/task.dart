// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:batch/src/job/context/execution_context.dart';
import 'package:batch/src/job/entity/entity.dart';

/// This abstract class represents the smallest unit of processing that is
/// included in the steps when a job is executed.
///
/// The processing of each step of the job should be defined by overriding
/// [execute] in a class that inherits from this [Task].
abstract class Task<T extends Task<T>> extends Entity<Task> {
  /// Returns the new instance of [Task].
  Task({
    Function(ExecutionContext context)? onStarted,
    Function(ExecutionContext context)? onSucceeded,
    Function(ExecutionContext context, dynamic error, StackTrace stackTrace)?
        onError,
    Function(ExecutionContext context)? onCompleted,
  }) : super(
          name: T.toString(),
          onStarted: onStarted,
          onSucceeded: onSucceeded,
          onError: onError,
          onCompleted: onCompleted,
        );

  /// Runs this [Task].
  void execute(final ExecutionContext context);

  /// Shutdown this batch application safely.
  void shutdown() {}
}
