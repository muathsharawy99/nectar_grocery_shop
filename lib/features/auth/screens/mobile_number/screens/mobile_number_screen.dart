import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nectaar/core/extensions/unified_extensions.dart';
import 'package:nectaar/gen/locale_keys.g.dart';

import '../../../widgets/auth_page_title.dart';
import '../../../widgets/auth_scaffold.dart';

/// Mobile number entry (UI only), "next" → the code page.
class MobileNumberScreen extends StatelessWidget {
  const MobileNumberScreen({super.key});

  /// UI-only check kept from the old screen: the demo number is 0123456789.
  void _onSubmitted(String value) {
    if (value != '0123456789') {
      FlashHelper.showToast(LocaleKeys.auth_demo_number_hint.tr());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      withBack: true,
      onNext: () => push(NamedRoutes.verify),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthPageTitle(title: LocaleKeys.auth_enter_mobile_number.tr()),
          AppField(
            title: LocaleKeys.auth_mobile_number.tr(),
            hintText: LocaleKeys.auth_mobile_number.tr(),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: _onSubmitted,
          ),
        ],
      ),
    );
  }
}
