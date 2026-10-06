import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget get center => Align(alignment: Alignment.center, child: this);

  Widget get toEnd =>
      Align(alignment: AlignmentDirectional.centerEnd, child: this);

  Widget withPadding({
    double all = 0.0,
    double vertical = 0.0,
    double horizontal = 0.0,
    double top = 0.0,
    double bottom = 0.0,
    double start = 0.0,
    double end = 0.0,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: all + vertical + top,
        bottom: all + vertical + bottom,
        start: all + horizontal + start,
        end: all + horizontal + end,
      ),
      child: this,
    );
  }

  /// add tap to parent widget
  Widget onTap(VoidCallback? function, {BorderRadius? borderRadius}) {
    return InkWell(onTap: function, borderRadius: borderRadius, child: this);
  }

  /// add Expanded to parent widget
  Widget expand({int flex = 1}) => Expanded(flex: flex, child: this);

  /// add Flexible to parent widget
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: this);
}

extension ExtensionGlobalKeys on GlobalKey<FormState> {
  bool get isValid => currentState?.validate() ?? false;
}
