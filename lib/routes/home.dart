import 'package:flutter/material.dart';
import 'package:night_read/utils/color.dart';

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
          title: const Text('Reserve Player'),
          backgroundColor: HexColor('#1e2632'),
        ),
        body: Row(
          children: [
            Expanded(
                child: Column(
              children: [Text('hello world')],
            ))
          ],
        ));
  }
}
