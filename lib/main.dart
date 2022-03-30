import 'package:flutter/material.dart';
import 'package:night_read/states/language.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'common/global.dart';
import 'routes/index.dart';

void main() => Global.init().then((value) => runApp(const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Language>(create: (_) => Language()),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: context.watch<Language>().locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.blueGrey, brightness: Brightness.dark),
          onGenerateRoute: (RouteSettings settings) {
            final isLogin = Global.isLogin;
            final routeBuild = routes[settings.name];

            if (!isLogin && settings.name != 'registry') {
              final loginPageBuilder = routes['login'];
              return MaterialPageRoute(
                  builder: (context) => loginPageBuilder!(context),
                  settings: settings);
            }

            if (routeBuild != null) {
              return MaterialPageRoute(
                  builder: (context) => routeBuild(context),
                  settings: settings);
            }
            return null;
          },
        );
      }),
    );
  }
}
