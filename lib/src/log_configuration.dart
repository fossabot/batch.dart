// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:batch/src/log/log_filter.dart';
import 'package:batch/src/log/log_level.dart';
import 'package:batch/src/log/log_output.dart';
import 'package:batch/src/log/log_printer.dart';

class LogConfiguration {
  /// Returns the new instance of [LogConfiguration].
  LogConfiguration.from({
    this.level,
    this.filter,
    this.printer,
    this.output,
  });

  /// The log level
  final LogLevel? level;

  /// The custom log filter
  final LogFilter? filter;

  /// The custom log printer
  final LogPrinter? printer;

  /// The custom log output
  final LogOutput? output;

  @override
  String toString() {
    return 'LogConfiguration(level: $level, filter: $filter, printer: $printer, output: $output)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LogConfiguration &&
        other.level == level &&
        other.filter == filter &&
        other.printer == printer &&
        other.output == output;
  }

  @override
  int get hashCode {
    return level.hashCode ^
        filter.hashCode ^
        printer.hashCode ^
        output.hashCode;
  }
}