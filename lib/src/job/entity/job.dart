// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:batch/src/job/entity/entity.dart';
import 'package:batch/src/job/entity/step.dart';
import 'package:batch/src/job/precondition.dart';

/// This class represents a job which is the largest unit in batch execution processing.
///
/// Pass a unique [name] and a [cron] that represents the execution schedule
/// to the constructor when initializing [Job]. And then use the [nextStep] method
/// to add the [Step] to be executed.
class Job extends Entity<Job> {
  /// Returns the new instance of [Job].
  Job({
    required String name,
    required this.cron,
    Precondition? precondition,
  }) : super(name: name, precondition: precondition);

  /// The cron
  final String cron;

  /// The steps
  final List<Step> steps = [];

  /// Adds [Step].
  ///
  /// Steps added by this [nextStep] method are executed in the order in which they are stored.
  ///
  /// Also the name of the Step must be unique, and an exception will be raised
  /// if a Step with a duplicate name has already been registered in this Job.
  void nextStep(final Step step) {
    if (!_checkName(name: step.name, steps: steps)) {
      throw Exception('The step name "${step.name}" is already registered.');
    }

    steps.add(step);
  }

  bool _checkName({
    required String name,
    required List<Step> steps,
  }) {
    for (final step in steps) {
      if (step.name == name) {
        return false;
      }
    }

    return true;
  }
}
