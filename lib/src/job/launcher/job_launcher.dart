// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Project imports:
import 'package:batch/src/job/context/execution_context.dart';
import 'package:batch/src/job/event/job.dart';
import 'package:batch/src/job/launcher/launcher.dart';
import 'package:batch/src/job/launcher/step_launcher.dart';

/// This class provides the feature to securely execute registered jobs.
class JobLauncher extends Launcher<Job> {
  /// Returns the new instance of [JobLauncher].
  JobLauncher({
    required Job job,
  })  : _job = job,
        super(context: ExecutionContext());

  /// The job
  final Job _job;

  @override
  Future<void> run() async => await super.executeRecursively(
        event: _job,
        execute: (job) async {
          await StepLauncher(
            context: context,
            steps: job.steps,
            parentJobName: job.name,
          ).run();

          // Removes step job parameters set within the step executed last time.
          super.context.jobParameters.removeAll();
        },
      );
}
