import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/extensions/unified_extensions.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/service_locator.dart';
import 'core/services/shared_preference.dart';
import 'core/utils/theme/light_theme.dart';
import 'core/utils/unfocus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint('Uncaught error: $error');
    debugPrintStack(stackTrace: stack);
    return true;
  };
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Future.wait([
    lang.EasyLocalization.ensureInitialized(),
    ScreenUtil.ensureScreenSize(),
    CacheHelper.init(),
  ]);

  Bloc.observer = AppBlocObserver();
  UserModel.i.get();
  ServicesLocator().init();
  runApp(const Nectar());
}

class Nectar extends StatelessWidget {
  const Nectar({super.key});

  @override
  Widget build(BuildContext context) {
    return lang.EasyLocalization(
      path: 'assets/translations',
      saveLocale: true,
      startLocale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      supportedLocales: const [Locale('en'), Locale('ar')],
      child: ScreenUtilInit(
        designSize: AppConstants.appSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Nectar',
            themeMode: ThemeMode.light,
            initialRoute: AppRoutes.init.initial,
            routes: AppRoutes.init.appRoutes,
            navigatorKey: navigator,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: LightTheme.getTheme(fontFamily: context.fontFamily),
            builder: (context, child) {
              ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                // Always dump the real error to the console; show Flutter's
                // error widget in debug/profile and hide it only in release.
                FlutterError.dumpErrorToConsole(errorDetails);
                if (kReleaseMode) {
                  return const SizedBox.shrink();
                }
                return ErrorWidget(errorDetails.exception);
              };
              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: TextScaler.linear(1.sp)),
                child: Unfocus(child: child ?? const SizedBox.shrink()),
              );
            },
          );
        },
      ),
    );
  }
}
