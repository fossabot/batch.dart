// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:batch/src/job/context/execution_context.dart';
import 'package:batch/src/job/entity/task.dart';
import 'package:batch/src/job/launcher/launcher.dart';

class TaskLauncher extends Launcher<Task> {
  /// Returns the new instance of [TaskLauncher].
  TaskLauncher({
    required ExecutionContext context,
    required List<Task> tasks,
  })  : _tasks = tasks,
        super(context: context);

  /// The tasks
  final List<Task> _tasks;

  @override
  Future<void> run() async {
    if (_tasks.isEmpty) {
      throw Exception('Register the task to be launched is required.');
    }

    for (final task in _tasks) {
      await super.executeRecursively(entity: task);
    }

    super.clearParameters();
  }
}
