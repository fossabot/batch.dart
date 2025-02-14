// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Project imports:
import 'package:batch/src/job/context/execution_context.dart';
import 'package:batch/src/job/event/task.dart';
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
    for (final task in _tasks) {
      await super.executeRecursively(
        event: task,
        execute: (task) async => await task.execute(context),
      );
    }
  }
}
