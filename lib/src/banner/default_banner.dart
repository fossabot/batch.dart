// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Dart imports:
import 'dart:async';

// Project imports:
import 'package:batch/src/banner/banner.dart';
import 'package:batch/src/version/version.dart';

class DefaultBanner implements Banner {
  /// The line
  static const _line =
      '-------------------------------------------------------------------------------------------------------------------------------------------';

  /// The brand logo
  static const _logo = '''
          _____                    _____                _____                    _____                    _____
         /\\    \\                  /\\    \\              /\\    \\                  /\\    \\                  /\\    \\
        /::\\    \\                /::\\    \\            /::\\    \\                /::\\    \\                /::\\____\\
       /::::\\    \\              /::::\\    \\           \\:::\\    \\              /::::\\    \\              /:::/    /
      /::::::\\    \\            /::::::\\    \\           \\:::\\    \\            /::::::\\    \\            /:::/    /
     /:::/\\:::\\    \\          /:::/\\:::\\    \\           \\:::\\    \\          /:::/\\:::\\    \\          /:::/    /
    /:::/__\\:::\\    \\        /:::/__\\:::\\    \\           \\:::\\    \\        /:::/  \\:::\\    \\        /:::/____/
   /::::\\   \\:::\\    \\      /::::\\   \\:::\\    \\          /::::\\    \\      /:::/    \\:::\\    \\      /::::\\    \\
  /::::::\\   \\:::\\    \\    /::::::\\   \\:::\\    \\        /::::::\\    \\    /:::/    / \\:::\\    \\    /::::::\\    \\   _____
 /:::/\\:::\\   \\:::\\ ___\\  /:::/\\:::\\   \\:::\\    \\      /:::/\\:::\\    \\  /:::/    /   \\:::\\    \\  /:::/\\:::\\    \\ /\\    \\
/:::/__\\:::\\   \\:::|    |/:::/  \\:::\\   \\:::\\____\\    /:::/  \\:::\\____\\/:::/____/     \\:::\\____\\/:::/  \\:::\\    /::\\____\\
\\:::\\   \\:::\\  /:::|____|\\::/    \\:::\\  /:::/    /   /:::/    \\::/    /\\:::\\    \\      \\::/    /\\::/    \\:::\\  /:::/    /
 \\:::\\   \\:::\\/:::/    /  \\/____/ \\:::\\/:::/    /   /:::/    / \\/____/  \\:::\\    \\      \\/____/  \\/____/ \\:::\\/:::/    /
  \\:::\\   \\::::::/    /            \\::::::/    /   /:::/    /            \\:::\\    \\                       \\::::::/    /
   \\:::\\   \\::::/    /              \\::::/    /   /:::/    /              \\:::\\    \\                       \\::::/    /
    \\:::\\  /:::/    /               /:::/    /    \\::/    /                \\:::\\    \\                      /:::/    /
     \\:::\\/:::/    /               /:::/    /      \\/____/                  \\:::\\    \\                    /:::/    /
      \\::::::/    /               /:::/    /                                 \\:::\\    \\                  /:::/    /
       \\::::/    /               /:::/    /                                   \\:::\\____\\                /:::/    /
        \\::/____/                \\::/    /                                     \\::/    /                \\::/    /
         ~~                       \\/____/                                       \\/____/                  \\/____/
''';

  /// The description
  static const _description =
      'A lightweight and powerful Job Scheduling Framework.';

  /// The credit
  static const _credit = '''  Version: ${Version.current}
  License: BSD 3-Clause
  Author : Kato Shinya (https://github.com/myConsciousness)''';

  @override
  FutureOr<String> build() => '''
$_line
$_logo
$_line
${_description.padLeft(_description.length + 36)}
$_line

$_credit

$_line
''';
}
