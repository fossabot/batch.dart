// Copyright (c) 2022, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:batch/src/log/input_log_event.dart';
import 'package:batch/src/log/log_level.dart';
import 'package:batch/src/log/printer/log_printer.dart';

void main() {
  test('Test LogPrinter', () {
    final logPrinter = _LogPrinter();

    expect(() => logPrinter.init(), returnsNormally);
    expect(
      logPrinter.log(
        InputLogEvent(
          level: LogLevel.debug,
          message: 'test',
          error: null,
          stackTrace: null,
        ),
      ),
      ['test'],
    );
    expect(() => logPrinter.dispose(), returnsNormally);
  });
}

class _LogPrinter implements LogPrinter {
  @override
  void init() {}

  @override
  List<String> log(InputLogEvent event) {
    expect(event.level, LogLevel.debug);
    expect(event.message, 'test');
    expect(event.error, null);
    expect(event.stackTrace, null);
    return [event.message];
  }

  @override
  void dispose() {}
}