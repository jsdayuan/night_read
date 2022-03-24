import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:night_read/jsons/photo_data.dart';
import 'package:night_read/jsons/post_data.dart';
import 'package:night_read/states/language.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          locale: context.read<Language>().locale,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.helloWorld,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // var response =
          //     await Dio().get('https://jsonplaceholder.typicode.com/posts/1');
          // var p = PostData.fromJson(response.data);
          // print(p.title);

          // final response =
          //     await Dio().get('https://jsonplaceholder.typicode.com/photos');
          // List<PhotoData> p = getPhotoDataList(response.data);
          // print(p[0].url);

          // context.read<Language>().setLocal(Locale('en'));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
