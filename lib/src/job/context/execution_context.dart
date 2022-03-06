// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:batch/src/job/branch/branch_contribution.dart';
import 'package:batch/src/job/entity/job.dart';
import 'package:batch/src/job/entity/step.dart';
import 'package:batch/src/job/entity/task.dart';
import 'package:batch/src/job/execution.dart';
import 'package:batch/src/job/repository/service/job_parameters.dart';
import 'package:batch/src/job/repository/service/parameters.dart';
import 'package:batch/src/job/repository/service/shared_parameters.dart';
import 'package:batch/src/job/repository/service/step_parameters.dart';

/// This class represents a context for managing metadata that is accumulated
/// as a batch application is executed.
class ExecutionContext {
  /// The current job execution
  Execution<Job>? jobExecution;

  /// The current step execution
  Execution<Step>? stepExecution;

  /// The current task execution
  Execution<Task>? taskExecution;

  /// The branch contribution
  final BranchContribution branchContribution = BranchContribution();

  /// The shared parameters
  final Parameters sharedParameters = SharedParameters.instance;

  /// The job parameters
  final Parameters jobParameters = JobParameters.instance;

  /// The step parameters
  final Parameters stepParameters = StepParameters.instance;
}
