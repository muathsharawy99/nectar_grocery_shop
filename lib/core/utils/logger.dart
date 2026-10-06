import "dart:developer";

enum LogColor { black, white, red, green, yellow, blue, cyan }

class LoggerDebug {
  LoggerDebug({this.headColor = "", this.constTitle, this.enabled = true});

  final String headColor;
  final String? constTitle;
  final bool enabled;

  void black(String message, [String? title]) =>
      _print(message, LogColor.black, title);
  void white(String message, [String? title]) =>
      _print(message, LogColor.white, title);
  void red(String message, [String? title]) =>
      _print(message, LogColor.red, title);
  void green(String message, [String? title]) =>
      _print(message, LogColor.green, title);
  void yellow(String message, [String? title]) =>
      _print(message, LogColor.yellow, title);
  void blue(String message, [String? title]) =>
      _print(message, LogColor.blue, title);
  void cyan(String message, [String? title]) =>
      _print(message, LogColor.cyan, title);

  void _print(String message, LogColor color, String? title) {
    if (!enabled) return;
    final code = _toAnsi(color);
    final name = title ?? constTitle ?? "";
    final header = name.isNotEmpty ? "$headColor$name${LogColors.reset}\n" : "";
    log("$header$code$message${LogColors.reset}");
  }

  String _toAnsi(LogColor color) {
    switch (color) {
      case LogColor.black:
        return LogColors.black;
      case LogColor.white:
        return LogColors.white;
      case LogColor.red:
        return LogColors.red;
      case LogColor.green:
        return LogColors.green;
      case LogColor.yellow:
        return LogColors.yellow;
      case LogColor.blue:
        return LogColors.blue;
      case LogColor.cyan:
        return LogColors.cyan;
    }
  }
}

class LogColors {
  static const String reset = "\x1B[0m";
  static const String black = "\x1B[30m";
  static const String white = "\x1B[97m";
  static const String red = "\x1B[91m";
  static const String green = "\x1B[92m";
  static const String yellow = "\x1B[93m";
  static const String blue = "\x1B[94m";
  static const String cyan = "\x1B[36m";
}
