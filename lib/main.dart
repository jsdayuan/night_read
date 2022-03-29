import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:night_read/jsons/photo_data.dart';
import 'package:night_read/jsons/post_data.dart';
import 'package:night_read/jsons/user_data.dart';
import 'package:night_read/states/language.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'routes/index.dart';
import 'utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Language>(create: (_) => Language()),
        FutureProvider<UserData?>(
            create: (context) async {
              final prefs = await SharedPreferences.getInstance();

              var userJson = prefs.getString('user');
              if (userJson == null) {
                return null;
              }
              return UserData.fromJson(jsonDecode(userJson));
            },
            initialData: null),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: context.watch<Language>().locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            brightness: Brightness.dark
          ),
          onGenerateRoute: (RouteSettings settings) {
            final user = context.read<UserData?>();
            final routeBuild = routes[settings.name];

            if (user == null) {
              final loginPageBuilder = routes['/login'];
              return MaterialPageRoute(
                  builder: (context) => loginPageBuilder!(context),
                  settings: settings);
            }

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
