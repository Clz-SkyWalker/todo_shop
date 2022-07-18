import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'logic/const/app_const.dart';
import 'logic/manager/export_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initGetItManager();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (ctx, ref, child) {
        final appState = ref.watch(stateAppBaseProvider.notifier);
        appState.init();
        return ScreenUtilInit(
          designSize: const Size(AppConst.width, AppConst.height),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (ctx, child) => MaterialApp.router(
            title: 'TODO SHOP',
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              // Locale('en', 'US'), // English, no country code
              Locale('zh', 'CN'), // Spanish, no country code
            ],
            theme: IThemeManager.createTheme(switchTheme(appState.getTheme)),
            debugShowCheckedModeBanner: false,
            routerDelegate: getManager.get<RouterManager>(),
            routeInformationParser: const RouterInfoParser(),
          ),
        );
      },
    );
  }
}
