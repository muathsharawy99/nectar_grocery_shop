import "dart:developer";

enum LogColor { white, red, green, yellow, blue }

class LoggerDebug {
  LoggerDebug({this.headColor = "", this.constTitle, this.enabled = true});

  final String headColor;
  final String? constTitle;
  final bool enabled;

  void white(String message) => _print(message, LogColor.white);
  void red(String message) => _print(message, LogColor.red);
  void green(String message) => _print(message, LogColor.green);
  void yellow(String message) => _print(message, LogColor.yellow);
  void blue(String message) => _print(message, LogColor.blue);

  void _print(String message, LogColor color) {
    if (!enabled) return;
    final code = switch (color) {
      LogColor.white => LogColors.white,
      LogColor.red => LogColors.red,
      LogColor.green => LogColors.green,
      LogColor.yellow => LogColors.yellow,
      LogColor.blue => LogColors.blue,
    };
    final name = constTitle ?? "";
    final header = name.isNotEmpty ? "$headColor$name${LogColors.reset}\n" : "";
    log("$header$code$message${LogColors.reset}");
  }
}

class LogColors {
  static const String reset = "\x1B[0m";
  static const String white = "\x1B[97m";
  static const String red = "\x1B[91m";
  static const String green = "\x1B[92m";
  static const String yellow = "\x1B[93m";
  static const String blue = "\x1B[94m";
}
