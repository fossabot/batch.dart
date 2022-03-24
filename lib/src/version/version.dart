// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Project imports:
import 'package:batch/src/http/version_pull_request.dart';
import 'package:batch/src/version/version_status.dart';

abstract class Version {
  /// Returns the new instance of [Version].
  factory Version() => _Version();

  /// The current version
  static const current = '0.6.0';

  /// Returns the version status.
  Future<VersionStatus> get status;
}

class _Version implements Version {
  @override
  Future<VersionStatus> get status async => await VersionPullRequest().send();
}