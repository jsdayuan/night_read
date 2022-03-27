import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:night_read/jsons/photo_data.dart';
import 'package:night_read/jsons/post_data.dart';
import 'package:night_read/states/language.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'routes/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<Language>(create: (_) => Language())],
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: context.watch<Language>().locale,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: (RouteSettings settings) {
            print(settings);
            final routeBuild = routes[settings.name];
            if (routeBuild != null) {
              return MaterialPageRoute(
                  builder: (context) => routeBuild(context),
                  settings: settings);
            }
          },
        );
      }),
    );
  }
}
