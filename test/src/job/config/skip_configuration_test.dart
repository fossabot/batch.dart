// Copyright (c) 2022, Kato Shinya
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided the conditions.
//
// See more details at https://github.com/batch-dart/batch.dart/blob/main/LICENSE

// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:batch/src/job/config/skip_configuration.dart';

void main() {
  test('Test SkipConfiguration', () {
    final skipConfig = SkipConfiguration(
      skippableExceptions: [FormatException(), Exception()],
    );

    expect(skipConfig.skippableExceptions, [
      FormatException().runtimeType.toString(),
      Exception().runtimeType.toString()
    ]);
  });
}
